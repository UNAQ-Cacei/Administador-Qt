/*
 * Copyright (c) 2018 Los Autores del Proyecto <AUTORES.md>
 *
 * Se concede permiso, libre de cargos, a cualquier persona que obtenga una
 * copia de este software y de los archivos de documentación asociados
 * (el "Software"),para utilizar el Software sin restricción, incluyendo sin
 * limitación losderechos a usar, copiar, modificar, fusionar, publicar,
 * distribuir, sublicenciar, y/o vender copias del Software, y a permitir a las
 * personas a las que se les proporcione el Software a hacer lo mismo, sujeto a
 * las siguientes condiciones:
 *
 * El aviso de copyright anterior y este aviso de permiso se incluirán en todas
 * las copias o partes sustanciales del Software.
 *
 * EL SOFTWARE SE PROPORCIONA "TAL CUAL", SIN GARANTÍA DE NINGÚN TIPO, EXPRESA O
 * IMPLÍCITA, INCLUYENDO PERO NO LIMITADA A GARANTÍAS DE COMERCIALIZACIÓN,
 * IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN. EN NINGÚN CASO LOS
 * AUTORES O PROPIETARIOS DE LOS DERECHOS DE AUTOR SERÁN RESPONSABLES DE NINGUNA
 * RECLAMACIÓN, DAÑOS U OTRAS RESPONSABILIDADES, YA SEA EN UNA ACCIÓN DE
 * CONTRATO, AGRAVIO O CUALQUIER OTRO MOTIVO, DERIVADAS DE, FUERA DE O EN
 * CONEXIÓN CON EL SOFTWARE O SU USO U OTRO TIPO DE ACCIONES EN EL SOFTWARE.
 */

#include "AdministradorDb.h"

#include <QDir>
#include <QFileDialog>
#include <QMessageBox>
#include <QApplication>

/**
 * Definir tablas validas de la base de datos
 */
static const QStringList TABLAS = {
    "Datos Generales",
    "Datos Personales",
    "Licenciatura",
    "Maestria",
    "Doctorado",
    "Especialidad",
    "Cursos",
    "Certificaciones",
    "Experiencia Laboral"
};


/**
 * Apuntador a la única instancia de está clase
 */
static AdministradorDb* INSTANCE = Q_NULLPTR;

/**
 * @brief AdministradorDb::AdministradorDb
 */
AdministradorDb::AdministradorDb() {
    // Actualizar lista de profesores cuando abrimos/cerramos DB
    connect (this, &AdministradorDb::baseDeDatosCambiada,
             this, &AdministradorDb::profesoresCambiados);
}

/**
 * Cierra la base de datos antes de que la clase
 * sea destruída
 */
AdministradorDb::~AdministradorDb() {
    cerrarBaseDeDatos();
}

/**
 * Regresa la única instancia de la clase.
 * El administrador de la base de datos debe de tener
 * una sola instancia para evitar errores al intentar
 * abrir o manejar la base de datos.
 */
AdministradorDb* AdministradorDb::instancia() {
    if (INSTANCE == Q_NULLPTR)
        INSTANCE = new AdministradorDb();

    return INSTANCE;
}

/**
 * Regresa una lista con los nombres completos de los profesores activos
 */
QStringList AdministradorDb::profesores() {
    QStringList profesores;
    QStringList campos = {"ID", "Apellido Paterno", "Apellido Materno", "Nombres"};
    QList<QList<QVariant>> consulta = ejecutarConsulta(campos, "Datos Personales");

    // Validar resultados
    if (consulta.length() == campos.length()) {
        // Obtener lista de apellidos y nombres
        QList<QVariant> ids = consulta.at (0);
        QList<QVariant> apellidosPaternos = consulta.at(1);
        QList<QVariant> apellidosMaternos = consulta.at(2);
        QList<QVariant> nombres = consulta.at(3);

        // Solo registrar el profesor si las listas de apellidos tiene
        // el mismo numero de elementos que la lista de nombres
        if (nombres.length() == apellidosMaternos.length() &&
                nombres.length() == apellidosPaternos.length()) {
            // Registrar nombre de cada profesor (mientras esten marcados
            // como profesores activos en la institucion)
            for (int i = 0; i < apellidosPaternos.length(); ++i) {
                // Checar si profesor sigue activo en la institucion
                bool activo = (leerDato (ids.at (i).toInt(), "Datos Generales", "Activo") == "1");

                // Registrar nombre
                profesores.append(tr("%1 %2 %3 %4")
                                  .arg(activo ? "" : tr("[INACTIVO]"))
                                  .arg(apellidosPaternos.at(i).toString())
                                  .arg(apellidosMaternos.at(i).toString())
                                  .arg(nombres.at(i).toString()));
            }
        }
    }

    // Regresar lista de profesores
    return profesores;
}

