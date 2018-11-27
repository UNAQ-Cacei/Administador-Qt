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

#include "Profesor.h"
#include "AdministradorDb.h"

//------------------------------------------------------------------------------
// Funciones de importacion/exportacion de listas
//------------------------------------------------------------------------------

static QString ExportarLista (const QStringList& lista) {
    QString datos;

    foreach (QString elemento, lista) {
        datos.append(elemento);
        datos.append(";");
    }

    return datos;
}

//------------------------------------------------------------------------------
// Inicializacion/descruccion de la clase
//------------------------------------------------------------------------------

Profesor::Profesor (const int id) : QObject() {
    // Registrar un nuevo profesor si la ID es menor a 0
    if (id < 0) {

    }

    // Obtener los datos de un profesor existente
    else {

    }
}

Profesor::~Profesor() {

}

int Profesor::id() const {
    return m_identificadorProfesor;
}

//------------------------------------------------------------------------------
// Lectura de datos personales
//------------------------------------------------------------------------------

Profesor::Genero Profesor::leerGenero(){
    return (Genero) leerDato("Datos Personales", "Genero").toInt();
}

QString Profesor::leerCURP(){
    return leerDato("Datos Personales", "CURP").toString();
}

QString Profesor::leerNombres(){
    return leerDato("Datos Personales", "Nombres").toString();
}

int Profesor::leerNumeroDeHijos(){
    return leerDato("Datos Personales", "Num de Hijos").toInt();
}

Profesor::EstadoCivil Profesor::leerEstadoCivil() {
    return (EstadoCivil) leerDato("Datos Personales", "Estado Civil").toInt();
}

QString Profesor::leerApellidoPaterno(){
    return leerDato("Datos Personales", "Apellido Paterno").toString();
}

QString Profesor::leerApellidoMaterno(){
    return leerDato("Datos Personales", "Apellido Materno").toString();
}

QString Profesor::leerLugarNacimiento(){
    return leerDato("Datos Personales", "Lugar de Nacimiento").toString();
}

QDateTime Profesor::leerFechaNacimiento(){
    return leerDato("Datos Personales", "Fecha de Nacimiento").toDateTime();
}

//------------------------------------------------------------------------------
// Lectura de datos generales
//------------------------------------------------------------------------------

QString Profesor::leerAdscripcion(){}
int Profesor::leerNumeroDeEmpleado(){}
QString Profesor::leerProgramaImpartido(){}
bool Profesor::leerContratacionPorPlaza(){}
int Profesor::leerAntiguedadEnInstitucion(){}
QString Profesor::leerCategoriaDeContratacion(){}

//------------------------------------------------------------------------------
// Lectura de datos de certificaciones
//------------------------------------------------------------------------------

bool Profesor::leerCuentaConCertificacion(){}
QStringList Profesor::leerCertificacionVigencias(){}
QStringList Profesor::leerCertificacionesObtenidas(){}
QStringList Profesor::leerCertificacionInstituciones(){}
QStringList Profesor::leerCertificacionFechasDeObtencion(){}

//------------------------------------------------------------------------------
// Lectura de datos de cursos
//------------------------------------------------------------------------------

QStringList Profesor::leerCursos(){}
QStringList Profesor::leerCursosFechas(){}
QStringList Profesor::leerCursosInstituciones(){}
QStringList Profesor::leerCursosEmpresasDeApoyo(){}

//------------------------------------------------------------------------------
// Lectura de datos de licenciatura
//------------------------------------------------------------------------------

QString Profesor::leerLicenciaturaPais(){}
QString Profesor::leerLicenciaturaCedula(){}
QString Profesor::leerLicenciaturaTitulo(){}
QString Profesor::leerLicenciaturaInstitucion(){}
QString Profesor::leerLicenciaturaEstatusFinal(){}
QString Profesor::leerLicenciaturaFechaDeObtencion(){}

//------------------------------------------------------------------------------
// Lectura de datos de maestria
//------------------------------------------------------------------------------

