using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTNtecnicaturas.Datos.Intefaz;
using UTNtecnicaturas.Dominio;

namespace UTNtecnicaturas.Datos.Implementacion
{
    internal class DaoUTN : IDaoUTN
    {
        public List<Barrio> ObtenerBarrio()
        {
            List<Barrio> lstBarrio = new List<Barrio>();
            string sp_nombre = "sp_listar_barrios";
            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach(DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_barrio"].ToString());
                string barrio = fila["barrio"].ToString();   
                int id_loc = Convert.ToInt32(fila["id_localidad"].ToString());
                string localidad = fila["localidad"].ToString();
                int id_prov = Convert.ToInt32(fila["id_provincia"].ToString());
                string provincia = fila["provincia"].ToString();
                Provincia prov = new Provincia(id_prov, provincia);
                Localidad local= new Localidad(id_loc, localidad,prov);                
                Barrio bar = new Barrio(id, barrio,local);
                lstBarrio.Add(bar);
            }
            return lstBarrio;
        }
        public List<EstadoCivil> ObtenerEstadoCivil()
        {
            List<EstadoCivil> lstEstado = new List<EstadoCivil>();
            string sp_nombre = "sp_listar_estado_civil";
            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_estado_civil"].ToString());
                string estado = fila["estado_civil"].ToString();
                EstadoCivil est = new EstadoCivil(id, estado);
                lstEstado.Add(est);
            }
            return lstEstado;
        }

        public List<EstadoLaboral> ObtenerEstadoLaboral()
        {
            List<EstadoLaboral> lstEstadoLab = new List<EstadoLaboral>();
            string sp_nombre = "sp_listar_estado_laboral";
            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_estado_lab"].ToString());
                string estado = fila["estado_lab"].ToString();
                EstadoLaboral estlab = new EstadoLaboral(id, estado);
                lstEstadoLab.Add(estlab);
            }
            return lstEstadoLab;
        }

        public int ObtenerLegajoEstudiante(Estudiante oEstudiante)
        {
            string sp_nombre = "SP_INSERT_ALUMNOS";
            return Helper.ObtenerInstancia().ConfirmarEstudiante(sp_nombre, oEstudiante);
            
        }

        public List<Nacionalidad> ObtenerNacionalidad()
        {
            List<Nacionalidad> lstNacionalidad = new List<Nacionalidad>();
            string sp_nombre = "sp_listar_Nacionalidad";
            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_nacionalidad"].ToString());
                string nacion = fila["nacion"].ToString();
                Nacionalidad nac = new Nacionalidad(id, nacion);
                lstNacionalidad.Add(nac);
            }
            return lstNacionalidad;
        }

        public List<SituacionHabitacional> ObtenerSituacionHabit()
        {
            List<SituacionHabitacional> lstSituacionHabitacional = new List<SituacionHabitacional>();
            string sp_nombre = "sp_listar_sit_hab";
            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_situacion_habit"].ToString());
                string sit = fila["situacion_habit"].ToString();
                SituacionHabitacional situacion = new SituacionHabitacional(id, sit);
                lstSituacionHabitacional.Add(situacion);
            }
            return lstSituacionHabitacional;
        }


        public List<TipoDocumento> ObtenerTipoDoc()
        {
            List<TipoDocumento> lstTipoDocumento = new List<TipoDocumento>();
            string sp_nombre = "sp_listar_tipo_doc";
            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_tipo_documento"].ToString());
                string tipo = fila["tipo_documento"].ToString();
                TipoDocumento doc = new TipoDocumento(id, tipo);
                lstTipoDocumento.Add(doc);
            }
            return lstTipoDocumento;
        }

        //TECNICATURA
        public List<Tecnicatura> ObtenerTecnicatura()
        {
            List<Tecnicatura> lstTecnicatura = new List<Tecnicatura>();
            string sp_nombre = "sp_tecnicatura";
            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_tecnicatura"].ToString());
                string tec = fila["tecnicatura"].ToString();
                Tecnicatura tecnica = new Tecnicatura(id, tec);
                lstTecnicatura.Add(tecnica);
            }
            return lstTecnicatura;
        }

        public List<Materia> ObtenerMateria(int param)
        {
            List<Materia> lstMateria = new List<Materia>();
            string sp_nombre = "sp_carreras_materia";
            string paramNombre = "@codigo";

            DataTable tabla = Helper.ObtenerInstancia().CargarComboConParametro(sp_nombre,param, paramNombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_materia"].ToString());
                string mat = fila["materia"].ToString();
                Materia materia = new Materia(id, mat);
                lstMateria.Add(materia);
            }
            return lstMateria;
        }

        public List<Curso> ObtenerCursos()
        {
            List<Curso> lstCurso = new List<Curso>();
            string sp_nombre = "sp_curso";
            
            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_curso"].ToString());
                string cur = fila["curso"].ToString();
                Curso curs = new Curso(id, cur);
                lstCurso.Add(curs);
            }
            return lstCurso;
        }

        public List<Cuatrimestre> ObtenerCuatrimestre()
        {
            List<Cuatrimestre> lstCuatrimestre = new List<Cuatrimestre>();
            string sp_nombre = "sp_cuatrimestre";

            DataTable tabla = Helper.ObtenerInstancia().CargarCombo(sp_nombre);
            foreach (DataRow fila in tabla.Rows)
            {
                int id = Convert.ToInt32(fila["id_cuatrimestre"].ToString());
                string Cuatri = fila["cuatrimestre"].ToString();
                Cuatrimestre Cuatrimestre = new Cuatrimestre(id, Cuatri);
                lstCuatrimestre.Add(Cuatrimestre);
            }
            return lstCuatrimestre;
        }

        public bool ObtenerMaestro(MaestroEstMat maestro)
        {
            string sp_nombre = "sp_estudiantes_materias";

            return Helper.ObtenerInstancia().ConfirmarTecnicaturaMateria(sp_nombre,maestro);
        }
    }
}
