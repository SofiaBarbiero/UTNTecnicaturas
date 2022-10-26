using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class DetalleEstudianteMateria
    {
        public Curso Curso { get; set; }
        public Cuatrimestre Cuatrimestre { get; set; }
        public Materia Materia { get; set; }
     
        public DetalleEstudianteMateria(Curso cur,Cuatrimestre cuatri,Materia mat)
        {
            Curso = cur;
            Cuatrimestre = cuatri;
            Materia = mat;      

        }
        public DetalleEstudianteMateria()
        {
            Curso = new Curso();
            Cuatrimestre = new Cuatrimestre();
            Materia = new Materia();
            
        }

        



    }
}