QString Profesor::leerMaestriaPais(){}
QString Profesor::leerMaestriaCedula(){}
QString Profesor::leerMaestriaTitulo(){}
QString Profesor::leerMaestriaInstitucion(){}
QString Profesor::leerMaestriaEstatusFinal(){}
QString Profesor::leerMaestriaLineaTerminal(){}
QString Profesor::leerMaestriaFechaDeObtencion(){}

//------------------------------------------------------------------------------
// Lectura de datos de doctorado
//------------------------------------------------------------------------------

QString Profesor::leerDoctoradoPais(){}
QString Profesor::leerDoctoradoCedula(){}
QString Profesor::leerDoctoradoTitulo(){}
QString Profesor::leerDoctoradoInstitucion(){}
QString Profesor::leerDoctoradoEstatusFinal(){}
QString Profesor::leerDoctoradoFechaDeObtencion(){}

//------------------------------------------------------------------------------
// Lectura de datos de especialidad
//------------------------------------------------------------------------------

QString Profesor::leerEspecialidadPais(){}
QString Profesor::leerEspecialidadArea(){}
QString Profesor::leerEspecialidadCedula(){}
QString Profesor::leerEspecialidadInstitucion(){}
QString Profesor::leerEspecialidadEstatusFinal(){}
QString Profesor::leerEspecialidadFechaDeObtencion(){}

//------------------------------------------------------------------------------
// Lectura de datos de experiencia docente
//------------------------------------------------------------------------------

bool Profesor::leerExpDocenteParticipacion(){}
QStringList Profesor::leerExpDocenteFechasInicio(){}
QStringList Profesor::leerExpDocenteInstituciones(){}
QStringList Profesor::leerExpDocenteFechasTerminacion(){}
QStringList Profesor::leerExpDocenteNivelesEducativos(){}
QStringList Profesor::leerExpDocenteMateriasImpartidas(){}

//------------------------------------------------------------------------------
// Lectura de datos de experiencia laboral
//------------------------------------------------------------------------------

QStringList Profesor::leerExpLaboralPeriodos(){}
QStringList Profesor::leerExpLaboralProyectos(){}
QStringList Profesor::leerExpLaboralOrganizaciones(){}
QStringList Profesor::leerExpLaboralResponsabilidades(){}

//------------------------------------------------------------------------------
// Lectura de datos de experiencia en diseño ingenieril
//------------------------------------------------------------------------------

QStringList Profesor::leerExpDisenoIngPeriodos(){}
QStringList Profesor::leerExpDisenoIngProyectos(){}
QStringList Profesor::leerExpDisenoIngOrganizaciones(){}
QStringList Profesor::leerExpDisenoIngResponsabilidades(){}

//------------------------------------------------------------------------------
// Escritura de datos personales
//------------------------------------------------------------------------------

void Profesor::cambiarGenero (const Genero genero) {
    escribirDato("Datos Personales", "Genero", QVariant ((int) genero));
}

void Profesor::cambiarCURP (const QString& curp) {
    escribirDato("Datos Personales", "CURP", QVariant (curp));
}

void Profesor::cambiarNombres (const QString& nombres) {
    escribirDato("Datos Personales", "Nombres", QVariant (nombres));
}

void Profesor::cambiarNumeroDeHijos (const int numHijos) {
    escribirDato("Datos Personales", "Num Hijos", QVariant (numHijos));
}

void Profesor::cambiarLugarNacimiento (const QString& lugar) {
    escribirDato("Datos Personales", "Lugar de Nacimiento", QVariant (lugar));
}

void Profesor::cambiarEstadoCivil (const EstadoCivil estado) {
    escribirDato("Datos Personales", "Estado Civil", QVariant ((int) estado));
}

void Profesor::cambiarFechaNacimiento(const QDateTime& fecha) {
    escribirDato("Datos Personales", "Fecha de Nacimiento", QVariant (fecha));
}

void Profesor::cambiarApellidoPaterno (const QString& apellido) {
    escribirDato("Datos Personales", "Apellido Paterno", QVariant (apellido));
}

