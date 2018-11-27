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

class Profesor;

class AdministradorDb : public QObject
{
    Q_OBJECT
    Q_PROPERTY (bool disponible
                READ disponible
                NOTIFY baseDeDatosCambiada)
    Q_PROPERTY (QString ubicacionBaseDeDatos
                READ ubicacionBaseDeDatos
                NOTIFY baseDeDatosCambiada)

signals:
    void baseDeDatosCambiada();

public:
    ~AdministradorDb();

    bool disponible();
    QSqlDatabase& baseDeDatos();
    QString ubicacionBaseDeDatos() const;

    static AdministradorDb* instancia();

    Profesor* registrarProfesor();
    Q_INVOKABLE Profesor* obtenerProfesor (const int id);

public slots:
    void acercaDeQt();
    void nuevaBaseDeDatos();
    void abrirBaseDeDatos();
    void cerrarBaseDeDatos();
    void mostrarEstadisticas();

private slots:
    void configurarBaseDeDatos (const QString& ubicacion);

private:
    QString m_dbUbicacion;
    QSqlDatabase m_database;
    QList<Profesor*> m_profesores;
};

#endif
