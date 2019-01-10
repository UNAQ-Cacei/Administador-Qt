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
import QtQuick.Controls 1.4
import Qt.labs.settings 1.0

import "../Componentes"

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
    // Indice del profesor seleccionado
    //
    property int profesorSeleccionado: 0

    //
    // Definir titulo de la ventana
    //
    title: AppName

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
        onModificarDatosExistentes: window.modificarDatosExistentes()
        onAbrirBaseDeDatosExistente: window.abrirBaseDeDatosExistente()
    }

    //
    // Cargar datos del primer profesor al abrir la Db
    //
    Connections {
        target: CAdministradorDb
        onBaseDeDatosCambiada: {
            if (CAdministradorDb.profesores.lenght > 0)
                profesorSeleccionado = 0
            else
                profesorSeleccionado = -1
        }
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
        //
        // Esconder y deshabilitar el centro de bienvenida si
        // la base de datos esta abierta
        //
        enabled: opacity > 0
        opacity: CAdministradorDb.disponible ? 0 : 1
        Behavior on opacity { NumberAnimation{} }

        //
        // Expandir el centro de bienvenida por toda la ventana
        //
        anchors {
            fill: parent
            margins: app.spacing
        }

        //
        // Definir espacio entre controles
        //
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

        //
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
        }

        //
        // Espaciador
        //
        Item {
            Layout.fillHeight: true
        }
    }

    //
    // Visualizador de base de datos
    //
    RowLayout {
        //
        // Mostrar y habilitar el visualizador si la base de datos esta abierta
        //
        enabled: opacity > 0
        opacity: CAdministradorDb.disponible ? 1 : 0
        Behavior on opacity { NumberAnimation{} }

        //
        // Expandir el visualizador por toda la ventana
        //
        anchors {
            fill: parent
            margins: app.spacing
        }

        //
        // Definir espacio entre controles
        //
        spacing: app.spacing

        //
        // Seleccionador de profesores
        //
        TabView {
            id: tabView
            visible: enabled
            enabled: opacity > 0
            Layout.fillWidth: false
            Layout.fillHeight: true
            Layout.minimumWidth: 296
            opacity: CAdministradorDb.profesores.length > 0 ? 1 : 0
            Behavior on opacity { NumberAnimation {} }

            Tab {
                title: qsTr ("Profesores")

                ScrollView {
                    anchors.fill: parent
                    anchors.topMargin: 2

                    ListView {
                        clip: true
                        id: profesores
                        spacing: app.spacing
                        model: CAdministradorDb.profesores
                        boundsBehavior: Flickable.StopAtBounds
                        flickableDirection: Flickable.VerticalFlick

                        Connections {
                            target: window
                            onProfesorSeleccionadoChanged: profesores.currentIndex = window.profesorSeleccionado
                        }

                        onCurrentIndexChanged: {
                            window.profesorSeleccionado = currentIndex
                            detallesProf.leerDatos(currentIndex + 1)
                        }

                        delegate: Rectangle {
                            width: parent.width
                            height: 24 + 2 * app.spacing
                            color: ListView.isCurrentItem ? Qt.rgba(0,0,1,0.4) : "transparent"

                            Behavior on color { ColorAnimation{} }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: profesores.currentIndex = index
                            }

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: app.spacing

                                Image {
                                    sourceSize: Qt.size(24,24)
                                    source: "qrc:/iconos/info.svg"
                                    Layout.alignment: Qt.AlignVCenter
                                }

                                Label {
                                    text: modelData
                                    elide: Text.ElideRight
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignVCenter
                                }
                            }
                        }
                    }
                }
            }
        }

        //
        // Mostrar datos del profesor seleccionado
        //
        ColumnLayout {
            visible: enabled
            enabled: opacity > 0
            spacing: app.spacing
            Layout.fillWidth: enabled
            Layout.fillHeight: enabled
            opacity: CAdministradorDb.profesores.length > 0 ? 1 : 0

            Behavior on opacity { NumberAnimation {} }

            DetallesProfesor {
                id: detallesProf
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            RowLayout {
                spacing: app.spacing
                Layout.fillWidth: true

                Button {
                    text: qsTr("Eliminar Profesor")
                    onClicked: CAdministradorDb.eliminarProfesor(profesorSeleccionado + 1, false, true)
                }

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    text: qsTr("Cancelar Modificaciones")
                    onClicked: detallesProf.leerDatos(profesorSeleccionado + 1)
                }

                Button {
                    text: qsTr("Guardar Cambios")
                    onClicked: detallesProf.guardarDatos(profesorSeleccionado + 1)
                }
            }
        }

        //
        // Registrar nuevo profesor
        //
        ColumnLayout {
            visible: enabled
            enabled: opacity > 0
            Layout.fillWidth: enabled
            Layout.fillHeight: enabled
            opacity: CAdministradorDb.profesores.length > 0 ? 0 : 1
            Behavior on opacity { NumberAnimation{} }

            //
            // Definir espacio entre controles
            //
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
                text: qsTr("No hay profesores registrados")
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

            //
            // Botones
            //
            Button {
                onClicked: nuevoProfesor()
                Layout.preferredWidth: 260
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Registrar Nuevo Profesor")
                iconSource: "qrc:/iconos/registrar-profesor.svg"
            }

            //
            // Espaciador
            //
            Item {
                Layout.fillHeight: true
            }
        }
    }

    //
    // Barra de estado
    //
    statusBar: StatusBar {
        visible: enabled
        enabled: opacity > 0
        opacity: CAdministradorDb.disponible ? 1 : 0
        Behavior on opacity { NumberAnimation{} }

        Label {
            text: qsTr("Ubicación de DB: %1").arg (CAdministradorDb.ubicacionBaseDeDatos)

            anchors {
                left: parent.left
                leftMargin: app.spacing
                verticalCenter: parent.verticalCenter
            }
        }
    }
}
