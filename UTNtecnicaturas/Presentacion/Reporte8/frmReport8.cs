using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UTNtecnicaturas.Datos;

namespace UTNtecnicaturas.Presentacion.Reporte8
{
    public partial class frmReport8 : Form
    {
        public frmReport8()
        {
            InitializeComponent();
        }

        private void frmReport8_Load(object sender, EventArgs e)
        {

            this.reportViewer1.RefreshReport();
            nudCantidad.Value=0;
            nudMaterias.Value=0;

        }

        private void btnGenerar_Click(object sender, EventArgs e)
        {
            List<Parametro> lst = new List<Parametro>();
            lst.Add(new Parametro("@materia", nudMaterias.Value));
            lst.Add(new Parametro("@anios", nudCantidad.Value));
            DataTable dt = Helper.ObtenerInstancia().CargarConsulta("sp_docentes_examenes", lst);
            reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet8", dt));
            this.reportViewer1.RefreshReport();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
