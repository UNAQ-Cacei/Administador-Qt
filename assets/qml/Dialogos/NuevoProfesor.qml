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

import "../Componentes"

Window {
    id: window

    //
    // Propiedades custom
    //
    readonly property int idInvalido: -1
    property int idNuevoProfesor: idInvalido

    //
    // Elimina el profesor temporal y esconde la ventana
    //
    function cancelar() {
        if (idNuevoProfesor > idInvalido)
            CAdministradorDb.eliminarProfesor(idNuevoProfesor, true)

        hide()
    }

    //
    // Registra un nuevo profesor y muestra la ventana
    //
    function registrarProfesor() {
        hide()

        if (CAdministradorDb.disponible) {
            idNuevoProfesor = CAdministradorDb.registrarProfesor()

            if (idNuevoProfesor == idInvalido) {
                CAdministradorDb.mostrarError(qsTr("Error"),
                                              qsTr("Hubo un error al intentar registrar un nuevo profesor!"))
            }

            else
                show()
        }
    }

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
    // Preparar datos para nuevo profesor al mostrar ventana
    //
    onVisibleChanged: {
       if (!visible)
           idNuevoProfesor = idInvalido
    }

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
        // Editor de detalles de profesor
        //
        DetallesProfesor {
            id: detallesProf
            Layout.fillWidth: true
            Layout.fillHeight: true
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
                onClicked: cancelar()
            }

            Button {
                text: qsTr("Registrar")
                onClicked: {
                    if (idNuevoProfesor > idInvalido) {
                        if (detallesProf.guardarDatos(idNuevoProfesor)) {
                            hide()
                            return
                        }
                    }

                    cancelar()
                }
            }
        }
    }
}
