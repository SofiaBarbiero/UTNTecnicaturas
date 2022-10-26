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

namespace UTNtecnicaturas.Presentacion.Report2
{
    public partial class frmReport2 : Form
    {
        public frmReport2()
        {
            InitializeComponent();
        }

        private void frmReport2_Load(object sender, EventArgs e)
        {
            nudDesde.Value = DateTime.Today.Year;
            nudHasta.Value = DateTime.Today.Year;
        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }

        private void Consultar_Click(object sender, EventArgs e)
        {
            if (nudDesde.Value <= nudHasta.Value)
            {
                this.reportViewer1.RefreshReport();
                List<Parametro> lst = new List<Parametro>();
                lst.Add(new Parametro("@DesdeAño", nudDesde.Value));
                lst.Add(new Parametro("@HastaAño", nudHasta.Value));
                DataTable dt = Helper.ObtenerInstancia().CargarConsulta("sp_calificaciones_promedio2020_2021_prog", lst);
                reportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WinForms.ReportDataSource("DataSet2", dt));
                this.reportViewer1.RefreshReport();
            }
            else
            {
                MessageBox.Show("El año desde tiene que ser menor o igual al año hasta!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }
    }
}
