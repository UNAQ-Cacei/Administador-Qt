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
    title: qsTr("Acerca de %1").arg(AppName)

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
    minimumWidth: layout.implicitWidth + 5 * app.spacing
    minimumHeight: layout.implicitHeight + 5 * app.spacing

    //
    // Elementos de UI
    //
    ColumnLayout {
        id: layout
        spacing: app.spacing
        anchors.centerIn: parent

        Image {
            source: "qrc:/imagenes/unaq.png"
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            height: app.spacing
        }

        Label {
            text: AppName
            font.bold: true
            font.pixelSize: 18
            Layout.alignment: Qt.AlignHCenter
            horizontalAlignment: Label.AlignHCenter
        }

        Label {
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter
            horizontalAlignment: Label.AlignHCenter
            text: qsTr("Versión %1").arg(AppVersion)
        }

        Item {
            height: app.spacing
        }

        Label {
            opacity: 0.8
            Layout.alignment: Qt.AlignHCenter
            verticalAlignment: Label.AlignHCenter
            text: qsTr("Desarrollado por Arath Burgos y Alex Spataru")
        }

        Label {
            opacity: 0.6
            Layout.alignment: Qt.AlignHCenter
            verticalAlignment: Label.AlignHCenter
            text: qsTr("Distribuido bajo la licencia MIT")
        }

        Item {
            height: app.spacing
        }

        Button {
            text: qsTr("Cerrar")
            onClicked: window.close()
            Layout.alignment: Qt.AlignRight
        }
    }
}
