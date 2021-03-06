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

#ifndef ADMIN_DB_H
#define ADMIN_DB_H

#include <QtSql>
#include <QObject>

class AdministradorDb : public QObject
{
    Q_OBJECT
    Q_PROPERTY (bool disponible
                READ disponible
                NOTIFY baseDeDatosCambiada)
    Q_PROPERTY (QString ubicacionBaseDeDatos
                READ ubicacionBaseDeDatos
                NOTIFY baseDeDatosCambiada)
    Q_PROPERTY (QStringList profesores
                READ profesores
                NOTIFY profesoresCambiados)

signals:
    void profesoresCambiados();
    void baseDeDatosCambiada();

public:
    AdministradorDb();
    ~AdministradorDb();

    bool disponible();
    QSqlDatabase& baseDeDatos();
    QString ubicacionBaseDeDatos() const;

    static AdministradorDb* instancia();

    QStringList profesores();

    Q_INVOKABLE QStringList buscar (const QString& nombre);

    Q_INVOKABLE int registrarProfesor();
    Q_INVOKABLE QString leerDato (const int id,
                                  const QString& tabla,
                                  const QString& identificador);
    Q_INVOKABLE bool escribirDato (const int id,
                                   const QString& tabla,
                                   const QString& identificador,
                                   const QString& valor,
                                   const bool obligatorio = true);
    Q_INVOKABLE bool checarExistenciaProfesor (const int id);


public slots:
    void acercaDeQt();
    void nuevaBaseDeDatos();
    void abrirBaseDeDatos();
    void cerrarBaseDeDatos();
    void mostrarEstadisticas();
    void actualizarListaProfes()
    {
        emit profesoresCambiados();
    }
    void eliminarProfesor (const int id,
                           const bool silent,
                           const bool quitarRegistros = false);

    void mostrarInfo (const QString& titulo,
                      const QString& texto);
    void mostrarError (const QString& titulo,
                       const QString& texto);

private slots:
    void configurarBaseDeDatos (const QString& ubicacion);

private:
    QList<QList<QVariant>> ejecutarConsulta (const QStringList campos,
                                             const QString tabla);

private:
    QString m_dbUbicacion;
    QSqlDatabase m_database;
};

#endif
