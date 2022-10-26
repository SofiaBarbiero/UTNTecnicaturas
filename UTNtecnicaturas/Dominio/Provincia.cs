using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Provincia
    {
        public int IdProvincia { get; set; }
        public string Nombre { get; set; }

        public Provincia()
        {
            IdProvincia = 0;
            Nombre = "";
        }
        public Provincia(int id,string nom)
        {
            IdProvincia=id;
            Nombre=nom;
        }

    }
}
