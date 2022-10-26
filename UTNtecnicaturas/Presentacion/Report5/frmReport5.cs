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
                     
           
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }

        private void Consultar_Click(object sender, EventArgs e)
        {
            List<Parametro> lst = new List<Parametro>();
            lst.Add(new Parametro("@promedio", Convert.ToInt32(txtPromedio.Text)));
            DataTable dt = Helper.ObtenerInstancia().CargarConsulta("sp_Torneo_Industria", lst);
            reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet5", dt));
            this.reportViewer1.RefreshReport();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
