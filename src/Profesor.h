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

#ifndef PROFESOR_H
#define PROFESOR_H

#include <QObject>
#include <QVariant>
#include <QDateTime>

class Profesor : public QObject
{
public:
    explicit Profesor (const int id);
    ~Profesor();

    enum Genero {
        Genero_Mujer          = 0x00,
        Genero_Hombre         = 0x01,
        Genero_NoEspecificado = 0x02
    };

    enum EstadoCivil {
        EstadoCivil_Casado         = 0x00,
        EstadoCivil_Divorciado     = 0x01,
        EstadoCivil_Soltero        = 0x02,
        EstadoCivil_Viudo          = 0x03,
        EstadoCivil_Comprometido   = 0x04,
        EstadoCivil_NoEspecificado = 0x05,
    };

    int id() const;

    /* Lectura de datos personales */
    Genero leerGenero();
    QString leerCURP();
    QString leerNombres();
    int leerNumeroDeHijos();
    EstadoCivil leerEstadoCivil();
    QString leerApellidoPaterno();
    QString leerApellidoMaterno();
    QString leerLugarNacimiento();
    QDateTime leerFechaNacimiento();

    /* Lectura de datos generales */
    QString leerAdscripcion();
    int leerNumeroDeEmpleado();
    QString leerProgramaImpartido();
    bool leerContratacionPorPlaza();
    int leerAntiguedadEnInstitucion();
    QString leerCategoriaDeContratacion();

    /* Lectura de datos de certificaciones */
    bool leerCuentaConCertificacion();
    QStringList leerCertificacionVigencias();
    QStringList leerCertificacionesObtenidas();
    QStringList leerCertificacionInstituciones();
    QStringList leerCertificacionFechasDeObtencion();

    /* Lectura de datos de cursos */
    QStringList leerCursos();
    QStringList leerCursosFechas();
    QStringList leerCursosInstituciones();
    QStringList leerCursosEmpresasDeApoyo();

    /* Lectura de datos de licenciatura */
    QString leerLicenciaturaPais();
    QString leerLicenciaturaCedula();
    QString leerLicenciaturaTitulo();
    QString leerLicenciaturaInstitucion();
    QString leerLicenciaturaEstatusFinal();
    QString leerLicenciaturaFechaDeObtencion();

    /* Lectura de datos de maestria */
    QString leerMaestriaPais();
    QString leerMaestriaCedula();
    QString leerMaestriaTitulo();
    QString leerMaestriaInstitucion();
    QString leerMaestriaEstatusFinal();
    QString leerMaestriaLineaTerminal();
    QString leerMaestriaFechaDeObtencion();

    /* Lectura de datos de doctorado */
    QString leerDoctoradoPais();
    QString leerDoctoradoCedula();
    QString leerDoctoradoTitulo();
    QString leerDoctoradoInstitucion();
    QString leerDoctoradoEstatusFinal();
    QString leerDoctoradoFechaDeObtencion();

    /* Lectura de datos de especialidad */
    QString leerEspecialidadPais();
    QString leerEspecialidadArea();
    QString leerEspecialidadCedula();
    QString leerEspecialidadInstitucion();
    QString leerEspecialidadEstatusFinal();
    QString leerEspecialidadFechaDeObtencion();

    /* Lectura de datos de experiencia docente */
    bool leerExpDocenteParticipacion();
    QStringList leerExpDocenteFechasInicio();
    QStringList leerExpDocenteInstituciones();
    QStringList leerExpDocenteFechasTerminacion();
    QStringList leerExpDocenteNivelesEducativos();
    QStringList leerExpDocenteMateriasImpartidas();

    /* Lectura de datos de experiencia laboral */
    QStringList leerExpLaboralPeriodos();
    QStringList leerExpLaboralProyectos();
    QStringList leerExpLaboralOrganizaciones();
    QStringList leerExpLaboralResponsabilidades();

    /* Lectura de datos de experiencia  en diseño ingenieril */
    QStringList leerExpDisenoIngPeriodos();
    QStringList leerExpDisenoIngProyectos();
    QStringList leerExpDisenoIngOrganizaciones();
    QStringList leerExpDisenoIngResponsabilidades();

public slots:
    /* Escritura de datos personales */
    void cambiarGenero (const Genero genero);
    void cambiarCURP (const QString& curp);
    void cambiarNombres (const QString& nombres);
    void cambiarNumeroDeHijos (const int numHijos);
    void cambiarLugarNacimiento (const QString& lugar);
    void cambiarEstadoCivil (const EstadoCivil estado);
    void cambiarFechaNacimiento (const QDateTime& fecha);
    void cambiarApellidoPaterno (const QString& apellido);
    void cambiarApellidoMaterno (const QString& apellido);

