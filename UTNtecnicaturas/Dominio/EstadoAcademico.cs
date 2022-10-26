using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class EstadoAcademico
    {
        public int IdEstadoAcademico { get; set; }
        public string EstAcademico { get; set;}
        public EstadoAcademico()
        {
            IdEstadoAcademico =0;
            EstAcademico ="";
        }
    }
}