/**
 * Regresa la lista de profesores que contienen el @a nombre definido
 */
QStringList AdministradorDb::buscar (const QString& nombre) {
    // No hay termino de busqueda, regresar lista completa de profesores
    if (nombre.isEmpty())
        return profesores();

    // El termino de busqueda consta de espacios, regresar lista completa
    QString copia = nombre;
    copia.replace(" ", "");
    if (copia.isEmpty())
        return profesores();

    // Buscar termino en lista de profesores
    return profesores().filter(nombre);
}

/**
 * Registra un nuevo profesor en la base de datos y regresa
 * el objeto que permite modificar/leer los datos del nuevo
 * profesor.
 */
int AdministradorDb::registrarProfesor() {
    // Solo intentar registrar el profesor si estamos conectados
    // a la base de datos
    if (disponible()) {
        // Calcular ID
        int id = profesores().count() + 1;

        // Guardar estatus de cada query
        bool ok = true;

        // Agregar nuevo renglon con ID establecido
        foreach (QString tabla, TABLAS) {
            // Generar comando SQL
            QString cmd = tr("INSERT INTO [%1] (ID) VALUES (%2);")
                    .arg(tabla)
                    .arg(id);

            // Ejecutar query
            QSqlQuery query;
            ok &= query.exec(cmd);

            // Terminar query o reportar error
            if (ok)
                query.finish();
            else
                qDebug() << "Error al registrar profesor en tabla" << tabla;
        }

        // Regresar ID de profesor si todo estuvo bien
        if (ok)
            return id;

        // Eliminar profesor si algo no funciono
        else
            eliminarProfesor(id, true, true);
    }

    // Hubo un error al intentar registrar el nuevo profesor
    return -1;
}

/**
 * @brief AdministradorDb::leerDato
 * @param id
 * @param tabla
 * @param identificador
 * @return
 */
QString AdministradorDb::leerDato (const int id,
                                   const QString &tabla,
                                   const QString &identificador) {
    // Terminar funcion si la base de datos no esta abierta y configurada
    // o la identificacion del profesor es invalida
    if (!checarExistenciaProfesor (id))
        return "";

    // Generar commando
    QString commando = tr("SELECT [%1] FROM [%2] WHERE ID=%3")
            .arg(identificador)
            .arg(tabla)
            .arg(id);

    // Ejecutar consulta
    QSqlQuery query;
    if (query.exec(commando) && query.next()) {
        QString str = query.value(0).toString();
        query.finish();
        return str;
    }

    // Regresar valor vacio
    return "";
}

bool AdministradorDb::escribirDato (const int id,
                                    const QString &tabla,
                                    const QString &identificador,
                                    const QString &valor,
                                    const bool obligatorio) {
    // Terminar funcion si la base de datos no esta abierta y configurada
    // o la identificacion del profesor es invalida
    if (!checarExistenciaProfesor (id)) {
        qDebug() << Q_FUNC_INFO << "id invalida";
        return false;
    }

    // Verificar que la tabla existe
    if (!TABLAS.contains(tabla)) {
        qDebug() << Q_FUNC_INFO << "tabla invalida";
        return false;
    }

    // Verificar acampo
    if (identificador.isEmpty()) {
        qDebug() << Q_FUNC_INFO << "datos de identificacion invalidos";
        return false;
    }

    // Checar dato si el valor es obligatorio
    if (obligatorio && valor.isEmpty()) {
        qDebug() << Q_FUNC_INFO << "el campo " << identificador << " es obligatorio!";
        return false;
    }

    // Generar commando
    QString cmdSql = tr("UPDATE [%1] SET [%2] = '%3' WHERE ID = %4;")
            .arg(tabla)
            .arg(identificador)
            .arg(valor)
            .arg(id);

    // Ejecutar commando
    QSqlQuery query;
    if (query.exec(cmdSql)) {
        query.finish();
        return true;
    }

    // Regresar error
    qDebug() << "[ERROR] @ " << Q_FUNC_INFO << ": "
             << query.lastError().text()
             << "\n\t"
             << "Comando SQL: "
             << cmdSql;
    return false;
}

/**
 * Regresa verdadero si el profesor existe en la base de datos
 */
bool AdministradorDb::checarExistenciaProfesor(const int id) {
    return disponible() && id >= 0;
}

/**
 * Regresa @c true si existe una conexión con la base de datos
 */
