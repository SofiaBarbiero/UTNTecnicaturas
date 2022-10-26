using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Estudiante : Persona
    {
        public int LegajoEstudiante { get; set; }
        public DateTime FechaIngreso { get; set; }
        public SituacionHabitacional SituacionHab { get; set; }
        public EstadoLaboral EstadoLab { get; set; }
        public bool Condicion { get; set; }

        public Estudiante():base()
        {
            LegajoEstudiante =0;
            FechaIngreso = DateTime.Now;
            SituacionHab = new SituacionHabitacional();
            Condicion = false;
            EstadoLab = new EstadoLaboral();
        }

        public Estudiante(int legajo,DateTime fechaIngreso,SituacionHabitacional habit,
                            EstadoLaboral estadoLab,bool cond, string ape, string nom,
                            TipoDocumento tipo, int doc, DateTime fecha,
                            string email, string tel, Nacionalidad nac, 
                            Barrio barrio, string calle, int nro, EstadoCivil estado)
            : base(ape,nom,tipo,doc,fecha,email,tel,nac,barrio,calle,nro,estado)
        {
            LegajoEstudiante =legajo;
            FechaIngreso = fechaIngreso;
            SituacionHab = habit;
            Condicion = cond;
            EstadoLab = estadoLab;
        }
        public override string ToString()
        {
            return LegajoEstudiante.ToString();
        }















    }
    
}
