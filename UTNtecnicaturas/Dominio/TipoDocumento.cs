using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class TipoDocumento
    {
        public int IdTipo { get; set; }
        public string Tipo { get; set; }

        public TipoDocumento()
        {
            IdTipo = 0;
            Tipo ="";
        }
        public TipoDocumento(int id, string tip)
        {
            IdTipo = id;
            Tipo =tip;
        }
    }
}
