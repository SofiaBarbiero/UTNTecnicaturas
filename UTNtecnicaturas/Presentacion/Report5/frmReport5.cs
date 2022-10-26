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

namespace UTNtecnicaturas.Presentacion.Report5
{
    public partial class frmReport5 : Form
    {
        public frmReport5()
        {
            InitializeComponent();
        }

        private void fremReport5_Load(object sender, EventArgs e)
        {

           
            this.reportViewer1.RefreshReport();
            DataTable dt = Helper.ObtenerInstancia().CargarCombo("sp_Torneo_Industria");
            reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet5", dt));
            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