bool AdministradorDb::disponible() {
    return m_database.isOpen();
}

/**
 * Regresa un apuntador al objeto que administra la base de datos
 */
QSqlDatabase& AdministradorDb::baseDeDatos() {
    return m_database;
}

/**
 * Regresa la ubicación de la base de datos, usada para cambiar
 * el titulo de la ventana
 */
QString AdministradorDb::ubicacionBaseDeDatos() const {
    return m_dbUbicacion;
}

/**
 * @brief AdministradorDb::acercaDeQt
 */
void AdministradorDb::acercaDeQt() {
    QApplication::aboutQt();
}

/**
 * Crea una nueva base de datos en una ubicacion definida
 * por el usuario y la abre
 */
void AdministradorDb::nuevaBaseDeDatos() {
    // Obtener ubicacion para nueva base de datos
    QString db = QFileDialog::getSaveFileName(Q_NULLPTR,
                                              tr("Crear base de datos vacía"),
                                              QDir::homePath(),
                                              tr("Bases de Datos de Access (*.mdb *.accdb)"));

    // Guardar template de base de datos vacía
    if (!db.isEmpty()) {
        // Escribir datos de plantilla a base de datos de salida
        QFile out(db);
        if (out.open(QFile::WriteOnly)) {
            QFile plantilla(":/db/plantilla.mdb");
            if (plantilla.open(QFile::ReadOnly)) {
                if (out.write(plantilla.readAll()) == plantilla.size()) {
                    // Cerrar archivos
                    out.close();
                    plantilla.close();

                    // Abrir base de datos
                    configurarBaseDeDatos(db);

                    // Mostrar mensaje de exito
                    mostrarInfo(tr("Información"),
                                tr("La nueva base de datos fue generada exitosamente!"));

                    // Terminar ejecucion de funcion
                    return;
                }
            }
        }

        // Registrar error
        mostrarError(tr("Error"),
                     tr("Error al crear la nueva base de datos!"));
    }
}

/**
 * Pide al usuario que seleccione una base de datos.
 * Posteriormente, se intenta configurar una conexión a la
 * base de datos seleccionada por el usuario.
 */
void AdministradorDb::abrirBaseDeDatos() {
    // Obtener archivo seleccionado por el usuario
    QString db = QFileDialog::getOpenFileName(Q_NULLPTR,
                                              tr("Seleccionar base de datos"),
                                              QDir::homePath(),
                                              tr("Bases de Datos de Access (*.mdb *.accdb)"));

    // Intentar abrir la base de datos
    if (!db.isEmpty())
        configurarBaseDeDatos(db);
}

/**
 * Termina la conexión con la base de datos actual
 */
void AdministradorDb::cerrarBaseDeDatos() {
    // Checar que la base de datos este abierta
    if (disponible()) {
        // Obtener nombre de conexion (para quitarla despues de cerrar DB)
        QString conexion = baseDeDatos().connectionName();

        // Cerrar DB
        baseDeDatos().close();

        // Quitar conexion y registrar DB vacia
        QSqlDatabase::removeDatabase(conexion);
        m_database = QSqlDatabase();
        m_dbUbicacion = "";

        // Notificar UI
        emit baseDeDatosCambiada();
    }
}

void AdministradorDb::mostrarEstadisticas() {

}

/**
 * Cambia el estado de registro a inactivo del profesor con la ID especificada.
 * Si @a silent es @c true, no se va a mostrar un mensaje de retroalimentacion
 * al usuario.
 */
void AdministradorDb::eliminarProfesor (const int id,
                                        const bool silent,
                                        const bool quitarRegistros) {
    // Registrar estatus de operacion
    bool eliminado = false;

    // La base de datos no esta disponible
    if (!disponible()) {
        mostrarError(tr("Error"),
                     tr("No hay ninguna base de datos cargada por la aplicación!"));
        return;
    }

    // Eliminar profesor completamente
    if (quitarRegistros) {
        // Preguntar antes de eliminar
        if (!silent) {
            QMessageBox box;
            box.setIcon(QMessageBox::Question);
            box.setWindowTitle(tr("Eliminar profesor"));
            box.setText(tr("Esta seguro/a que quiere eliminar este profesor?"));
            box.setStandardButtons(QMessageBox::Yes | QMessageBox::No);
            if (box.exec() != QMessageBox::Yes)
                return;
        }

        // Eliminar profesor de la base de datos
        bool ok = true;
        foreach (QString tabla, TABLAS) {
            QString cmd = tr("DELETE FROM [%1] WHERE ID=%2").arg(tabla).arg(id);
            QSqlQuery query;
            ok &= query.exec(cmd);

            if (ok)
                query.finish();
        }

        // Actualizar lista de profesores
        emit profesoresCambiados();
    }

    // Cambiar estado de profesor de activo a inactivo
    else
        eliminado = escribirDato(id, "Datos Generales", "Activo", "0");

    // Mostrar mensaje de exito
    if (!silent && eliminado) {
        mostrarInfo(tr("Profesor eliminado"),
                    tr("El profesor fue eliminado de la base de datos exitosamente"));
    }

    // Actualizar lista de profesores
    emit profesoresCambiados();
}

