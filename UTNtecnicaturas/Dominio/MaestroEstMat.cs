using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class MaestroEstMat
    {
        public int Legajo { get; set; }
        
        public List<DetalleEstudianteMateria> lstDetalleEstMat { get; set; }
        public MaestroEstMat(int id,  List<DetalleEstudianteMateria> lst)
        {
            Legajo = id;
            lstDetalleEstMat = lst;
        }
        public MaestroEstMat()
        {
            Legajo=0;
            lstDetalleEstMat = new List<DetalleEstudianteMateria>();

        }

        public void AgregarDetalle(DetalleEstudianteMateria detalle)
        {
            lstDetalleEstMat.Add(detalle);
        }

        public void QuitarDetalle(int indice)
        {
            lstDetalleEstMat.RemoveAt(indice);
        }
        public override string ToString()
        {
            return Legajo.ToString();
        }
    }
}