    /* Escritura de datos generales */
    void cambiarNumeroEmpleado (const int num);
    void cambiarAdscripcion (const QString& adscripcion);
    void cambiarProgramaImpartido (const QString& programa);
    void cambiarCategoriaContratacion (const QString& categoria);
    void cambiarContratacionPorPlaza (const bool contratacionPlaza);
    void cambiarAntiguedadInstitucion (const int antiguedadInstitucion);

    /* Escritura de certificaciones */
    void cambiarCertificacionVigencias (const QStringList& vigencias);
    void cambiarCertificacionFechasObtencion (const QStringList& fechas);
    void cambiarCertificacionesObtenidas (const QStringList& certificaciones);
    void cambiarCertificacionInstituciones (const QStringList& instituciones);
    void cambiarCuentaConCertificaciones (const bool cuentaConCertificaciones);

    /* Escritura de cursos */
    void cambiarCursos (const QStringList& cursos);
    void cambiarCursosFechas (const QStringList& fechas);
    void cambiarCursosEmpresasDeApoyo (const QStringList& empresas);
    void cambiarCursosInstituciones (const QStringList& instituciones);

    /* Escritura de licenciatura */
    void cambiarLicenciaturaPais (const QString& pais);
    void cambiarLicenciaturaCedula (const QString& cedula);
    void cambiarLicenciaturaTitulo (const QString& titulo);
    void cambiarLicenciaturaFechaObtencion (const int fecha);
    void cambiarLicenciaturaEstatusFinal (const QString& estatus);
    void cambiarLicenciaturaInstitucion (const QString& institucion);

    /* Escritura de maestria */
    void cambiarMaestriaPais (const QString& pais);
    void cambiarMaestriaCedula (const QString& cedula);
    void cambiarMaestriaTitulo (const QString& titulo);
    void cambiarMaestriaFechaObtencion (const int fecha);
    void cambiarMaestriaEstatusFinal (const QString& estatus);
    void cambiarMaestriaInstitucion (const QString& institucion);
    void cambiarMaestriaLineaTerminal (const QString& lineaTerminal);

    /* Escritura de doctorado */
    void cambiarDoctoradoPais (const QString& pais);
    void cambiarDoctoradoCedula (const QString& cedula);
    void cambiarDoctoradoTitulo (const QString& titulo);
    void cambiarDoctoradoFechaObtencion (const int fecha);
    void cambiarDoctoradoEstatusFinal (const QString& estatus);
    void cambiarDoctoradoInstitucion (const QString& institucion);

    /* Escritura de especialidad */
    void cambiarEspecialidadArea (const QString& area);
    void cambiarEspecialidadPais (const QString& pais);
    void cambiarEspecialidadCedula (const QString& cedula);
    void cambiarEspecialidadFechaObtencion (const int fecha);
    void cambiarEspecialidadEstatusFinal (const QString& estatus);
    void cambiarEspecialidadInstitucion (const QString& institucion);

    /* Escritura de experiencia docente */
    void cambiarExpDocenteParticipacion (const bool participacion);
    void cambiarExpDocenteFechasInicio (const QStringList& fechas);
    void cambiarExpDocenteFechasTerminacion (const QStringList& fechas);
    void cambiarExpDocenteNivelesEducativos (const QStringList& niveles);
    void cambiarExpDocenteInstituciones (const QStringList& instituciones);
    void cambiarExpDocenteMateriasImpartidas (const QStringList& materias);

    /* Escritura de experiencia laboral */
    void cambiarExpLaboralPeriodos (const QStringList& periodos);
    void cambiarExpLaboralProyectos (const QStringList& proyectos);
    void cambiarExpLaboralOrganizaciones (const QStringList& organizaciones);
    void cambiarExpLaboralResponsabilidades (const QStringList& responsabilidades);

    /* Escritura de experiencia diseño ingenieril */
    void cambiarExpDisenoIngPeriodos (const QStringList& periodos);
    void cambiarExpDisenoIngProyectos (const QStringList& proyectos);
    void cambiarExpDisenoIngOrganizaciones (const QStringList& organizaciones);
    void cambiarExpDisenoIngResponsabilidades (const QStringList& responsabilidades);

private:
    QVariant leerDato (const QString& tabla, const QString& campo);
    void escribirDato (const QString& tabla, const QString& campo,
                       const QVariant& dato);

private:
    int m_identificadorProfesor;
};

#endif
