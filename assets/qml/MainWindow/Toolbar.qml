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

ToolBar {
    id: toolbar

    signal nuevoProfesor()
    signal nuevaBaseDeDatos()
    signal estadisticasBaseDeDatos()
    signal modificarDatosExistentes()
    signal abrirBaseDeDatosExistente()

    anchors {
        left: parent.left
        right: parent.right
    }

    RowLayout {
        anchors.fill: parent
        spacing: app.spacing / 2
        anchors.verticalCenter: parent.verticalCenter

        ToolButton {
            onClicked: toolbar.nuevaBaseDeDatos()
            iconSource: "qrc:/iconos/nuevo-db.svg"
        }

        ToolButton {
            iconSource: "qrc:/iconos/abrir.svg"
            onClicked: toolbar.abrirBaseDeDatosExistente()
        }

        ToolSeparator {}

        ToolButton {
            id: button
            onClicked: toolbar.nuevoProfesor()
            enabled: CAdministradorDb.disponible
            iconSource: "qrc:/iconos/registrar-profesor.svg"
        }

        ToolButton {
            onClicked: toolbar.modificarDatosExistentes()
            iconSource: "qrc:/iconos/editar-informacion.svg"
            enabled: CAdministradorDb.disponible && CAdministradorDb.profesores.length > 0
        }

        ToolSeparator {}

        ToolButton {
            iconSource: "qrc:/iconos/info.svg"
            enabled: CAdministradorDb.disponible
            onClicked: toolbar.estadisticasBaseDeDatos()
        }

        Item {
            Layout.fillWidth: true
        }
    }
}

