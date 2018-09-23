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
    title: qsTr("Buscar Profesor") + "..."

    //
    // Emitido cuando el usuario encuentra un
    // profesor y oprime el boton de OK
    //
    signal profesorSeleccionado(int id)

    //
    // Opciones de ventana
    //
    flags: Qt.Dialog |
           Qt.WindowTitleHint |
           Qt.WindowSystemMenuHint |
           Qt.WindowCloseButtonHint |
           Qt.WindowStaysOnTopHint

    //
    // Definir tamaño fijo de ventana
    //
    maximumWidth: minimumWidth
    maximumHeight: minimumHeight
    minimumWidth: layout.implicitWidth + 2 * app.spacing
    minimumHeight: layout.implicitHeight + 2 * app.spacing

    //
    // Controles del dialogo
    //
    ColumnLayout {
        id: layout
        spacing: app.spacing
        anchors.centerIn: parent

        Label {
            font.bold: true
            text: qsTr("Nombre de profesor/a:")
        }

        TextField {
            Layout.fillWidth: true
            Layout.minimumWidth: 250
            placeholderText: qsTr("Escribir un nombre") + "..."
        }

        Label {
            font.bold: true
            text: qsTr("Resultados:")
        }

        ComboBox {
            id: resultados
            model: []
            enabled: count > 0
            Layout.fillWidth: true
        }

        Item {
            height: app.spacing
        }

        GroupBox {
            title: qsTr("Opciones de Busqueda")
            Layout.fillWidth: true
            Layout.fillHeight: true

            GridLayout {
                columns: 2
                anchors.fill: parent
                rowSpacing: app.spacing
                columnSpacing: app.spacing
                anchors.margins: app.spacing

                CheckBox {
                    text: qsTr("Limitar por género")
                }

                ComboBox {
                    Layout.fillWidth: true
                    model: [
                        qsTr("Femenino"),
                        qsTr("Masculino")
                    ]
                }

                CheckBox {
                    text: qsTr("Limitar por área")
                }

                ComboBox {
                    Layout.fillWidth: true
                    model: [
                        qsTr("Ingeniería"),
                        qsTr("TSU"),
                        qsTr("Posgrado")
                    ]
                }

                CheckBox {
                    text: qsTr("Limitar por tipo")
                }

                ComboBox {
                    Layout.fillWidth: true
                }
            }
        }

        Item {
            height: app.spacing
        }

        RowLayout {
            spacing: app.spacing
            Layout.fillWidth: true

            Item {
                Layout.fillWidth: true
            }

            Button {
                text: qsTr("Cancelar")
                onClicked: window.close()
            }

            Button {
                text: qsTr("Siguiente")
                enabled: resultados.count > 0
            }
        }
    }
}
