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

namespace UTNtecnicaturas.Presentacion.Reporte2
{
    public partial class Report2 : Form
    {
        public Report2()
        {
            InitializeComponent();
        }

        private void Report2_Load(object sender, EventArgs e)
        {                       
            this.reportViewer1.RefreshReport();
            Helper oHelper = new Helper();
            DataTable dt = oHelper.CargarConsulta("sp_calificaciones_promedio2020_2021_prog");
            reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet2", dt));
            this.reportViewer1.RefreshReport();
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
