using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Barrio
    {
        public int IdBarrio { get; set; }
        public string Nombre { get; set; }
        public Localidad Localidad { get; set; }

        public Barrio()
        {
            IdBarrio = 0;
            Nombre = "";
            Localidad = new Localidad();
        }
        public Barrio(int id, string nom, Localidad localidad)
        {
            IdBarrio=id;
            Nombre=nom;
            Localidad = localidad;
        }

    }
}