void Profesor::cambiarApellidoMaterno (const QString& apellido) {
    escribirDato("Datos Personales", "Apellido Materno", QVariant (apellido));
}

//------------------------------------------------------------------------------
// Escritura de datos generales
//------------------------------------------------------------------------------

void Profesor::cambiarNumeroEmpleado (const int num) {
    escribirDato("Datos Generales", "Num Empleado", QVariant ((int) num));
}

void Profesor::cambiarAdscripcion (const QString& adscripcion) {
    escribirDato("Datos Generales", "Adscripcion", QVariant (adscripcion));
}

void Profesor::cambiarProgramaImpartido (const QString& programa) {
    escribirDato("Datos Generales", "Programa Impartido", QVariant (programa));
}

void Profesor::cambiarCategoriaContratacion (const QString& categoria) {
    escribirDato("Datos Generales", "Categoria de Contratacion", QVariant (categoria));
}

void Profesor::cambiarContratacionPorPlaza (const bool contratacionPlaza) {
    escribirDato("Datos Generales", "Plaza", QVariant (contratacionPlaza));
}

void Profesor::cambiarAntiguedadInstitucion (const int antiguedadInstitucion) {
    escribirDato("Datos Generales", "Antiguedad", QVariant (antiguedadInstitucion));
}

//------------------------------------------------------------------------------
// Escritura de datos de certificaciones
//------------------------------------------------------------------------------

void Profesor::cambiarCertificacionVigencias (const QStringList& vigencias) {
    QString datos = ExportarLista (vigencias);
    escribirDato("Certificaciones", "Vigencias", QVariant (datos));
}

void Profesor::cambiarCertificacionFechasObtencion (const QStringList& fechas) {
    QString datos = ExportarLista (fechas);
    escribirDato("Certificaciones", "Años de Obtencion", QVariant (datos));
}

void Profesor::cambiarCertificacionesObtenidas (const QStringList& certificaciones) {
    QString datos = ExportarLista (certificaciones);
    escribirDato("Certificaciones", "Certificaciones Obtenidas", QVariant (datos));
}

void Profesor::cambiarCertificacionInstituciones (const QStringList& instituciones) {
    QString datos = ExportarLista (instituciones);
    escribirDato("Certificaciones", "Instituciones", QVariant (datos));
}

void Profesor::cambiarCuentaConCertificaciones (const bool cuentaConCertificaciones) {
    escribirDato("Certificaciones", "Cuenta con Certificaciones", QVariant (cuentaConCertificaciones));
}

//------------------------------------------------------------------------------
// Escritura de datos de cursos
//------------------------------------------------------------------------------

void Profesor::cambiarCursos (const QStringList& cursos) {
    QString datos = ExportarLista(cursos);
    escribirDato("Cursos", "Cursos", QVariant (datos));
}

void Profesor::cambiarCursosFechas (const QStringList& fechas) {
    QString datos = ExportarLista(fechas);
    escribirDato("Cursos", "Fechas", QVariant (datos));
}

void Profesor::cambiarCursosEmpresasDeApoyo (const QStringList& empresas) {
    QString datos = ExportarLista(empresas);
    escribirDato("Cursos", "Empresas de Apoyo", QVariant (datos));
}

void Profesor::cambiarCursosInstituciones (const QStringList& instituciones) {
    QString datos = ExportarLista(instituciones);
    escribirDato("Cursos", "Instituciones", QVariant (datos));
}

//------------------------------------------------------------------------------
// Escritura de datos de licenciatura
//------------------------------------------------------------------------------

void Profesor::cambiarLicenciaturaPais (const QString& pais) {
    escribirDato("Licenciatura", "Pais", QVariant (pais));
}

void Profesor::cambiarLicenciaturaCedula (const QString& cedula) {
    escribirDato("Licenciatura", "Cedula", QVariant (cedula));
}

void Profesor::cambiarLicenciaturaTitulo (const QString& titulo) {
    escribirDato("Licenciatura", "Titulo", QVariant (titulo));
}

void Profesor::cambiarLicenciaturaFechaObtencion (const int fecha) {
    escribirDato("Licenciatura", "Año de Obtencion", QVariant (fecha));
}

