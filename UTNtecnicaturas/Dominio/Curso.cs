using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Curso
    {
        public int IdCurso { get; set; }
        public string NombreCurso { get; set; }
        public Curso()
        {
            IdCurso =0;
            NombreCurso ="";
        }

        public Curso(int id, string nombre)
        {
            IdCurso=id;
            NombreCurso = nombre;
        }
    }
}
