using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class EstadoCivil
    {
        public int IdEstadoCivil { get; set; }
        public string EstadoCiv { get; set; }

        public EstadoCivil()
        {
            IdEstadoCivil = 0;
            EstadoCiv ="";
        }
        public EstadoCivil(int id, string tip)
        {
            IdEstadoCivil = id;
            EstadoCiv =tip;
        }
        public override string ToString()
        {
            return EstadoCiv;
        }
    }
}
