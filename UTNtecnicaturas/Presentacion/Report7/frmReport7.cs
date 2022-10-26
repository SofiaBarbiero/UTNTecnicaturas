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

namespace UTNtecnicaturas.Presentacion.Report7
{
    public partial class frmReport7 : Form
    {
        public frmReport7()
        {
            InitializeComponent();
        }

        private void frmReport7_Load(object sender, EventArgs e)
        {
            txtLegajoDoc.Text = "";
            
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void Consultar_Click(object sender, EventArgs e)
        {
            List<Parametro> lst = new List<Parametro>();
            lst.Add(new Parametro("@legajo_doc", Convert.ToInt32(txtLegajoDoc.Text)));
            DataTable dt = Helper.ObtenerInstancia().CargarConsulta("sp_Docentes_cursosCargo", lst);
            reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet7", dt));
            this.reportViewer1.RefreshReport();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
