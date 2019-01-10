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

    //
    // Variables
    //
    property string nombres: ""
    property string apPaterno: ""
    property string apMaterno: ""
    property string fechaNacimiento: ""
    property int genero: 0
    property string lugarNacimiento: ""
    property int estadoCivil: 0
    property string numHijos: ""
    property string numEmpleado: ""
    property bool activo: false
    property string catContratacion: ""
    property bool contratacionPorPlaza: false
    property string antiguedadInst: ""
    property string adscripcion: ""
    property string programasImpartidos: ""
    property string licTitulo: ""
    property string licInstitucion: ""
    property string licPais: ""
    property string licCedula: ""
    property string licAnoObtencion: ""
    property string licEstatusFinal: ""
    property string maestTitulo: ""
    property string maestInstitucion: ""
    property string maestPais: ""
    property string maestCedula: ""
    property string maestAnoObtencion: ""
    property string maestEstatusFinal: ""
    property string maestLineaTerminal: ""
    property string docTitulo: ""
    property string docInstitucion: ""
    property string docPais: ""
    property string docCedula: ""
    property string docAnoObtencion: ""
    property string docEstatusFinal: ""
    property string espArea: ""
    property string espInstitucion: ""
    property string espPais: ""
    property string espCedula: ""
    property string espAnoObtencion: ""
    property string espEstatusFinal: ""

    //--------------------------------------------------------------------//
    // FUNCIONES DE LECTURA Y ESCRITURA DE INFORMACION A LA BASE DE DATOS //
    //--------------------------------------------------------------------//

    //
    // Lee y carga los datos del profesor con la @a id especificada
    // en los controles de la interfaz grafica
    //
    function leerDatos(id) {
        //
        // Definir funcion de lectura
        //
        function leerDato(id, tabla, campo, target) {
            if (CAdministradorDb.disponible)
                target = CAdministradorDb.leerDato(id, tabla, campo)
        }

        // El profesor existe
        if (CAdministradorDb.checarExistenciaProfesor(id)) {
            // Leer datos personales
            leerDato(id, "Datos Personales", "Nombres", nombres)
            leerDato(id, "Datos Personales", "Apellido Paterno", apPaterno)
            leerDato(id, "Datos Personales", "Apellido Materno", apMaterno)
            leerDato(id, "Datos Personales", "Fecha de Nacimiento", fechaNacimiento)
            leerDato(id, "Datos Personales", "Genero", genero)
            leerDato(id, "Datos Personales", "Lugar de Nacimiento", lugarNacimiento)
            leerDato(id, "Datos Personales", "Estado Civil", estadoCivil.currentIndex)
            leerDato(id, "Datos Personales", "Num Hijos", numHijos)

            // Leer datos generales
            leerDato(id, "Datos Generales", "Num Empleado", numEmpleado)
            leerDato(id, "Datos Generales", "Inactivo", !activo)
            leerDato(id, "Datos Generales", "Categoria de Contratacion", catContratacion)
            leerDato(id, "Datos Generales", "Plaza", contratacionPorPlaza)
            leerDato(id, "Datos Generales", "Antiguedad", antiguedadInst)
            leerDato(id, "Datos Generales", "Adscripcion", adscripcion)
            leerDato(id, "Datos Generales", "Programa Impartido", programasImpartidos)

            // Leer datos de licenciatura
            leerDato(id, "Licenciatura", "Titulo", licTitulo)
            leerDato(id, "Licenciatura", "Institucion", licInstitucion)
            leerDato(id, "Licenciatura", "Pais", licPais)
            leerDato(id, "Licenciatura", "Cedula", licCedula)
            leerDato(id, "Licenciatura", "Año de Obtencion", licAnoObtencion)
            leerDato(id, "Licenciatura", "Estatus Final", licEstatusFinal)

            // Leer datos de maestria
            leerDato(id, "Maestria", "Titulo", maestTitulo)
            leerDato(id, "Maestria", "Institucion", maestInstitucion)
            leerDato(id, "Maestria", "Pais", maestPais)
            leerDato(id, "Maestria", "Cedula", maestCedula)
            leerDato(id, "Maestria", "Año de Obtencion", maestAnoObtencion)
            leerDato(id, "Maestria", "Estatus Final", maestEstatusFinal)
            leerDato(id, "Maestria", "Linea Terminal", maestLineaTerminal)

            // Leer datos de doctorado
            leerDato(id, "Doctorado", "Titulo", docTitulo)
            leerDato(id, "Doctorado", "Institucion", docInstitucion)
            leerDato(id, "Doctorado", "Pais", docPais)
            leerDato(id, "Doctorado", "Cedula", docCedula)
            leerDato(id, "Doctorado", "Año de Obtencion", docAnoObtencion)
            leerDato(id, "Doctorado", "Estatus Final", docEstatusFinal)

            // Leer datos de especialidad
            leerDato(id, "Especialidad", "Area", espArea)
            leerDato(id, "Especialidad", "Institucion", espInstitucion)
            leerDato(id, "Especialidad", "Pais", espPais)
            leerDato(id, "Especialidad", "Cedula", espCedula)
            leerDato(id, "Especialidad", "Año de Obtencion", espAnoObtencion)
            leerDato(id, "Especialidad", "Estatus Final", espEstatusFinal)
        }

        // Profesor no existe, mostrar error
        else {
            CAdministradorDb.mostrarError(qsTr("Error"),
                                          qsTr("El profesor con ID %1 no existe!").arg(id))
        }
    }

    //
    // Actualiza los datos del profesor con la @a id especificada con los valores
    // especificados en los controles de la interfaz grafica
    //
    function guardarDatos(id) {
        // Si la base de datos no esta disponible, ya empezamos mal...
        if (!CAdministradorDb.disponible) {
            CAdministradorDb.mostrarError(qsTr("Error"),
                                          qsTr("La base de datos no está disponible, por " +
                                               "lo cuál no se pueden guardar los datos del " +
                                               "profesor con el ID %1").arg(id))
            return
        }

        //
        // Cada escritura va a cambiar el valor de ok, por lo tanto
        // si ok resulta ser falso en algun punto del programa, sabemos
        // que ocurrio un error de escritura
        //
        var ok = true

        //
        // Funcion para escribir datos a la Db y reportar errores individuales
        //
        function escribirDato(id, tabla, campo, valor) {
            // Solo escribir el dato si ok es verdadero
            if (ok) {
                // Escribir dato
                ok = CAdministradorDb.escribirDato(id, tabla, campo, valor)

                // Error de escritura, alertar usuario
                if (!ok) {
                    CAdministradorDb.mostrarError(qsTr("Error de escritura"),
                                                  qsTr("No se puede escribir \"%1\" en el " +
                                                       "campo \"%2\" de la tabla \"%3\"")
                                                  .arg(valor).arg(campo).arg(tabla))
                }
            }
        }

        // Escribir datos personales
        escribirDato(id, "Datos Personales", "Nombres", nombres)
        escribirDato(id, "Datos Personales", "Apellido Paterno", apPaterno)
        escribirDato(id, "Datos Personales", "Apellido Materno", apMaterno)
        escribirDato(id, "Datos Personales", "Fecha de Nacimiento", fechaNacimiento)
        escribirDato(id, "Datos Personales", "Genero", genero)
        escribirDato(id, "Datos Personales", "Lugar de Nacimiento", lugarNacimiento)
        escribirDato(id, "Datos Personales", "Estado Civil", estadoCivil)
        escribirDato(id, "Datos Personales", "Num Hijos", numHijos)

        // Escribir datos generales
        escribirDato(id, "Datos Generales", "Num Empleado", numEmpleado)
        escribirDato(id, "Datos Generales", "Inactivo", !activo)
        escribirDato(id, "Datos Generales", "Categoria de Contratacion", catContratacion)
        escribirDato(id, "Datos Generales", "Plaza", contratacionPorPlaza)
        escribirDato(id, "Datos Generales", "Antiguedad", antiguedadInst)
        escribirDato(id, "Datos Generales", "Adscripcion", adscripcion)
        escribirDato(id, "Datos Generales", "Programa Impartido", programasImpartidos)

        // Escribir datos de licenciatura
        escribirDato(id, "Licenciatura", "Titulo", licTitulo)
        escribirDato(id, "Licenciatura", "Institucion", licInstitucion)
        escribirDato(id, "Licenciatura", "Pais", licPais)
        escribirDato(id, "Licenciatura", "Cedula", licCedula)
        escribirDato(id, "Licenciatura", "Año de Obtencion", licAnoObtencion)
        escribirDato(id, "Licenciatura", "Estatus Final", licEstatusFinal)

        // Escribir datos de maestria
        escribirDato(id, "Maestria", "Titulo", maestTitulo)
        escribirDato(id, "Maestria", "Institucion", maestInstitucion)
        escribirDato(id, "Maestria", "Pais", maestPais)
        escribirDato(id, "Maestria", "Cedula", maestCedula)
        escribirDato(id, "Maestria", "Año de Obtencion", maestAnoObtencion)
        escribirDato(id, "Maestria", "Estatus Final", maestEstatusFinal)
        escribirDato(id, "Maestria", "Linea Terminal", maestLineaTerminal)

        // Escribir datos de doctorado
        escribirDato(id, "Doctorado", "Titulo", docTitulo)
        escribirDato(id, "Doctorado", "Institucion", docInstitucion)
        escribirDato(id, "Doctorado", "Pais", docPais)
        escribirDato(id, "Doctorado", "Cedula", docCedula)
        escribirDato(id, "Doctorado", "Año de Obtencion", docAnoObtencion)
        escribirDato(id, "Doctorado", "Estatus Final", docEstatusFinal)

        // Escribir datos de especialidad
        escribirDato(id, "Especialidad", "Area", espArea)
        escribirDato(id, "Especialidad", "Institucion", espInstitucion)
        escribirDato(id, "Especialidad", "Pais", espPais)
        escribirDato(id, "Especialidad", "Cedula", espCedula)
        escribirDato(id, "Especialidad", "Año de Obtencion", espAnoObtencion)
        escribirDato(id, "Especialidad", "Estatus Final", espEstatusFinal)

        // Mostrar dialogo de exito
        if (ok) {
            CAdministradorDb.mostrarInfo(qsTr("Información"),
                                         qsTr("Los datos del profesor fueron actualizados exitosamente"))
        }

        // Hubo un error al intentar guardar los datos
        else {
            CAdministradorDb.mostrarError(qsTr("Error"),
                                          qsTr("Hubo un error al intentar guardar los datos " +
                                               "del profesor con el ID %1").arg(id))
        }
    }

    //------------------------------------------------------------------//
    // DEFINICION Y PROPIEDADES DE LOS CONTROLES DE LA INTERFAZ GRAFICA //
    //------------------------------------------------------------------//

    //
    // Pestaña de datos personales
    //
    Tab {
        active: true
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

            //
            // Estado de Actividad
            //
            Label {
                text: qsTr ("Activo en la UNAQ")
                horizontalAlignment: Label.AlignRight
            } CheckBox {
                checked: activo
                Layout.fillWidth: true
            }

            //
            // Nombres
            //
            Label {
                text: qsTr ("Nombres") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: nombres
                Layout.fillWidth: true
                onTextChanged: nombres = text
            }

            //
            // Apellido paterno
            //
            Label {
                text: qsTr ("Apellido Paterno") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: apPaterno
                Layout.fillWidth: true
                onTextChanged: apPaterno = text
            }

            //
            // Apellido materno
            //
            Label {
                text: qsTr ("Apellido Materno") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: apMaterno
                Layout.fillWidth: true
                onTextChanged: apMaterno = text
            }

            //
            // Fecha de nacimiento
            //
            Label {
                text: qsTr ("Fecha de Nacimiento") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: fechaNacimiento
                Layout.fillWidth: true
                onTextChanged: fechaNacimiento = text
            }

            //
            // Lugar de nacimiento
            //
            Label {
                text: qsTr ("Lugar de Nacimiento") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: lugarNacimiento
                Layout.fillWidth: true
                onTextChanged: lugarNacimiento = text
            }

            //
            // Genero
            //
            Label {
                text: qsTr ("Género") + ":"
                horizontalAlignment: Label.AlignRight
            } ComboBox {
                currentIndex: genero
                Layout.fillWidth: true
                onCurrentIndexChanged: genero = currentIndex
                model: [
                    qsTr("Femenino"),
                    qsTr("Masculino"),
                    qsTr("No Especificado")
                ]
            }

            //
            // Numero de hijos
            //
            Label {
                text: qsTr ("Número de Hijos") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: numHijos
                Layout.fillWidth: true
                onTextChanged: numHijos = text
            }

            //
            // Estado civil
            //
            Label {
                text: qsTr ("Estado Civil") + ":"
                horizontalAlignment: Label.AlignRight
            } ComboBox {
                currentIndex: estadoCivil
                Layout.fillWidth: true
                onCurrentIndexChanged: estadoCivil = currentIndex
                model: [
                    qsTr("Casado/a"),
                    qsTr("Divorciado/a"),
                    qsTr("Soltero/a"),
                    qsTr("Viudo/a"),
                    qsTr("Comprometido/a"),
                    qsTr("No Especificado")
                ]
            }

            //
            // Espaciadores
            //
            Item { Layout.fillHeight: true }
            Item { Layout.fillHeight: true }
        }
    }

    //
    // Pestaña de datos generales
    //
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

            //
            // Numero de empleado
            //
            Label {
                horizontalAlignment: Label.AlignRight
                text: qsTr ("Número de Empleado") + ":"
            } TextField {
                text: numEmpleado
                Layout.fillWidth: true
            }

            //
            // Categoria de contratacion
            //
            Label {
                text: qsTr("Categoría de Contratación") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: catContratacion
                Layout.fillWidth: true
            }

            //
            // Contratacion por plaza
            //
            Label {
                text: qsTr("Contratación por Plaza") + ":"
                horizontalAlignment: Label.AlignRight
            } CheckBox {
                checked: contratacionPorPlaza
                Layout.fillWidth: true
            }

            //
            // Ant. en la universidad
            //
            Label {
                text: qsTr("Antigüedad en la Institución") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: antiguedadInst
                Layout.fillWidth: true
            }

            //
            // Adscripcion
            //
            Label {
                text: qsTr("Adscripción") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: adscripcion
                Layout.fillWidth: true
            }

            //
            // Programas impartudos
            //
            Label {
                text: qsTr("Programa(s) Impartido(s)") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: programasImpartidos
                Layout.fillWidth: true
            }
        }

        //
        // Espaciador
        //
        Item { Layout.fillHeight: true }
    }

    //
    // Pestaña de formacion academica
    //
    Tab {
        title: qsTr("Formación Académica")

        GridLayout {
            columns: 2
            rowSpacing: 0
            columnSpacing: 0

            //
            // Controles de licenciatura
            //
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
                        text: licTitulo
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: licInstitucion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: licPais
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: licCedula
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: licAnoObtencion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: licEstatusFinal
                        Layout.fillWidth: true
                    }
                }
            }

            //
            // Controles de maestria
            //
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
                        text: maestTitulo
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: maestInstitucion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: maestPais
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: maestCedula
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: maestAnoObtencion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Línea Terminal") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: maestLineaTerminal
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: maestEstatusFinal
                        Layout.fillWidth: true
                    }
                }
            }

            //
            // Controles de doctorado
            //
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
                        text: docTitulo
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: docInstitucion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: docPais
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: docCedula
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: docAnoObtencion
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: docEstatusFinal
                        Layout.fillWidth: true
                    }
                }
            }

            //
            // Controles de especialidad
            //
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
                        text: espArea
                        Layout.fillWidth: true
                        onTextChanged: espArea = text
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: espInstitucion
                        Layout.fillWidth: true
                        onTextChanged: espInstitucion = text
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: espPais
                        Layout.fillWidth: true
                        onTextChanged: espPais = text
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: espCedula
                        Layout.fillWidth: true
                        onTextChanged: espCedula = text
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: espAnoObtencion
                        onTextChanged: espAnoObtencion = text
                        Layout.fillWidth: true
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    }

                    TextField {
                        text: espEstatusFinal
                        onTextChanged: espEstatusFinal = text
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }

    //
    // Pestaña de cursos/certificaciones
    //
    Tab {
        title: qsTr("Cursos y Certificaciones")
    }

    //
    // Pestaña de experiencia laboral
    //
    Tab {
        title: qsTr("Experiencia")
    }
}
