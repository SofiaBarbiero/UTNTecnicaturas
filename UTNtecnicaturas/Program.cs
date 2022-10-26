using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using UTNtecnicaturas.Presentacion;
using UTNtecnicaturas.Presentacion.Report2;
using UTNtecnicaturas.Presentacion.Report3;
using UTNtecnicaturas.Presentacion.Report4;
using UTNtecnicaturas.Presentacion.Report5;
using UTNtecnicaturas.Presentacion.Report6;
using UTNtecnicaturas.Presentacion.Report7;
using UTNtecnicaturas.Presentacion.Reporte;
using UTNtecnicaturas.Presentacion.Reporte8;

namespace UTNtecnicaturas
{
    internal static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new FrmAdministrativo());
            //Application.Run(new frmLogin());
            Application.Run(new frmReport8());
        }
    }
}
