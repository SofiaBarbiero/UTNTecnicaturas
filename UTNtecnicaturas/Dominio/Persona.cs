using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class Persona
    {
        public string Apellido { get; set; }
        public string Nombre { get; set; }  
        public TipoDocumento TipoDocumento { get; set; }
        public int Documento { get; set; }
        public DateTime FechaNac { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public Nacionalidad Nacionalidad { get; set; }
        public Barrio Barrio { get; set; }
        public string Calle { get; set; }
        public int NroCalle { get; set; }
        public EstadoCivil EstadoCivil { get; set; }

        public Persona()
        {
            Apellido ="";
            Nombre="";
            TipoDocumento = new TipoDocumento();
            Documento=0;
            FechaNac = DateTime.Today;
            Email="";
            Telefono="";
            Nacionalidad=new Nacionalidad();
            Barrio=new Barrio();
            Calle="";
            NroCalle=0;
            EstadoCivil=new EstadoCivil();
        }

        public Persona(string ape,string nom,TipoDocumento tipo,int doc,DateTime fecha,string email,string tel,Nacionalidad nac, Barrio barrio,string calle, int nro, EstadoCivil estado)
        {
            Apellido =ape;
            Nombre=nom;
            TipoDocumento = tipo;
            Documento=doc;
            FechaNac = fecha;
            Email=email;
            Telefono=tel;
            Nacionalidad=nac;
            Barrio=barrio;
            Calle=calle;
            NroCalle=nro;
            EstadoCivil=estado;
        }
        public override string ToString()
        {
            return Apellido + ", " + Nombre ;
        }
    }
}
