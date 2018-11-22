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
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0

Window {
    id: window

    //
    // Opciones de ventana
    //
    title: qsTr("Registrar Nuevo Profesor")
    flags: Qt.Dialog |
           Qt.WindowTitleHint |
           Qt.WindowSystemMenuHint |
           Qt.WindowCloseButtonHint |
           Qt.WindowMinMaxButtonsHint

    //
    // Definir tamaño de ventana
    //
    minimumWidth: layout.implicitWidth + 2 * app.spacing
    minimumHeight: layout.implicitHeight + 2 * app.spacing

    //
    // Controles del dialogo
    //
    ColumnLayout {
        id: layout
        spacing: app.spacing
        anchors.fill: parent
        anchors.margins: app.spacing

        //
        // Cargador de datos
        //
        TabView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 820
            Layout.minimumHeight: 640

            Tab {
                title: qsTr("Datos Personales")

                ColumnLayout {
                    GridLayout {
                        columns: 2
                        Layout.fillWidth: true
                        rowSpacing: app.spacing
                        columnSpacing: app.spacing
                        Layout.margins: 2 * app.spacing

                        Label {
                            text: qsTr ("Nombres") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr ("Apellido Paterno") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr ("Apellido Materno") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr ("Fecha de Nacimiento") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr ("Lugar de Nacimiento") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr ("Género") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        ComboBox {
                            Layout.fillWidth: true
                            model: [
                                qsTr("Femenino"),
                                qsTr("Masculino"),
                                qsTr("No Especificado")
                            ]
                        }

                        Label {
                            text: qsTr ("Número de Hijos") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr ("Estado Civil") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        ComboBox {
                            Layout.fillWidth: true
                            model: [
                                qsTr("Casado/a"),
                                qsTr("Divorciado/a"),
                                qsTr("Soltero/a"),
                                qsTr("Viudo/a"),
                                qsTr("Comprometido/a"),
                                qsTr("No Especificado")
                            ]
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                    }
                }
            }

            Tab {
                title: qsTr("Datos Generales")

                ColumnLayout {
                    GridLayout {
                        columns: 2
                        Layout.fillWidth: true
                        rowSpacing: app.spacing
                        columnSpacing: app.spacing
                        Layout.margins: 2 * app.spacing

                        Label {
                            horizontalAlignment: Label.AlignRight
                            text: qsTr ("Número de Empleado") + ":"
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr("Categoría de Contratación") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr("Contratación por Plaza") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        CheckBox {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr("Antigüedad en la Institución") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr("Adscripción") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr("Programa(s) Impartido(s)") + ":"
                            horizontalAlignment: Label.AlignRight
                        }

                        TextField {
                            Layout.fillWidth: true
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                    }
                }
            }

            Tab {
                title: qsTr("Formación Académica")

                GridLayout {
                    columns: 2
                    rowSpacing: app.spacing
                    columnSpacing: app.spacing

                    GroupBox {
                        Layout.fillWidth: true

                        title: qsTr("Licenciatura")
                        Layout.margins: app.spacing

                        GridLayout {
                            columns: 2
                            anchors.fill: parent
                            rowSpacing: app.spacing
                            columnSpacing: app.spacing
                            anchors.margins: app.spacing

                            Label {
                                text: qsTr("Titulo Profesional") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Institución") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("País de Egreso") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Cédula Profesional") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Año de Obtención") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Estatus Final") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }
                        }
                    }

                    GroupBox {
                        Layout.fillWidth: true

                        title: qsTr("Maestría")
                        Layout.margins: app.spacing

                        GridLayout {
                            columns: 2
                            anchors.fill: parent
                            rowSpacing: app.spacing
                            columnSpacing: app.spacing
                            anchors.margins: app.spacing

                            Label {
                                text: qsTr("Titulo Profesional") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Institución") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("País de Egreso") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Cédula Profesional") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Año de Obtención") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Línea Terminal") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Estatus Final") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }
                        }
                    }

                    GroupBox {
                        Layout.fillWidth: true

                        title: qsTr("Doctorado")
                        Layout.margins: app.spacing

                        GridLayout {
                            columns: 2
                            anchors.fill: parent
                            rowSpacing: app.spacing
                            columnSpacing: app.spacing
                            anchors.margins: app.spacing

                            Label {
                                text: qsTr("Titulo Profesional") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Institución") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("País de Egreso") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Cédula Profesional") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Año de Obtención") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Estatus Final") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }
                        }
                    }

                    GroupBox {
                        Layout.fillWidth: true

                        title: qsTr("Especialidad")
                        Layout.margins: app.spacing

                        GridLayout {
                            columns: 2
                            anchors.fill: parent
                            rowSpacing: app.spacing
                            columnSpacing: app.spacing
                            anchors.margins: app.spacing

                            Label {
                                text: qsTr("Área") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Institución") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("País de Egreso") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Cédula Profesional") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Año de Obtención") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }

                            Label {
                                text: qsTr("Estatus Final") + ":"
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField {
                                Layout.fillWidth: true
                            }
                        }
                    }
                }
            }

            Tab {
                title: qsTr("Cursos y Certificaciones")
            }

            Tab {
                title: qsTr("Experiencia")
            }
        }

        //
        // Botones
        //
        RowLayout {
            spacing: app.spacing
            Layout.fillWidth: true

            Item {
                Layout.fillWidth: true
            }

            Button {
                text: qsTr("Cancelar")
            }

            Button {
                text: qsTr("Registrar")
            }
        }
    }
}
