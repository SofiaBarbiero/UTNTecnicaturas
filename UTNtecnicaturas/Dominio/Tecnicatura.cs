using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Tecnicatura
    {
        public int IdTecnicatura { get; set; }
        public string NombreTecnicatura { get; set; }
        public string Titulo { get; set; }

        public Tecnicatura(int id, string nombre)
        {
            IdTecnicatura = id;
            NombreTecnicatura=nombre;
           

        }

        public Tecnicatura()
        {
            IdTecnicatura=0;
            NombreTecnicatura="";
           
        }
        public override string ToString()
        {
            return NombreTecnicatura;
        }
    }
}
