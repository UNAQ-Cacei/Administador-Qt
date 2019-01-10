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

#include <QtQml>
#include <QQmlEngine>
#include <QApplication>
#include <QStyleFactory>

#include "AppInfo.h"
#include "AdministradorDb.h"

int main (int argc, char** argv)
{
    // Definir nombre, versión y desarollador de la aplicación
    QApplication::setApplicationName (APP_NAME);
    QApplication::setApplicationVersion (APP_VERSION);
    QApplication::setOrganizationName (APP_ORGANIZATION);

#ifdef Q_OS_WIN
    QApplication::setAttribute (Qt::AA_DisableHighDpiScaling);
#else
    QApplication::setAttribute (Qt::AA_EnableHighDpiScaling);
#endif

    // Crear aplicacion
    QApplication app (argc, argv);
    app.setStyle (QStyleFactory::create ("fusion"));

    // Init. modulos C++/QML
    AdministradorDb* dbAdmin = AdministradorDb::instancia();

    // Inicializar interfáz gráfica
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty ("AppName", app.applicationName());
    engine.rootContext()->setContextProperty ("AppCompany", app.organizationName());
    engine.rootContext()->setContextProperty ("AppVersion", app.applicationVersion());
    engine.rootContext()->setContextProperty ("CAdministradorDb", dbAdmin);
    engine.load (QUrl (QStringLiteral ("qrc:/qml/main.qml")));

    // Salir de la aplicaction si la interfáz QML tiene un error
    if (engine.rootObjects().isEmpty())
        return EXIT_FAILURE;

    // Correr aplication
    return app.exec();
}
