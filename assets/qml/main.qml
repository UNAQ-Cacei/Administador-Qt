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

import "Dialogos"
import "MainWindow"

Item {
    id: app

    //
    // Variables 'globales' de la aplicacion
    //
    readonly property int spacing: 8

    //
    // Ventana principal
    //
    MainWindow {
        Component.onCompleted: showNormal()

        onAcercaDe: acercaDe.show()
        onNuevoProfesor: nuevoProfesor.show()
        onReportarError: {}
        onGenerarReporteIndividual: buscarProfesor.show()
        onModificarDatosExistentes: buscarProfesor.show()
        onGenerarReporteDeArea: generarReporteDeArea.show()
        onGenerarReporteGeneral: generarReporteGeneral.show()
        onNuevaBaseDeDatos: CAdministradorDb.nuevaBaseDeDatos()
        onCerrarBaseDeDatos: CAdministradorDb.cerrarBaseDeDatos()
        onAbrirBaseDeDatosExistente: CAdministradorDb.abrirBaseDeDatos()
        onEstadisticasBaseDeDatos: CAdministradorDb.mostrarEstadisticas()
    }

    //
    // Dialogo de buscar profesor, se usa en varias
    // partes de la aplicacion
    //
    BuscarProfesor {
        id: buscarProfesor
        onProfesorSeleccionado: {}
    }

    //
    // Otros dialogos de la aplicacion
    //
    AcercaDe {id: acercaDe }
    NuevoProfesor {id: nuevoProfesor }
    GenerarReporte {id: generarReporteGeneral }
    GenerarReporteDeArea {id: generarReporteDeArea }
    ModificarDatosExistentes {id: modificarDatosExistentes }
    GenerarReporteIndividual {id: generarReporteIndividual }
}
