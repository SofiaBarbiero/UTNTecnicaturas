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

namespace UTNtecnicaturas.Presentacion.Report6
{
    public partial class frmReport6 : Form
    {
        public frmReport6()
        {
            InitializeComponent();
        }

        private void frmReport6_Load(object sender, EventArgs e)
        {
            dtpDesde.Value=DateTime.Now.AddDays(-30);
            dtpHasta.Value=DateTime.Now;
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }


        private void dtpDesde_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnGenerar_Click_1(object sender, EventArgs e)
        {
            this.reportViewer1.RefreshReport();
            List<Parametro> lst = new List<Parametro>();
            lst.Add(new Parametro("@fechaDesde", dtpDesde.Value));
            lst.Add(new Parametro("@fechaHasta", dtpHasta.Value));
            DataTable dt = Helper.ObtenerInstancia().CargarConsulta("sp_GobCba_Est_Pandemia", lst);
            reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet6", dt));
            this.reportViewer1.RefreshReport();
        }

        private void btnSalir_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
