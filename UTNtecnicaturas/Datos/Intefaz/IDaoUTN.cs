using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTNtecnicaturas.Dominio;

namespace UTNtecnicaturas.Datos.Intefaz
{
    internal interface IDaoUTN
    {
        //CARGA FORMULARIO DE INGRESO
        List<Nacionalidad> ObtenerNacionalidad();
        List<TipoDocumento> ObtenerTipoDoc();
        List<SituacionHabitacional> ObtenerSituacionHabit();
        List<EstadoCivil> ObtenerEstadoCivil();
        List<EstadoLaboral> ObtenerEstadoLaboral();
        List<Barrio> ObtenerBarrio();
        int ObtenerLegajoEstudiante(Estudiante oEstudiante);

        // CARGA DE FORMULARIO TECNICATURAS

        List<Materia> ObtenerMateria(int param);

        List<Tecnicatura> ObtenerTecnicatura();
        List<Curso> ObtenerCursos();
        List<Cuatrimestre> ObtenerCuatrimestre();

        bool ObtenerMaestro(MaestroEstMat maestro);
    }
}
