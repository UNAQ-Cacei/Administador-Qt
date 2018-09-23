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
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import Qt.labs.settings 1.0

ApplicationWindow {
    id: window

    //
    // Definir geometría default de la ventana
    //
    width: 800
    height: 600
    minimumHeight: 520
    minimumWidth: 360

    //
    // Definir titulo de la ventana
    //
    title: CAdministradorDb.disponible ? qsTr("%1 - %2").arg(CAdministradorDb.ubicacionBaseDeDatos).arg(AppName) : AppName

    //
    // Definir señales
    //
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
    signal importarBaseDeDatosExcel()
    signal abrirBaseDeDatosExistente()

    //
    // Guardar posición y tamaño de la ventana automáticamente
    //
    Settings {
        property alias _x: window.x
        property alias _y: window.y
        property alias _w: window.width
        property alias _h: window.height
    }

    //
    // Definir barra de menu de la ventana
    //
    menuBar: Menubar {
        onSalir: window.close()
        onAcercaDe: window.acercaDe()
        onNuevoProfesor: window.nuevoProfesor()
        onNuevaBaseDeDatos: window.nuevaBaseDeDatos()
        onCerrarBaseDeDatos: window.cerrarBaseDeDatos()
        onGenerarReporteDeArea: window.generarReporteDeArea()
        onGenerarReporteGeneral: window.generarReporteGeneral()
        onImportarBaseDeDatosExcel: window.importarBaseDeDatosExcel()
        onAbrirBaseDeDatosExistente: window.abrirBaseDeDatosExistente()
        onGenerarReporteIndividual: window.generarReporteIndividual()
        onModificarDatosExistentes: window.modificarDatosExistentes()
        onEstadisticasBaseDeDatos: window.estadisticasBaseDeDatos()
    }

    //
    // Definir barra de herramientas
    //
    toolBar: Toolbar {
        onNuevoProfesor: window.nuevoProfesor()
        onNuevaBaseDeDatos: window.nuevaBaseDeDatos()
        onEstadisticasBaseDeDatos: window.estadisticasBaseDeDatos()
        onImportarBaseDeDatosExcel: window.importarBaseDeDatosExcel()
        onModificarDatosExistentes: window.modificarDatosExistentes()
        onAbrirBaseDeDatosExistente: window.abrirBaseDeDatosExistente()
    }

    //
    // Rectangulo de fondo
    //
    Rectangle {
        color: "#fff"
        anchors.fill: parent
    }

    //
    // Centro de bienvenida
    //
    ColumnLayout {
        anchors {
            fill: parent
            margins: app.spacing
        }

        spacing: app.spacing

        //
        // Espaciador
        //
        Item {
            Layout.fillHeight: true
        }

        //
        // Logo de la UNAQ
        //
        Image {
            source: "qrc:/imagenes/unaq.png"
            Layout.alignment: Qt.AlignHCenter
        }

        //
        // Espaciador
        //
        Item {
            Layout.preferredHeight: app.spacing
        }

        //
        // Texto de bienvenida
        //
        Text {
            font.bold: true
            font.pixelSize: 24
            Layout.fillWidth: true
            text: qsTr("Bienvenido/a")
            horizontalAlignment: Text.AlignHCenter
        } Text {
            opacity: 0.8
            font.pixelSize: 16
            Layout.fillWidth: true
            text: qsTr("Seleccione una de las siguientes opciones") + "..."
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        //
        // Espaciador
        //
        Item {
            Layout.preferredHeight: app.spacing
        }

        //s
        // Botones
        //
        Button {
            Layout.preferredWidth: 260
            Layout.alignment: Qt.AlignHCenter
            iconSource: "qrc:/iconos/abrir.svg"
            onClicked: abrirBaseDeDatosExistente()
            text: qsTr("Abrir Base de Datos Existente")
        } Button {
            Layout.preferredWidth: 260
            onClicked: nuevaBaseDeDatos()
            Layout.alignment: Qt.AlignHCenter
            iconSource: "qrc:/iconos/nuevo-db.svg"
            text: qsTr("Crear Base de Datos Vacía")
        } Button {
            Layout.preferredWidth: 260
            Layout.alignment: Qt.AlignHCenter
            iconSource: "qrc:/iconos/excel.svg"
            onClicked: importarBaseDeDatosExcel()
            text: qsTr("Importar Base de Datos de Excel")
        }

        //
        // Espaciador
        //
        Item {
            Layout.fillHeight: true
        }
    }
}
