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

import QtQuick 2.0
import QtQuick.Controls 1.0

MenuBar {
    id: menu

    signal salir()
    signal acercaDe()
    signal reportarError()
    signal nuevoProfesor()
    signal nuevaBaseDeDatos()
    signal cerrarBaseDeDatos()
    signal generarReporteDeArea()
    signal generarReporteGeneral()
    signal estadisticasBaseDeDatos()
    signal generarReporteIndividual()
    signal modificarDatosExistentes()
    signal abrirBaseDeDatosExistente()

    Menu {
        title: qsTr("Archivo")

        MenuItem {
            onTriggered: nuevaBaseDeDatos()
            iconSource: "qrc:/iconos/nuevo-db.svg"
            text: qsTr("Nueva base de datos") + "..."
        }

        MenuItem {
            iconSource: "qrc:/iconos/abrir.svg"
            onTriggered: abrirBaseDeDatosExistente()
            text: qsTr("Abrir base de datos") + "..."
        }

        MenuItem {
            iconSource: "qrc:/iconos/info.svg"
            enabled: CAdministradorDb.disponible
            onTriggered: estadisticasBaseDeDatos()
            text: qsTr("Estadísticas de la base de datos") + "..."
        }

        MenuItem {
            onTriggered: cerrarBaseDeDatos()
            text: qsTr("Cerrar base de datos")
            iconSource: "qrc:/iconos/cerrar.svg"
            enabled: CAdministradorDb.disponible
        }

        MenuSeparator{}

        MenuItem {
            text: qsTr("Salir")
            onTriggered: salir()
            iconSource: "qrc:/iconos/salir.svg"
        }
    }

    Menu {
        title: qsTr("Reportes")

        MenuItem {
            iconSource: "qrc:/iconos/reporte.svg"
            onTriggered: generarReporteIndividual()
            text: qsTr("Generar reporte individual")
            enabled: CAdministradorDb.disponible && CAdministradorDb.profesores.length > 0
        }

        MenuSeparator {}

        MenuItem {
            iconSource: "qrc:/iconos/auto.svg"
            onTriggered: generarReporteDeArea()
            text: qsTr("Generar reporte de academia/área") + "..."
            enabled: CAdministradorDb.disponible && CAdministradorDb.profesores.length > 0
        }

        MenuItem {
            iconSource: "qrc:/iconos/auto.svg"
            onTriggered: generarReporteGeneral()
            text: qsTr("Generar reporte de todos los profesores")
            enabled: CAdministradorDb.disponible && CAdministradorDb.profesores.length > 0
        }
    }

    Menu {
        title: qsTr("Profesores")

        MenuItem {
            onTriggered: nuevoProfesor()
            enabled: CAdministradorDb.disponible
            iconSource: "qrc:/iconos/registrar-profesor.svg"
            text: qsTr("Registrar nuevo profesor(a)") + "..."
        }

        MenuItem {
            onTriggered: modificarDatosExistentes()
            iconSource: "qrc:/iconos/editar-informacion.svg"
            text: qsTr("Ver/Modificar datos existentes") + "..."
            enabled: CAdministradorDb.disponible && CAdministradorDb.profesores.length > 0
        }
    }

    Menu {
        title: qsTr("Ayuda")

        MenuItem {
            onTriggered: acercaDe()
            text: qsTr("Acerca de") + "..."
            iconSource: "qrc:/iconos/info.svg"
        }

        MenuItem {
            text: qsTr("Acerca de Qt")
            iconSource: "qrc:/iconos/config.svg"
            onTriggered: CAdministradorDb.acercaDeQt()
        }

        MenuSeparator {}

        MenuItem {
            onTriggered: reportarError()
            text: qsTr("Reportar error")
            iconSource: "qrc:/iconos/error.svg"
        }
    }
}