void Profesor::cambiarLicenciaturaEstatusFinal (const QString& estatus) {
    escribirDato("Licenciatura", "Estatus Final", QVariant (estatus));
}

void Profesor::cambiarLicenciaturaInstitucion (const QString& institucion) {
    escribirDato("Licenciatura", "Institucion", QVariant (institucion));
}

//------------------------------------------------------------------------------
// Escritura de datos de maestria
//------------------------------------------------------------------------------

void Profesor::cambiarMaestriaPais (const QString& pais) {
    escribirDato("Maestria", "Pais", QVariant (pais));
}

void Profesor::cambiarMaestriaCedula (const QString& cedula) {
    escribirDato("Maestria", "Cedula", QVariant (cedula));
}

void Profesor::cambiarMaestriaTitulo (const QString& titulo) {
    escribirDato("Maestria", "Titulo", QVariant (titulo));
}

void Profesor::cambiarMaestriaFechaObtencion (const int fecha) {
    escribirDato("Maestria", "Año de Obtencion", QVariant (fecha));
}

void Profesor::cambiarMaestriaEstatusFinal (const QString& estatus) {
    escribirDato("Maestria", "Estatus Final", QVariant (estatus));
}

void Profesor::cambiarMaestriaInstitucion (const QString& institucion) {
    escribirDato("Maestria", "Institucion", QVariant (institucion));
}

void Profesor::cambiarMaestriaLineaTerminal (const QString& lineaTerminal) {
    escribirDato("Maestria", "Linea Terminal", QVariant (lineaTerminal));
}

//------------------------------------------------------------------------------
// Escritura de datos de doctorado
//------------------------------------------------------------------------------

void Profesor::cambiarDoctoradoPais (const QString& pais) {
    escribirDato("Doctorado", "Pais", QVariant (pais));
}

void Profesor::cambiarDoctoradoCedula (const QString& cedula) {
    escribirDato("Doctorado", "Cedula", QVariant (cedula));
}

void Profesor::cambiarDoctoradoTitulo (const QString& titulo) {
    escribirDato("Doctorado", "Titulo", QVariant (titulo));
}

void Profesor::cambiarDoctoradoFechaObtencion (const int fecha) {
    escribirDato("Doctorado", "Año de Obtencion", QVariant (fecha));
}

void Profesor::cambiarDoctoradoEstatusFinal (const QString& estatus) {
    escribirDato("Doctorado", "Estatus Final", QVariant (estatus));
}

void Profesor::cambiarDoctoradoInstitucion (const QString& institucion) {
    escribirDato("Doctorado", "Institucion", QVariant (institucion));
}

//------------------------------------------------------------------------------
// Escritura de datos de especialidad
//------------------------------------------------------------------------------

void Profesor::cambiarEspecialidadArea (const QString& area) {
    escribirDato("Especialidad", "Area", QVariant (area));
}

void Profesor::cambiarEspecialidadPais (const QString& pais) {
    escribirDato("Especialidad", "Pais", QVariant (pais));
}

void Profesor::cambiarEspecialidadCedula (const QString& cedula) {
    escribirDato("Especialidad", "Cedula", QVariant (cedula));
}

void Profesor::cambiarEspecialidadFechaObtencion (const int fecha) {
    escribirDato("Especialidad", "Año de Obtencion", QVariant (fecha));
}

void Profesor::cambiarEspecialidadEstatusFinal (const QString& estatus) {
    escribirDato("Especialidad", "Estatus Final", QVariant (estatus));
}

void Profesor::cambiarEspecialidadInstitucion (const QString& institucion) {
    escribirDato("Especialidad", "Institucion", QVariant (institucion));
}

//------------------------------------------------------------------------------
// Escritura de datos de experiencia docente
//------------------------------------------------------------------------------

void Profesor::cambiarExpDocenteParticipacion (const bool participacion) {
    escribirDato("Experiencia Docente", "Participacion", QVariant (participacion));
}

