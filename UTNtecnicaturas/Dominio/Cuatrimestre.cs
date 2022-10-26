using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Cuatrimestre
    {
        public int IdCuatrimestre { get; set; }
        public string NombreCuatrimestre { set; get; }
        public Cuatrimestre()
        {
            IdCuatrimestre =0;
            NombreCuatrimestre="";
        }

        public Cuatrimestre(int id, string nombre)
        {
            IdCuatrimestre = id;
            NombreCuatrimestre = nombre;
        }
    }
}
