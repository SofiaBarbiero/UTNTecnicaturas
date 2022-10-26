using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Localidad
    {
        public int IdLocalidad { get; set; }
        public string Nombre { get; set; }
        public Provincia Provincia { get; set; }

        public Localidad()
        {
            IdLocalidad = 0;
            Nombre = "";
            Provincia = new Provincia();
        }
        public Localidad(int id, string nom,Provincia provincia)
        {
            IdLocalidad=id;
            Nombre=nom;
            Provincia = provincia;
        }
    }
}