void Profesor::cambiarExpDocenteFechasInicio (const QStringList& fechas) {
    QString datos = ExportarLista(fechas);
    escribirDato("Experiencia Docente", "Años de Inicio", QVariant (datos));
}

void Profesor::cambiarExpDocenteFechasTerminacion (const QStringList& fechas) {
    QString datos = ExportarLista(fechas);
    escribirDato("Experiencia Docente", "Años de Terminacion", QVariant (datos));
}

void Profesor::cambiarExpDocenteNivelesEducativos (const QStringList& niveles) {
    QString datos = ExportarLista(niveles);
    escribirDato("Experiencia Docente", "Niveles Educativos", QVariant (datos));
}

void Profesor::cambiarExpDocenteInstituciones (const QStringList& instituciones) {
    QString datos = ExportarLista(instituciones);
    escribirDato("Experiencia Docente", "Instituciones", QVariant (datos));
}

void Profesor::cambiarExpDocenteMateriasImpartidas (const QStringList& materias) {
    QString datos = ExportarLista(materias);
    escribirDato("Experiencia Docente", "Materias Impartidas", QVariant (datos));
}

//------------------------------------------------------------------------------
// Escritura de datos de experiencia laboral
//------------------------------------------------------------------------------

void Profesor::cambiarExpLaboralPeriodos (const QStringList& periodos) {
    QString datos = ExportarLista(periodos);
    escribirDato("Experiencia Laboral", "Periodos", QVariant (datos));
}

void Profesor::cambiarExpLaboralProyectos (const QStringList& proyectos) {
    QString datos = ExportarLista(proyectos);
    escribirDato("Experiencia Laboral", "Proyectos", QVariant (datos));
}

void Profesor::cambiarExpLaboralOrganizaciones (const QStringList& organizaciones) {
    QString datos = ExportarLista(organizaciones);
    escribirDato("Experiencia Laboral", "Organizaciones", QVariant (datos));
}

void Profesor::cambiarExpLaboralResponsabilidades (const QStringList& responsabilidades) {
    QString datos = ExportarLista(responsabilidades);
    escribirDato("Experiencia Laboral", "Responsabilidades", QVariant (datos));
}

//------------------------------------------------------------------------------
// Escritura de datos de diseño ingenieria
//------------------------------------------------------------------------------

void Profesor::cambiarExpDisenoIngPeriodos (const QStringList& periodos) {
    QString datos = ExportarLista(periodos);
    escribirDato("Experiencia Diseño Ingenieril", "Periodos", QVariant (datos));
}

void Profesor::cambiarExpDisenoIngProyectos (const QStringList& proyectos) {
    QString datos = ExportarLista(proyectos);
    escribirDato("Experiencia Diseño Ingenieril", "Proyectos", QVariant (datos));
}

void Profesor::cambiarExpDisenoIngOrganizaciones (const QStringList& organizaciones) {
    QString datos = ExportarLista(organizaciones);
    escribirDato("Experiencia Diseño Ingenieril", "Organizaciones", QVariant (datos));
}

void Profesor::cambiarExpDisenoIngResponsabilidades (const QStringList& responsabilidades) {
    QString datos = ExportarLista(responsabilidades);
    escribirDato("Experiencia Diseño Ingenieril", "Responsabilidades", QVariant (datos));
}

//------------------------------------------------------------------------------
// Lectura/escritura de base de datos
//------------------------------------------------------------------------------

QVariant Profesor::leerDato (const QString &tabla, const QString& campo) {    
    if (!AdministradorDb::instancia()->disponible())
        return QVariant(INT_MIN);

    QSqlQuery query(AdministradorDb::instancia()->baseDeDatos());
    query.prepare(QString(
                      "SELECT \"%1\" FROM \"%2\" WHERE ID='%3';")
                  .arg(campo)
                  .arg(tabla)
                  .arg(id()));

    Q_ASSERT(query.exec());

    if (query.next())
        return query.result()->handle();

    return QVariant(INT_MAX);
}

void Profesor::escribirDato (const QString &tabla,
                             const QString& campo,
                             const QVariant& dato) {

}
