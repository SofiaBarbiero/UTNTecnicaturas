using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UTNtecnicaturas.Presentacion.Report2;
using UTNtecnicaturas.Presentacion.Report3;
using UTNtecnicaturas.Presentacion.Report4;
using UTNtecnicaturas.Presentacion.Report5;
using UTNtecnicaturas.Presentacion.Report6;
using UTNtecnicaturas.Presentacion.Report7;
using UTNtecnicaturas.Presentacion.Reporte8;


namespace UTNtecnicaturas.Presentacion
{
    public partial class FrmAdministrativo : Form
    {
        public FrmAdministrativo()
        {
            InitializeComponent();
        }

        private void archivoToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Esta seguro que quiere salir???", "CUIDADO", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                this.Close();
        }

        private void estudiantesExtranjerosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmReport2 frmreporte2 = new frmReport2();
            frmreporte2.ShowDialog();
            this.Show();
            
        }

        private void estudiantesExtranjerosToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmReport4 frmreporte4 = new frmReport4();
            frmreporte4.ShowDialog();
            this.Show();
        }

        private void FrmAdministrativo_Load(object sender, EventArgs e)
        {

        }

        private void programadoresToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmReport3 frmReport3 = new frmReport3();
            frmReport3.ShowDialog();
            this.Show();
        }

        private void estudiantesPromocionadosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmReport5 frmReport5 = new frmReport5();
            frmReport5.ShowDialog();
            this.Show();
        }

        private void cantidadDeEstudiantesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmReport6 frmReport6 = new frmReport6();
            frmReport6.ShowDialog();
            this.Show();
        }

        private void registroPorTecnicaturasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmReport7 frmReport7 = new frmReport7();
            frmReport7.ShowDialog();
            this.Show();
        }

        private void listadoDocentesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmReport8 frmReport8 = new frmReport8();
            frmReport8.ShowDialog();
            this.Show();
        }
    }
}
