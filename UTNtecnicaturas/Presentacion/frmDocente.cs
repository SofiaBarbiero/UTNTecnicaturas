using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UTNtecnicaturas.Presentacion.Reporte;

namespace UTNtecnicaturas.Presentacion
{
    public partial class frmDocente : Form
    {
        public frmDocente()
        {
            InitializeComponent();
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Esta seguro que quiere salir???", "CUIDADO", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2)==DialogResult.Yes)
                this.Close();
        }

        private void programacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
             Report consulta1 = new Report();
            consulta1.ShowDialog();
            this.Show();
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {

        }
    }
}
