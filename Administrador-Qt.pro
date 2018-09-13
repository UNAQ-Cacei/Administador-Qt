#
# Copyright (c) 2018 Los Autores del Proyecto <AUTORES.md>
#
# Se concede permiso, libre de cargos, a cualquier persona que obtenga una copia
# de este software y de los archivos de documentación asociados (el "Software"),
# para utilizar el Software sin restricción, incluyendo sin limitación los
# derechos a usar, copiar, modificar, fusionar, publicar, distribuir,
# sublicenciar, y/o vender copias del Software, y a permitir a las personas a
# las que se les proporcione el Software a hacer lo mismo, sujeto a las
#  siguientes condiciones:
#
# El aviso de copyright anterior y este aviso de permiso se incluirán en todas
# las copias o partes sustanciales del Software.
#
# EL SOFTWARE SE PROPORCIONA "TAL CUAL", SIN GARANTÍA DE NINGÚN TIPO, EXPRESA O
# IMPLÍCITA, INCLUYENDO PERO NO LIMITADA A GARANTÍAS DE COMERCIALIZACIÓN,
# IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN. EN NINGÚN CASO LOS
# AUTORES O PROPIETARIOS DE LOS DERECHOS DE AUTOR SERÁN RESPONSABLES DE NINGUNA
# RECLAMACIÓN, DAÑOS U OTRAS RESPONSABILIDADES, YA SEA EN UNA ACCIÓN DE
# CONTRATO, AGRAVIO O CUALQUIER OTRO MOTIVO, DERIVADAS DE, FUERA DE O EN
# CONEXIÓN CON EL SOFTWARE O SU USO U OTRO TIPO DE ACCIONES EN EL SOFTWARE.
#

#-------------------------------------------------------------------------------
# Opciones de compilación
#-------------------------------------------------------------------------------

UI_DIR = uic
MOC_DIR = moc
RCC_DIR = qrc
OBJECTS_DIR = obj

CONFIG += c++11

#-------------------------------------------------------------------------------
# Configuración del proyecto
#-------------------------------------------------------------------------------

TEMPLATE = app
TARGET = administrador-cacei

CONFIG += qtc_runnable
CONFIG += resources_big
CONFIG += qtquickcompiler

QT += xml
QT += svg
QT += core
QT += quick
QT += widgets

QTPLUGIN += qsvg
QT_SELECT = qt5 qmake

#-------------------------------------------------------------------------------
# Configuracion para cada SO
#-------------------------------------------------------------------------------

win32* {
    RC_FILE = deploy/windows/resources/info.rc
}

macx* {
    ICON = deploy/osx/icon.icns
    RC_FILE = deploy/osx/icon.icns
    QMAKE_INFO_PLIST = deploy/osx/info.plist
}

linux:!android {
    target.path = /usr/bin
    icon.path = /usr/share/pixmaps
    desktop.path = /usr/share/applications
    icon.files += deploy/linux/administrador-cacei.svg
    desktop.files += deploy/linux/administrador-cacei.desktop

    INSTALLS += target desktop icon
}

#-------------------------------------------------------------------------------
# Importar código fuente
#-------------------------------------------------------------------------------

HEADERS += \
    src/AppInfo.h \
    src/AdministradorDb.h \
    src/GeneradorPDF.h \
    src/Profesor.h

SOURCES += \
    src/AdministradorDb.cpp \
    src/GeneradorPDF.cpp \
    src/main.cpp \
    src/Profesor.cpp

RESOURCES += \
    assets/qml/qml.qrc \
    assets/imagenes/imagenes.qrc \
    assets/iconos/iconos.qrc

OTHER_FILES += \
    assets/qml/Dialogos/AcercaDe.qml \
    assets/qml/MainWindow/Toolbar.qml \
    assets/qml/main.qml \
    assets/qml/MainWindow/MainWindow.qml \
    assets/qml/MainWindow/Menubar.qml \ 
    assets/qml/MainWindow/ToolSeparator.qml


