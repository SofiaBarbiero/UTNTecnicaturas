using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Materia
    {
        public int IdMateria { get; set; }
        public string NombreMateria { get; set; }
        public Curso Curso { get; set; }
        public Cuatrimestre Cuatrimestre { get; set; }
        public EstadoAcademico EstadoAcademico { get; set; }

        public Materia(int id, string nombre)
        {
            IdMateria = id;
            NombreMateria=nombre;
        }
        public Materia(int id,string nombre,Curso cur,Cuatrimestre cuatri)
        {
            IdMateria = id;
            NombreMateria=nombre;
            Curso = cur;
            Cuatrimestre = cuatri;
            
        }

        public Materia()
        {
            IdMateria=0;
            NombreMateria="";
            Curso=new Curso();
            Cuatrimestre = new Cuatrimestre();
           
        }
        public override string ToString()
        {
            return NombreMateria;
        }
    }
}
