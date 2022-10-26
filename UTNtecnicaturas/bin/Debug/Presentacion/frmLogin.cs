using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UTNtecnicaturas.Presentacion;

namespace UTNtecnicaturas
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();          
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtLegajo.Text == "")
            {
                MessageBox.Show("Ingrese su numero de legajo", "ERROR", MessageBoxButtons.YesNo, MessageBoxIcon.Error, MessageBoxDefaultButton.Button2);
                txtLegajo.Focus();
                Limpiar();
                return;
            }                     
            if (cboTipoUsuario.Text.Equals ("Estudiante"))
            {
                frmMenuEstudiantes frmMenuEstudiante = new frmMenuEstudiantes();
                frmMenuEstudiante.ShowDialog();
                this.Show();
                Limpiar();
            }
            if(cboTipoUsuario.Text.Equals("Docente"))
            {
                frmDocente frmDoc = new frmDocente();
                frmDoc.ShowDialog();
                this.Show();
                Limpiar();
            }
            if (cboTipoUsuario.Text.Equals("Administración"))
            {
                FrmAdministrativo frmAdm = new FrmAdministrativo();
                frmAdm.ShowDialog();
                this.Show();
                Limpiar();
            }
        }
        private void Limpiar()
        {
            txtLegajo.Text= string.Empty;
            txtLegajo.Text = string.Empty;
            txtLegajo.Focus();
        }
        private void button1_Click_1(object sender, EventArgs e)
        {
            frmEstudiante frmEstudiante = new frmEstudiante();
            frmEstudiante.ShowDialog();
            this.Show();
            Limpiar();           
            
        }

        private void txtUsuario_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtUsuario_KeyPress(object sender, KeyPressEventArgs e)
        {
            if(char.IsLetter(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Esta seguro que quiere salir???", "CUIDADO", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2)==DialogResult.Yes)
                this.Close();
        }

        private void cboTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
