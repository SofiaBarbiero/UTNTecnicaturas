using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UTNtecnicaturas.Presentacion
{
    public partial class frmMenuEstudiantes : Form
    {
        public frmMenuEstudiantes()
        {
            InitializeComponent();
        }

        private void alumnoToolStripMenuItem_Click(object sender, EventArgs e)
        {
           
        }

        private void consultasToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void salirToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Esta seguro que quiere salir???", "CUIDADO", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2)==DialogResult.Yes)
                this.Close();
        }

        private void materiasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmTecnicatura frmTec = new frmTecnicatura();
            frmTec.ShowDialog();
        }
    }
}
