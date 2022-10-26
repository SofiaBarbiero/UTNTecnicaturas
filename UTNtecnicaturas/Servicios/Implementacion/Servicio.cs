using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTNtecnicaturas.Datos.Implementacion;
using UTNtecnicaturas.Datos.Intefaz;
using UTNtecnicaturas.Dominio;

namespace UTNtecnicaturas.Servicios
{
    internal class Servicio : IServicio
    {
        private IDaoUTN dao;
        public Servicio()
        {
            dao=new DaoUTN();
        }
        public List<Barrio> ObtenerBarrio()
        {
            return dao.ObtenerBarrio();
        }

        public List<Cuatrimestre> ObtenerCuatrimestre()
        {
            return dao.ObtenerCuatrimestre();
        }

        public List<Curso> ObtenerCursos()
        {
            return dao.ObtenerCursos();
        }

        public List<EstadoCivil> ObtenerEstadoCivil()
        {
            return dao.ObtenerEstadoCivil();
        }

        public List<EstadoLaboral> ObtenerEstadoLaboral()
        {
            return dao.ObtenerEstadoLaboral();
        }

        public int ObtenerLegajoEstudiante(Estudiante oEstudiante)
        {
           return dao.ObtenerLegajoEstudiante(oEstudiante);
        }

        public bool ObtenerMaestro(MaestroEstMat maestro)
        {
            return dao.ObtenerMaestro(maestro);
        }

        public List<Materia> ObtenerMateria(int param)
        {
            return dao.ObtenerMateria(param);
        }

        public List<Nacionalidad> ObtenerNacionalidad()
        {
            return dao.ObtenerNacionalidad();
        }

        public List<SituacionHabitacional> ObtenerSituacionHabit()
        {
            return dao.ObtenerSituacionHabit();
        }

        public List<Tecnicatura> ObtenerTecnicatura()
        {
            return dao.ObtenerTecnicatura();
        }

        public List<TipoDocumento> ObtenerTipoDoc()
        {
            return dao.ObtenerTipoDoc();
        }
    }
}
