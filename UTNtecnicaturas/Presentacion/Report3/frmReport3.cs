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

namespace UTNtecnicaturas.Presentacion.Report3
{
    public partial class frmReport3 : Form
    {
        public frmReport3()
        {
            InitializeComponent();
        }

        private void frmReport3_Load(object sender, EventArgs e)
        {
        
            this.reportViewer1.RefreshReport();
            
            DataTable dt = Helper.ObtenerInstancia().CargarCombo("sp_busqueda_programadores");
            reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet3", dt));
            this.reportViewer1.RefreshReport();

        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
