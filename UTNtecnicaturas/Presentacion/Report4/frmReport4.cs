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

namespace UTNtecnicaturas.Presentacion.Report4
{
    public partial class frmReport4 : Form
    {
        public frmReport4()
        {
            InitializeComponent();
        }

        private void frmReport4_Load(object sender, EventArgs e)
        {

            this.reportViewer1.RefreshReport();            
            DataTable dt = Helper.ObtenerInstancia().CargarCombo("sp_Estudiantes_Extranjeros_Activos");
            reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet4", dt));
            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
