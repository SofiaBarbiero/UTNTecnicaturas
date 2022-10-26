using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using UTNtecnicaturas.Dominio;

namespace UTNtecnicaturas.Datos
{
    internal class Helper
    {
        private SqlConnection cnn;

        private static Helper instancia;
        public Helper()
        {
            cnn= new SqlConnection(Properties.Resources.cnnUTN);
        }

        public static Helper ObtenerInstancia()
        {
            if(instancia == null)
                instancia= new Helper();
            return instancia;
        }

        public DataTable CargarCombo(string sp_nombre)
        {
            DataTable tabla = new DataTable();
            SqlCommand cmdCombo = new SqlCommand();
            cnn.Open();
            cmdCombo.Connection = cnn;
            cmdCombo.CommandText = sp_nombre;
            cmdCombo.CommandType= CommandType.StoredProcedure;
            tabla.Load(cmdCombo.ExecuteReader());
            cnn.Close();
            return tabla;
        }

        public DataTable CargarComboConParametro(string sp_nombre,int param,string paramNombre)
        {
            SqlParameter parametro = new SqlParameter();            
            DataTable tabla = new DataTable();
            SqlCommand cmdCombo = new SqlCommand();
            cnn.Open();

            cmdCombo.Connection = cnn;
            cmdCombo.CommandText = sp_nombre;
            cmdCombo.CommandType= CommandType.StoredProcedure;

            parametro.DbType = DbType.Int32;
            parametro.ParameterName =  paramNombre;
            parametro.Direction = ParameterDirection.Input;
            parametro.Value = param;
            cmdCombo.Parameters.Add(parametro);

            tabla.Load(cmdCombo.ExecuteReader());
            cnn.Close();
            return tabla;
         
        }

        public int ConfirmarEstudiante(string sp_nombre,Estudiante oEstudiante)
        {
            int NroLegajo = 0;
            SqlTransaction t = null;
            try
            {
                SqlCommand cmdEstudiante = new SqlCommand();
                cnn.Open();
                t = cnn.BeginTransaction();
                cmdEstudiante.Connection = cnn;
                cmdEstudiante.Transaction = t;
                cmdEstudiante.CommandText = sp_nombre;
                cmdEstudiante.CommandType = CommandType.StoredProcedure;

                cmdEstudiante.Parameters.AddWithValue("@ape_est",oEstudiante.Apellido);
                cmdEstudiante.Parameters.AddWithValue("@nom_est", oEstudiante.Nombre);
                cmdEstudiante.Parameters.AddWithValue("@id_tipo_documento", oEstudiante.TipoDocumento.IdTipo);
                cmdEstudiante.Parameters.AddWithValue("@nro_doc", oEstudiante.NroCalle);
                cmdEstudiante.Parameters.AddWithValue("@fecha_nac", oEstudiante.FechaNac);
                cmdEstudiante.Parameters.AddWithValue("@email", oEstudiante.Email);
                cmdEstudiante.Parameters.AddWithValue("@telefono", oEstudiante.Telefono);
                cmdEstudiante.Parameters.AddWithValue("@id_nacionalidad", oEstudiante.Nacionalidad.IdNac);
                cmdEstudiante.Parameters.AddWithValue("@id_barrio", oEstudiante.Barrio.IdBarrio);
                cmdEstudiante.Parameters.AddWithValue("@calle", oEstudiante.Calle);
                cmdEstudiante.Parameters.AddWithValue("@nro_calle", oEstudiante.NroCalle);
                cmdEstudiante.Parameters.AddWithValue("@fecha_ingreso", oEstudiante.FechaIngreso);
                cmdEstudiante.Parameters.AddWithValue("@id_situacion_habit", oEstudiante.SituacionHab.IdSituacionHab);
                cmdEstudiante.Parameters.AddWithValue("@id_estado_civil", oEstudiante.EstadoCivil.IdEstadoCivil);
                cmdEstudiante.Parameters.AddWithValue("@id_estado_lab", oEstudiante.EstadoLab.IdEstadoLab);


                SqlParameter OutPut = new SqlParameter();
                OutPut.ParameterName="@legajo";
                OutPut.DbType=DbType.Int32;
                OutPut.Direction=ParameterDirection.Output;

                cmdEstudiante.Parameters.Add(OutPut);
                cmdEstudiante.ExecuteNonQuery();
                NroLegajo = (int)OutPut.Value;

                t.Commit();
            }
            catch(Exception )
            {
                if (t!=null)
                    t.Rollback();
                return NroLegajo;
            }
            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }
            return NroLegajo;
        }

        public bool ConfirmarTecnicaturaMateria(string sp_nombre, MaestroEstMat maestro)
        {
            bool ok = true;
            SqlTransaction t = null;
            try
            {                
                cnn.Open();
                SqlCommand cmdMaestro = new SqlCommand();
                t = cnn.BeginTransaction();
                cmdMaestro.Connection = cnn;
                cmdMaestro.Transaction = t;
                cmdMaestro.CommandText = sp_nombre;
                cmdMaestro.CommandType = CommandType.StoredProcedure;

                foreach (DetalleEstudianteMateria detalle in maestro.lstDetalleEstMat)
                {
                    cmdMaestro.Parameters.AddWithValue("@legajo_est", maestro.Legajo);
                    cmdMaestro.Parameters.AddWithValue("@id_curso", detalle.Curso.IdCurso);
                    cmdMaestro.Parameters.AddWithValue("@id_cuatrimestre", detalle.Cuatrimestre.IdCuatrimestre);
                    cmdMaestro.Parameters.AddWithValue("@id_materia", detalle.Materia.IdMateria);

                    cmdMaestro.ExecuteNonQuery();
                    cmdMaestro.Parameters.Clear();                 
                }              

                t.Commit();
            }
            catch (Exception ex)
            {
                if (t!=null)
                    t.Rollback();
                return ok = false;
            }
            finally
            {
                if (cnn != null && cnn.State == ConnectionState.Open)
                    cnn.Close();
            }
            return ok;
        }

        public DataTable CargarConsulta(string sp_nombre,List<Parametro> values)
        {
            DataTable tabla = new DataTable();
            SqlCommand cmdConsulta = new SqlCommand();
            cnn.Open();
            cmdConsulta.Connection = cnn;
            cmdConsulta.CommandText = sp_nombre;
            cmdConsulta.CommandType= CommandType.StoredProcedure;

            if (values != null)
            {
                foreach (Parametro param in values)
                {
                    cmdConsulta.Parameters.AddWithValue(param.Clave,param.Valor);
                }
             }

            tabla.Load(cmdConsulta.ExecuteReader());
            cnn.Close();
            return tabla;
        }


    }
}
