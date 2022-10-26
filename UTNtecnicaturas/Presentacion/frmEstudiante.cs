using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UTNtecnicaturas.Dominio;
using UTNtecnicaturas.Servicios;

namespace UTNtecnicaturas.Presentacion
{
    public partial class frmEstudiante : Form
    {
        private IServicio gestor;
        private Estudiante nuevoEst;
        public frmEstudiante()
        {
            InitializeComponent();
            gestor = new Servicio();
            nuevoEst = new Estudiante();
            
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void txtTelefono_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtEmail_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtCalle_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtNumero_TextChanged(object sender, EventArgs e)
        {

        }

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void dtpFechaIngreso_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label12_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void cboBarrio_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void Estudiante_Load(object sender, EventArgs e)
        {
            ObtenerBarrios();
            ObtenerEstadoCivil();
            ObtenerEstadoLaboral();
            ObtenerNacionalidad();
            ObtenerSituacionHabit();
            ObtenerTipoDocumento();

        }

        private void ObtenerTipoDocumento()
        {
            cboTipoDoc.ValueMember = "IdTipo";
            cboTipoDoc.DisplayMember = "Tipo";
            cboTipoDoc.DataSource = gestor.ObtenerTipoDoc();
            cboTipoDoc.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void ObtenerSituacionHabit()
        {
            cboSitHabit.ValueMember = "IdSituacionHab";
            cboSitHabit.DisplayMember = "SituacionHab";
            cboSitHabit.DataSource = gestor.ObtenerSituacionHabit();
            cboSitHabit.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void ObtenerNacionalidad()
        {
            cboNacionalidad.ValueMember = "IdNac";
            cboNacionalidad.DisplayMember = "Nac";
            cboNacionalidad.DataSource = gestor.ObtenerNacionalidad();
            cboNacionalidad.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void ObtenerEstadoLaboral()
        {
            cboEstadoLab.ValueMember = "IdEstadoLab";
            cboEstadoLab.DisplayMember = "EstadoLab";
            cboEstadoLab.DataSource = gestor.ObtenerEstadoLaboral();
            cboEstadoLab.DropDownStyle = ComboBoxStyle.DropDownList;

        }

        private void ObtenerEstadoCivil()
        {
            cboEstadoCivil.ValueMember = "IdEstadoCivil";
            cboEstadoCivil.DisplayMember = "EstadoCiv";
            cboEstadoCivil.DataSource = gestor.ObtenerEstadoCivil();
            cboEstadoCivil.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void ObtenerBarrios()
        {
            cboBarrio.ValueMember = "IdBarrio";
            cboBarrio.DisplayMember = "Nombre";
            cboBarrio.DataSource = gestor.ObtenerBarrio();
            cboBarrio.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private bool ValidarCampos()
        {
            bool ok = true;
            if(txtApellido.Text == "")
            {
                MessageBox.Show("Tienes que agregar un apellido", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return ok = false;
                txtApellido.Focus();
            }
            if (txtNombre.Text == "")
            {
                MessageBox.Show("Tienes que agregar un nombre", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return ok = false;
                txtNombre.Focus();
            }
            if (dtpFechaNacimiento.Value == DateTime.Now)
            {
                MessageBox.Show("Tienes que agregar una fecha de nacimiento", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return ok = false;
                dtpFechaNacimiento.Focus();
            }
            if (txtDniNumero.Text == "")
            {
                MessageBox.Show("Tienes que agregar un numero de documento", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return ok = false;
                txtDniNumero.Focus();
            }
            return ok;
        }

        private void btnAceptar_Click_1(object sender, EventArgs e)
        {
            nuevoEst.Apellido = txtApellido.Text;
            nuevoEst.Nombre = txtNombre.Text;
            nuevoEst.FechaNac = dtpFechaNacimiento.Value;
            TipoDocumento TipoDocumento = (TipoDocumento)cboTipoDoc.SelectedItem;
            nuevoEst.TipoDocumento = TipoDocumento;
            nuevoEst.Documento = Convert.ToInt32(txtDniNumero.Text);
            Nacionalidad nacionalidad = (Nacionalidad)cboNacionalidad.SelectedItem;
            nuevoEst.Nacionalidad = nacionalidad;
            nuevoEst.Calle = txtCalle.Text;
            nuevoEst.NroCalle = Convert.ToInt32(txtNumeroCalle.Text);
            Barrio barrio = (Barrio)cboBarrio.SelectedItem;
            nuevoEst.Barrio = barrio;
            nuevoEst.Telefono = txtTelefono.Text;
            nuevoEst.Email = txtEmail.Text;
            EstadoCivil estado = (EstadoCivil)cboEstadoCivil.SelectedItem;
            nuevoEst.EstadoCivil = estado;
            EstadoLaboral estadoLab = (EstadoLaboral)cboEstadoLab.SelectedItem;
            nuevoEst.EstadoLab = estadoLab;
            SituacionHabitacional sit = (SituacionHabitacional)cboSitHabit.SelectedItem;
            nuevoEst.SituacionHab = sit;
            nuevoEst.FechaIngreso = dtpFechaIngreso.Value;


            if (ValidarCampos())
            {
                int nroLegajo = gestor.ObtenerLegajoEstudiante(nuevoEst);

                if (nroLegajo != 0)
                {
                    MessageBox.Show("Te inscribiste con exito!!! Tu nuevo numero de legajo es: " + nroLegajo, "CONFIRMACION", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                else
                {
                    MessageBox.Show("No puede inscribir!!! Intente mas tarde...", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
        }

        private void btnSalir_Click_1(object sender, EventArgs e)
        {
            if (MessageBox.Show("Esta seguro que quiere salir???", "CUIDADO", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.Yes)
                this.Close();
        }
    }
}
