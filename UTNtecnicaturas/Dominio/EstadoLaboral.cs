using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class EstadoLaboral
    {
        public int IdEstadoLab { get; set; }
        public string EstadoLab { get; set; }

        public EstadoLaboral()
        {
            IdEstadoLab = 0;
            EstadoLab ="";
        }
        public EstadoLaboral(int id, string tip)
        {
            IdEstadoLab = id;
            EstadoLab =tip;
        }
    }
}
