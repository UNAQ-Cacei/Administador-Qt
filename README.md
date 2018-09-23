# Administrador-Qt

Software de administración para la base de datos CACEI. Actualmente bajo desarrollo intensivo.

## Compilación

Para compilar el proyecto, se necesita descargar e instalar [Qt](https://qt.io/download). Una vez que se haya instalado Qt, abra el archivo `Administrador-Qt.pro` en Qt Creator, seleccione el kit apropiado y presione el botón de compilar.

Alternativamente, abra una terminal y ejecute los siguientes comandos:

        mkdir build
        cd build
        qmake ../
        make -j4
        
### Generación del instalador (en desarrollo)

Para poder crear un instalador para Windows:

1. Descargar e instalar [NSIS](http://nsis.sourceforge.net/Main%5FPage).
2. Compile el proyecto y verifique que no haya errores ni advertencias.
3. Copie el archivo ejecutable en un nuevo directorio.
4. Abrir la línea de comandos de Qt.
5. Navegue a la ubicación del archivo ejecutable.
6. Ejecute `windeployqt *.exe -qmldir=%Qt%/bin/qml`. Donde `%Qt%` es la ubicación donde Qt fue instalado.
7. Copie el archivo [setup.nsi](deploy/windows/nsis/setup.nsi) y colóquelo en un directorio arriba de la carpeta de la aplicación.
7. Copie el archivo [license.txt](deploy/windows/nsis/license.txt) y colóquelo en un directorio arriba de la carpeta de la aplicación.
8. Haga clic derecho en `setup.nsi` y seleccione "Compile with NSIS".
9. Una vez que se haya generado el instalador, verifique que funcione adecuadamente.

### Notas para Windows 10

Si el administrador no puede abrir la base de datos, es necesario instalar el driver de bases de datos de Access de 32 bits desde: [https://www.microsoft.com/en-us/download/details.aspx?id=13255](https://www.microsoft.com/en-us/download/details.aspx?id=13255)

## Licencia

Este proyecto se distribuye bajo la licencia de MIT. Para más información, favor de leer [este documento](LICENCIA.md).
