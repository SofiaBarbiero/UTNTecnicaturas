using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Docente : Persona
    {
        public int LegajoDoc { get; set; }


        public Docente():base()
        {
            LegajoDoc = 0;
        }
        public Docente(int legajo, string ape, string nom,
                            TipoDocumento tipo, int doc, DateTime fecha,
                            string email, string tel, Nacionalidad nac,
                            Barrio barrio, string calle, int nro, EstadoCivil estado)
            : base(ape, nom, tipo, doc, fecha, email, tel, nac, barrio, calle, nro, estado)
        {
            LegajoDoc =legajo;
          
        }
        public override string ToString()
        {
            return LegajoDoc.ToString();
        }
    }
}