/**
 * Genera un message box para fines informativos
 */
void AdministradorDb::mostrarInfo (const QString &titulo, const QString &texto) {
    QMessageBox::information(Q_NULLPTR, titulo, texto);
}

/**
 * Genera un message box para fines de reporte de errores
 */
void AdministradorDb::mostrarError (const QString &titulo, const QString &texto) {
    QMessageBox::warning(Q_NULLPTR, titulo, texto);
}

/**
 * Intenta establecer una conexión con la base de datos en la @a ubicacion
 * definida. Si hay un error, entonces se va a mostrar una notificacion al
 * usuario.
 */
void AdministradorDb::configurarBaseDeDatos(const QString& ubicacion) {
    // Checar que la ubicacion no este vacía
    if (ubicacion.isEmpty()) {
        mostrarError (tr("Error"),
                      tr("La ubicación de la base de datos no puede estar vacía!"));
        return;
    }

    // Checar que la base de datos existe
    QFileInfo info(ubicacion);
    if (!info.exists() || !info.isFile()) {
        mostrarError(tr("Error"),
                     tr("El archivo \"%1\" no existe!"));
        return;
    }

    // Cerrar base de datos existente
    cerrarBaseDeDatos();

    // Crear DBQ
    QString dbq = ubicacion;

    // Abrir la nueva base de datos
    m_database = QSqlDatabase::addDatabase("QODBC");

    // Implementaciones para cada SO
#if defined (Q_OS_WIN)
    dbq.replace(QChar('/'), "\\");
    m_database.setDatabaseName("Driver={Microsoft Access Driver (*.mdb, *.accdb)};"
                               "DSN='';DBQ=" + dbq + ";");
#elif defined (Q_OS_LINUX)
    m_database.setDatabaseName("Driver=MDBTools;DBQ='" + dbq + "';");
#else
    mostrarError(tr("Error"),
                 tr("Este sistema operativo no está soportado por la "
                    "aplicación!"));
#endif

    // Notificar al usuario si hubo un error
    if (!m_database.open()) {
        QMessageBox message;
        message.setWindowTitle(tr("Error"));
        message.setIcon(QMessageBox::Critical);
        message.setText("<h3>" + tr("Error abriendo la base de datos") + ":</h3>");
        message.setInformativeText(m_database.lastError().text());
        message.setStandardButtons(QMessageBox::Ok);
        message.exec();
        cerrarBaseDeDatos();
    }

    // Actualizar ubicacion de DB
    else
        m_dbUbicacion = ubicacion;

    // Actualizar estado de la aplicacion
    emit baseDeDatosCambiada();
}

/**
 * @brief AdministradorDb::ejecutarConsulta
 * @param campos
 * @param tabla
 *
 * Ejecuta una lectura de la base de datos con una lista de @a campos en la
 * @a tabla definida. Se hacen ajustes para soportar campos y tablas con
 * espacios.
 *
 * @return
 */
QList<QList<QVariant>> AdministradorDb::ejecutarConsulta(const QStringList campos,
                                                         const QString tabla) {
    // Inicializar lista
    QList<QList<QVariant>> resultados;

    // Terminar funcion si la base de datos no esta conectado
    if (!disponible())
        return resultados;

    // Verificar que la tabla existe
    if (!TABLAS.contains(tabla))
        return resultados;

    // Hacer un query individual para cada campo y registrar los resultados
    // en una matriz ("lista de listas")
    for (int i = 0; i < campos.length(); ++i) {
        QList<QVariant> resultadosCampo;

        // Inicializar commando de SELECT
        QString commando;
        commando.append ("SELECT [");
        commando.append (campos.at (i));

        // Generar seccion de tabla
        commando.append ("] FROM [");
        commando.append(tabla);
        commando.append("]");

        // Ejecutar query
        QSqlQuery query;
        query.exec(commando);
        while (query.next())
            resultadosCampo.append(query.value(0));

        // Agregar resultados de query
        resultados.append (resultadosCampo);
    }

    // Regresar resultados
    return resultados;
}
