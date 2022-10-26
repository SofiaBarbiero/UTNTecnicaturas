using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTNtecnicaturas.Dominio;

namespace UTNtecnicaturas.Servicios
{
    internal interface IServicio
    {
        //frm INGRESO
        List<Nacionalidad> ObtenerNacionalidad();
        List<TipoDocumento> ObtenerTipoDoc();
        List<SituacionHabitacional> ObtenerSituacionHabit();
        List<EstadoCivil> ObtenerEstadoCivil();
        List<EstadoLaboral> ObtenerEstadoLaboral();
        List<Barrio> ObtenerBarrio();
        int ObtenerLegajoEstudiante(Estudiante oEstudiante);

        //frm TECNICATURAS
        List<Tecnicatura> ObtenerTecnicatura();
        List<Materia> ObtenerMateria(int param);
        List<Curso> ObtenerCursos();
        List<Cuatrimestre> ObtenerCuatrimestre();
        bool ObtenerMaestro(MaestroEstMat maestro);

    }
}
