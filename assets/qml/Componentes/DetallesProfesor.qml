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
    id: dP
    Layout.minimumWidth: 780
    Layout.minimumHeight: 580

    //
    // Variables
    //
    property string curp: ""
    property string nombres: ""
    property string apPaterno: ""
    property string apMaterno: ""
    property string fechaNacimiento: ""
    property int genero: 0
    property string lugarNacimiento: ""
    property int estadoCivil: 0
    property int numHijos: 0
    property int numEmpleado: 0
    property bool activo: false
    property string catContratacion: ""
    property bool contratacionPorPlaza: false
    property int antiguedadInst: 0
    property string adscripcion: ""
    property string programasImpartidos: ""
    property string licTitulo: ""
    property string licInstitucion: ""
    property string licPais: ""
    property string licCedula: ""
    property int licAnoObtencion: 0
    property string licEstatusFinal: ""
    property string maestTitulo: ""
    property string maestInstitucion: ""
    property string maestPais: ""
    property string maestCedula: ""
    property int maestAnoObtencion: 0
    property string maestEstatusFinal: ""
    property string maestLineaTerminal: ""
    property string docTitulo: ""
    property string docInstitucion: ""
    property string docPais: ""
    property string docCedula: ""
    property int docAnoObtencion: 0
    property string docEstatusFinal: ""
    property string espArea: ""
    property string espInstitucion: ""
    property string espPais: ""
    property string espCedula: ""
    property int espAnoObtencion: 0
    property string espEstatusFinal: ""

    //
    // Cambia todos los valores a su estado inicial
    //
    function resetVariables() {
        curp = ""
        nombres = ""
        apPaterno = ""
        apMaterno = ""
        fechaNacimiento = ""
        genero = 0
        lugarNacimiento = ""
        estadoCivil = 0
        numHijos = 0
        numEmpleado = 0
        activo = false
        catContratacion = ""
        contratacionPorPlaza = false
        antiguedadInst = 0
        adscripcion = ""
        programasImpartidos = ""
        licTitulo = ""
        licInstitucion = ""
        licPais = ""
        licCedula = ""
        licAnoObtencion = 0
        licEstatusFinal = ""
        maestTitulo = ""
        maestInstitucion = ""
        maestPais = ""
        maestCedula = ""
        maestAnoObtencion = 0
        maestEstatusFinal = ""
        maestLineaTerminal = ""
        docTitulo = ""
        docInstitucion = ""
        docPais = ""
        docCedula = ""
        docAnoObtencion = 0
        docEstatusFinal = ""
        espArea = ""
        espInstitucion = ""
        espPais = ""
        espCedula = ""
        espAnoObtencion = 0
        espEstatusFinal = ""
    }

    //--------------------------------------------------------------------//
    // FUNCIONES DE LECTURA Y ESCRITURA DE INFORMACION A LA BASE DE DATOS //
    //--------------------------------------------------------------------//

    //
    // Lee y carga los datos del profesor con la @a id especificada
    // en los controles de la interfaz grafica
    //
    function leerDatos(id) {
        // El profesor existe, leer datos
        if (CAdministradorDb.checarExistenciaProfesor(id)) {
            // Leer datos personales
            dP.curp = CAdministradorDb.leerDato(id, "Datos Personales", "CURP")
            dP.nombres = CAdministradorDb.leerDato(id, "Datos Personales", "Nombres")
            dP.apPaterno = CAdministradorDb.leerDato(id, "Datos Personales", "Apellido Paterno")
            dP.apMaterno = CAdministradorDb.leerDato(id, "Datos Personales", "Apellido Materno")
            dP.fechaNacimiento = CAdministradorDb.leerDato(id, "Datos Personales", "Fecha de Nacimiento")
            dP.genero = CAdministradorDb.leerDato(id, "Datos Personales", "Genero")
            dP.lugarNacimiento = CAdministradorDb.leerDato(id, "Datos Personales", "Lugar de Nacimiento")
            dP.estadoCivil = CAdministradorDb.leerDato(id, "Datos Personales", "Estado Civil")
            dP.numHijos = CAdministradorDb.leerDato(id, "Datos Personales", "Num Hijos")

            // Leer datos generales
            dP.numEmpleado = CAdministradorDb.leerDato(id, "Datos Generales", "Num Empleado")
            dP.activo = CAdministradorDb.leerDato(id, "Datos Generales", "Activo") === "1"
            dP.catContratacion = CAdministradorDb.leerDato(id, "Datos Generales", "Categoria de Contratacion")
            dP.contratacionPorPlaza = CAdministradorDb.leerDato(id, "Datos Generales", "Plaza") === "1"
            dP.antiguedadInst = CAdministradorDb.leerDato(id, "Datos Generales", "Antiguedad")
            dP.adscripcion = CAdministradorDb.leerDato(id, "Datos Generales", "Adscripcion")
            dP.programasImpartidos = CAdministradorDb.leerDato(id, "Datos Generales", "Programa Impartido")

            // Leer datos de licenciatura
            dP.licTitulo = CAdministradorDb.leerDato(id, "Licenciatura", "Titulo")
            dP.licInstitucion = CAdministradorDb.leerDato(id, "Licenciatura", "Institucion")
            dP.licPais = CAdministradorDb.leerDato(id, "Licenciatura", "Pais")
            dP.licCedula = CAdministradorDb.leerDato(id, "Licenciatura", "Cedula")
            dP.licAnoObtencion = CAdministradorDb.leerDato(id, "Licenciatura", "Año de Obtencion")
            dP.licEstatusFinal = CAdministradorDb.leerDato(id, "Licenciatura", "Estatus Final")

            // Leer datos de maestria
            dP.maestTitulo = CAdministradorDb.leerDato(id, "Maestria", "Titulo")
            dP.maestInstitucion = CAdministradorDb.leerDato(id, "Maestria", "Institucion")
            dP.maestPais = CAdministradorDb.leerDato(id, "Maestria", "Pais")
            dP.maestCedula = CAdministradorDb.leerDato(id, "Maestria", "Cedula")
            dP.maestAnoObtencion = CAdministradorDb.leerDato(id, "Maestria", "Año de Obtencion")
            dP.maestEstatusFinal = CAdministradorDb.leerDato(id, "Maestria", "Estatus Final")

            // Leer datos de doctorado
            dP.docTitulo = CAdministradorDb.leerDato(id, "Doctorado", "Titulo")
            dP.docInstitucion = CAdministradorDb.leerDato(id, "Doctorado", "Institucion")
            dP.docPais = CAdministradorDb.leerDato(id, "Doctorado", "Pais")
            dP.docCedula = CAdministradorDb.leerDato(id, "Doctorado", "Cedula")
            dP.docAnoObtencion = CAdministradorDb.leerDato(id, "Doctorado", "Año de Obtencion")
            dP.docEstatusFinal = CAdministradorDb.leerDato(id, "Doctorado", "Estatus Final")

            // Leer datos de especialidad
            dP.espArea = CAdministradorDb.leerDato(id, "Especialidad", "Area")
            dP.espInstitucion = CAdministradorDb.leerDato(id, "Especialidad", "Institucion")
            dP.espPais = CAdministradorDb.leerDato(id, "Especialidad", "Pais")
            dP.espCedula = CAdministradorDb.leerDato(id, "Especialidad", "Cedula")
            dP.espAnoObtencion = CAdministradorDb.leerDato(id, "Especialidad", "Año de Obtencion")
            dP.espEstatusFinal = CAdministradorDb.leerDato(id, "Especialidad", "Estatus Final")
        }

        // Profesor no existe, mostrar error
        else {
            CAdministradorDb.mostrarError(qsTr("Error"),
                                          qsTr("El profesor con ID %1 no existe!").arg(id))
        }
    }

    //
    // Regresa verdadero si los datos minimos tienen informacion
    //
    function datosMinimos() {
        if (nombres.length === 0 ||
                apMaterno.length === 0 ||
                apPaterno.length === 0 ||
                fechaNacimiento.length === 0)
            return false

        return true
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
            return false
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
        function escribirDato(id, tabla, campo, valor, obligatorio) {
            // Solo escribir el dato si ok es verdadero
            if (ok) {
                // Cambiar valor de obligatorio a falso si no es definido
                if (obligatorio === 'undefined')
                    obligatorio = false

                // Escribir dato
                ok = CAdministradorDb.escribirDato(id, tabla, campo, valor, obligatorio)

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
        escribirDato(id, "Datos Personales", "CURP", dP.curp)
        escribirDato(id, "Datos Personales", "Nombres", dP.nombres, true)
        escribirDato(id, "Datos Personales", "Apellido Paterno", dP.apPaterno, true)
        escribirDato(id, "Datos Personales", "Apellido Materno", dP.apMaterno, true)
        escribirDato(id, "Datos Personales", "Fecha de Nacimiento", dP.fechaNacimiento, true)
        escribirDato(id, "Datos Personales", "Genero", dP.genero)
        escribirDato(id, "Datos Personales", "Lugar de Nacimiento", dP.lugarNacimiento)
        escribirDato(id, "Datos Personales", "Estado Civil", dP.estadoCivil)
        escribirDato(id, "Datos Personales", "Num Hijos", dP.numHijos)

        // Escribir datos generales
        escribirDato(id, "Datos Generales", "Num Empleado", dP.numEmpleado)
        escribirDato(id, "Datos Generales", "Activo", dP.activo ? 1 : 0)
        escribirDato(id, "Datos Generales", "Categoria de Contratacion", dP.catContratacion)
        escribirDato(id, "Datos Generales", "Plaza", dP.contratacionPorPlaza ? 1 : 0)
        escribirDato(id, "Datos Generales", "Antiguedad", dP.antiguedadInst)
        escribirDato(id, "Datos Generales", "Adscripcion", dP.adscripcion)
        escribirDato(id, "Datos Generales", "Programa Impartido", dP.programasImpartidos)

        // Escribir datos de licenciatura
        escribirDato(id, "Licenciatura", "Titulo", dP.licTitulo)
        escribirDato(id, "Licenciatura", "Institucion", dP.licInstitucion)
        escribirDato(id, "Licenciatura", "Pais", dP.licPais)
        escribirDato(id, "Licenciatura", "Cedula", dP.licCedula)
        escribirDato(id, "Licenciatura", "Año de Obtencion", dP.licAnoObtencion)
        escribirDato(id, "Licenciatura", "Estatus Final", dP.licEstatusFinal)

        // Escribir datos de maestria
        escribirDato(id, "Maestria", "Titulo", dP.maestTitulo)
        escribirDato(id, "Maestria", "Institucion", dP.maestInstitucion)
        escribirDato(id, "Maestria", "Pais", dP.maestPais)
        escribirDato(id, "Maestria", "Cedula", dP.maestCedula)
        escribirDato(id, "Maestria", "Año de Obtencion", dP.maestAnoObtencion)
        escribirDato(id, "Maestria", "Estatus Final", dP.maestEstatusFinal)
        escribirDato(id, "Maestria", "Linea Terminal", dP.maestLineaTerminal)

        // Escribir datos de doctorado
        escribirDato(id, "Doctorado", "Titulo", dP.docTitulo)
        escribirDato(id, "Doctorado", "Institucion", dP.docInstitucion)
        escribirDato(id, "Doctorado", "Pais", dP.docPais)
        escribirDato(id, "Doctorado", "Cedula", dP.docCedula)
        escribirDato(id, "Doctorado", "Año de Obtencion", dP.docAnoObtencion)
        escribirDato(id, "Doctorado", "Estatus Final", dP.docEstatusFinal)

        // Escribir datos de especialidad
        escribirDato(id, "Especialidad", "Area", dP.espArea)
        escribirDato(id, "Especialidad", "Institucion", dP.espInstitucion)
        escribirDato(id, "Especialidad", "Pais", dP.espPais)
        escribirDato(id, "Especialidad", "Cedula", dP.espCedula)
        escribirDato(id, "Especialidad", "Año de Obtencion", dP.espAnoObtencion)
        escribirDato(id, "Especialidad", "Estatus Final", dP.espEstatusFinal)

        // Mostrar dialogo de exito
        if (ok) {
            CAdministradorDb.mostrarInfo(qsTr("Información"),
                                         qsTr("Los datos del profesor fueron actualizados exitosamente"))
            CAdministradorDb.actualizarListaProfes()
        }

        // Hubo un error al intentar guardar los datos
        else {
            CAdministradorDb.mostrarError(qsTr("Error"),
                                          qsTr("Hubo un error al intentar guardar los datos " +
                                               "del profesor con el ID %1").arg(id))
        }

        // Regresar estatus de operacion
        return ok
    }

    //------------------------------------------------------------------//
    // DEFINICION Y PROPIEDADES DE LOS CONTROLES DE LA INTERFAZ GRAFICA //
    //------------------------------------------------------------------//

    //
    // Pestaña de datos personales
    //
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

            //
            // Estado de Actividad
            //
            Label {
                text: qsTr ("Activo en la UNAQ")
                horizontalAlignment: Label.AlignRight
            } CheckBox {
                checked: activo
                Layout.fillWidth: true
                onCheckedChanged: activo = checked
            }

            //
            // Nombres
            //
            Label {
                text: qsTr ("Nombres") + "*:"
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
                text: qsTr ("Apellido Paterno") + "*:"
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
                text: qsTr ("Apellido Materno") + "*:"
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
                text: qsTr ("Fecha de Nacimiento") + "*:"
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
            // CURP
            //
            Label {
                text: qsTr ("CURP") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: curp
                Layout.fillWidth: true
                onTextChanged: curp = text
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
            Layout.margins: 2 * app.spacing

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
                onTextChanged: numEmpleado = text
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
                onTextChanged: catContratacion = text
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
                onCheckedChanged: contratacionPorPlaza = checked
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
                onTextChanged: antiguedadInst = text
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
                onTextChanged: adscripcion = text
            }

            //
            // Programas impartidos
            //
            Label {
                text: qsTr("Programa(s) Impartido(s)") + ":"
                horizontalAlignment: Label.AlignRight
            } TextField {
                text: programasImpartidos
                Layout.fillWidth: true
                onTextChanged: programasImpartidos = text
            }

            //
            // Espaciador
            //
            Item { Layout.fillHeight: true }
            Item { Layout.fillHeight: true }
        }
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
                    } TextField {
                        text: licTitulo
                        Layout.fillWidth: true
                        onTextChanged: licTitulo = text
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: licInstitucion
                        Layout.fillWidth: true
                        onTextChanged: licInstitucion = text
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: licPais
                        Layout.fillWidth: true
                        onTextChanged: licPais = text
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: licCedula
                        Layout.fillWidth: true
                        onTextChanged: licCedula = text
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: licAnoObtencion
                        Layout.fillWidth: true
                        onTextChanged: licAnoObtencion = text
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: licEstatusFinal
                        Layout.fillWidth: true
                        onTextChanged: licEstatusFinal = text
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
                    } TextField {
                        text: maestTitulo
                        Layout.fillWidth: true
                        onTextChanged: maestTitulo = text
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: maestInstitucion
                        Layout.fillWidth: true
                        onTextChanged: maestInstitucion = text
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: maestPais
                        Layout.fillWidth: true
                        onTextChanged: maestPais = text
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: maestCedula
                        Layout.fillWidth: true
                        onTextChanged: maestCedula = text
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: maestAnoObtencion
                        Layout.fillWidth: true
                        onTextChanged: maestAnoObtencion = text
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: maestEstatusFinal
                        Layout.fillWidth: true
                        onTextChanged: maestEstatusFinal = text
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
                    } TextField {
                        text: docTitulo
                        Layout.fillWidth: true
                        onTextChanged: docTitulo = text
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: docInstitucion
                        Layout.fillWidth: true
                        onTextChanged: docInstitucion = text
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: docPais
                        Layout.fillWidth: true
                        onTextChanged: docPais = text
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: docCedula
                        Layout.fillWidth: true
                        onTextChanged: docCedula = text
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: docAnoObtencion
                        Layout.fillWidth: true
                        onTextChanged: docAnoObtencion = text
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: docEstatusFinal
                        Layout.fillWidth: true
                        onTextChanged: docEstatusFinal = text
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
                    } TextField {
                        text: espArea
                        Layout.fillWidth: true
                        onTextChanged: espTitulo = text
                    }

                    Label {
                        text: qsTr("Institución") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: espInstitucion
                        Layout.fillWidth: true
                        onTextChanged: espInstitucion = text
                    }

                    Label {
                        text: qsTr("País de Egreso") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: espPais
                        Layout.fillWidth: true
                        onTextChanged: espPais = text
                    }

                    Label {
                        text: qsTr("Cédula Profesional") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: espCedula
                        Layout.fillWidth: true
                        onTextChanged: espCedula = text
                    }

                    Label {
                        text: qsTr("Año de Obtención") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: espAnoObtencion
                        Layout.fillWidth: true
                        onTextChanged: espAnoObtencion = text
                    }

                    Label {
                        text: qsTr("Estatus Final") + ":"
                        horizontalAlignment: Label.AlignRight
                    } TextField {
                        text: espEstatusFinal
                        Layout.fillWidth: true
                        onTextChanged: espEstatusFinal = text
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
