using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Nacionalidad
    {
        public int IdNac { get; set; }
        public string Nac { get; set; }

        public Nacionalidad()
        {
            IdNac = 0;
            Nac ="";
        }
        public Nacionalidad(int id, string tip)
        {
            IdNac = id;
            Nac =tip;
        }
    }
}
