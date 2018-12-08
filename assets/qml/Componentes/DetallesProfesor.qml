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

TabView {
    id: detallesProfesor
    Layout.minimumWidth: 780
    Layout.minimumHeight: 580

    function leerDatos(id) {
        if (CAdministradorDb.disponible) {

        }

        else {
            CAdministradorDb.mostrarError(qsTr("Error"),
                                          qsTr("El profesor con ID %1 no existe!").arg(id))
        }
    }

    function guardarDatos(id) {
        // Si la base de datos no esta disponible, ya empezamos mal...
        var ok = CAdministradorDb.disponible

        // DB disponible, guardar datos
        if (ok) {
            // Escribir datos personales
            ok &= CAdministradorDb.escribirDato(id, "Datos Personales", "Nombres", nombres.text)

            // Escribir datos generales

            // Escribir datos de licenciatura

            // Escribir datos de maestria

            // Escribir datos de doctorado

            // Escribir datos de especialidad

            // Mostrar dialogo de exito
            if (ok) {
                CAdministradorDb.mostrarInfo(qsTr("Información"),
                                             qsTr("Los datos del profesor fueron actualizados exitosamente"))
            }
        }

        // Hubo un error al intentar guardar los datos
        if (!ok) {
            CAdministradorDb.mostrarError(qsTr("Error"),
                                          qsTr("Hubo un error al intentar guardar los datos " +
                                               "del profesor con el ID %1").arg(id))
        }
    }

    Tab {
        title: qsTr("Datos Personales")

        GridLayout {
            columns: 2
            rowSpacing: app.spacing
            columnSpacing: app.spacing
            Layout.margins: 2 * app.spacing

            anchors {
                fill: parent
                margins: 2 * app.spacing
            }

            Label {
                text: qsTr ("Nombres") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: nombres
                Layout.fillWidth: true
            }

            Label {
                text: qsTr ("Apellido Paterno") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: apPaterno
                Layout.fillWidth: true
            }

            Label {
                text: qsTr ("Apellido Materno") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: apMaterno
                Layout.fillWidth: true
            }

            Label {
                text: qsTr ("Fecha de Nacimiento") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: fechaNacimiento
                Layout.fillWidth: true
            }

            Label {
                text: qsTr ("Lugar de Nacimiento") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: lugarNacimiento
                Layout.fillWidth: true
            }

            Label {
                text: qsTr ("Género") + ":"
                horizontalAlignment: Label.AlignRight
            }

            ComboBox {
                id: genero
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
                id: numHijos
                Layout.fillWidth: true
            }

            Label {
                text: qsTr ("Estado Civil") + ":"
                horizontalAlignment: Label.AlignRight
            }

            ComboBox {
                id: estadoCivil
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

            Item {
                Layout.fillHeight: true
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }

    Tab {
        title: qsTr("Datos Generales")

        GridLayout {
            columns: 2
            rowSpacing: app.spacing
            columnSpacing: app.spacing

            anchors {
                fill: parent
                margins: 2 * app.spacing
            }

            Label {
                horizontalAlignment: Label.AlignRight
                text: qsTr ("Número de Empleado") + ":"
            }

            TextField {
                id: numEmpleado
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Categoría de Contratación") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: catContratacion
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Contratación por Plaza") + ":"
                horizontalAlignment: Label.AlignRight
            }

            CheckBox {
                id: contratacionPorPlaza
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Antigüedad en la Institución") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: antiguedadInst
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Adscripción") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: adscripcion
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Programa(s) Impartido(s)") + ":"
                horizontalAlignment: Label.AlignRight
            }

            TextField {
                id: programasImpartidos
                Layout.fillWidth: true
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    Tab {
        title: qsTr("Formación Académica")

        GridLayout {
            columns: 2
            rowSpacing: 0
            columnSpacing: 0
            id: formacionAcademicaControls

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
                        id: licTitulo
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: licInstitucion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: licPais
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: licCedula
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: licAnoObtencion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: licEstatusFinal
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
                        id: maestTitulo
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: maestInstitucion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: maestPais
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: maestCedula
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: maestAnoObtencion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Línea Terminal") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: maestLineaTerminal
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: maestEstatusFinal
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
                        id: docTitulo
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: docInstitucion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: docPais
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: docCedula
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: docAnoObtencion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: docEstatusFinal
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
                        id: espArea
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: espInstitucion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: espPais
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: espCedula
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: espAnoObtencion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        id: espEstatusFinal
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
