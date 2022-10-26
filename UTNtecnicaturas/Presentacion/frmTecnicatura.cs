using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UTNtecnicaturas.Datos.Implementacion;
using UTNtecnicaturas.Datos.Intefaz;
using UTNtecnicaturas.Dominio;

namespace UTNtecnicaturas.Presentacion
{
    
    public partial class frmTecnicatura : Form
    {
        private IDaoUTN gestor;
        private MaestroEstMat maestro;
        public frmTecnicatura()
        {
            InitializeComponent();
            gestor = new DaoUTN();
            maestro = new MaestroEstMat();
            
        }

        private void frmTecnicatura_Load(object sender, EventArgs e)
        {
            CargaTecnicaturas();
            CargarCuatrimestre();
            cargarCursos();
            Limpiar();
            
        }

        private void Limpiar()
        {
            txtLegajo.Text ="";
            cboCuatrimestre.SelectedIndex=-1;
            cboCurso.SelectedIndex=-1;
            cboMateria.SelectedIndex=-1;
            cboTecnicatura.SelectedIndex=-1;
            dgvTecnicatura.Rows.Clear();
            txtTotal.Text="";
        }

        private void cargarCursos()
        {
            cboCurso.ValueMember = "IdCurso";
            cboCurso.DisplayMember = "NombreCurso";
            cboCurso.DataSource = gestor.ObtenerCursos();
            cboCurso.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void CargarCuatrimestre()
        {
            cboCuatrimestre.ValueMember = "IdCuatrimestre";
            cboCuatrimestre.DisplayMember = "NombreCuatrimestre";
            cboCuatrimestre.DataSource = gestor.ObtenerCuatrimestre();
            cboCuatrimestre.DropDownStyle = ComboBoxStyle.DropDownList;

        }

        private void CargaMaterias()
        {
            int param = Convert.ToInt32(cboTecnicatura.SelectedValue);
            cboMateria.ValueMember = "IdMateria";
            cboMateria.DisplayMember = "NombreMateria";
            cboMateria.DataSource = gestor.ObtenerMateria(param);
            cboMateria.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void CargaTecnicaturas()
        {
            cboTecnicatura.ValueMember = "IdTecnicatura";
            cboTecnicatura.DisplayMember = "NombreTecnicatura";
            cboTecnicatura.DataSource = gestor.ObtenerTecnicatura();
            cboTecnicatura.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void cboTecnicatura_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboTecnicatura.SelectedIndex != -1)
            {
                CargaMaterias();
            }

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {
                Materia mat = (Materia)cboMateria.SelectedItem;
                Cuatrimestre cuatri = (Cuatrimestre)cboCuatrimestre.SelectedItem;
                Curso curso = (Curso)cboCurso.SelectedItem;

                DetalleEstudianteMateria detalle = new DetalleEstudianteMateria(curso, cuatri, mat);

                maestro.AgregarDetalle(detalle);

                dgvTecnicatura.Rows.Add(new object[]
                {
                detalle.Materia.IdMateria,
                detalle.Materia.NombreMateria,
                detalle.Curso.NombreCurso,
                detalle.Cuatrimestre.NombreCuatrimestre
                });
            }
            CalcularMaterias();
        }
        private void CalcularMaterias()
        {
            int aux = dgvTecnicatura.Rows.Count;
            if(aux >= 0)
            {
                txtTotal.Text = aux.ToString();
            }
        }
        private bool ValidarCampos()
        {
            bool ok = true;
            if (txtLegajo.Text == "")
            {
                MessageBox.Show("Tiene que seleccionar un legajo!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                return ok = false;
            }

            if (cboTecnicatura.SelectedIndex == -1)
            {
                MessageBox.Show("Tiene que seleccionar una tecnicatura!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                return ok = false ;
            }
            if (cboMateria.SelectedIndex == -1)
            {
                MessageBox.Show("Tiene que seleccionar una materia!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                return ok = false;
            }
            if (cboCuatrimestre.SelectedIndex == -1)
            {
                MessageBox.Show("Tiene que seleccionar un cuatrimestre!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                return ok = false;
            }
            if (cboMateria.SelectedIndex == -1)
            {
                MessageBox.Show("Tiene que seleccionar una materia!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                return ok = false;
            }
            foreach (DataGridViewRow fila in dgvTecnicatura.Rows)
            {
                if (fila.Cells["colMateria"].Value.ToString().Equals(cboMateria.Text))
                {
                    MessageBox.Show("La materia: " + cboMateria.Text + " ya fue ingresada", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                    return ok =false;                    
                }
            }
            return ok ;
        }

        private void dgvTecnicatura_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if(dgvTecnicatura.CurrentCell.ColumnIndex ==4)
            {
                maestro.QuitarDetalle(dgvTecnicatura.CurrentRow.Index);
                dgvTecnicatura.Rows.Remove(dgvTecnicatura.CurrentRow);
                CalcularMaterias();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            maestro.Legajo =Convert.ToInt32(txtLegajo.Text);

            if(dgvTecnicatura.Rows.Count > 0)
            {
                if (gestor.ObtenerMaestro(maestro)) 
                {
                    MessageBox.Show("Se agrego con exito!!!", "EXITO", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                else
                {
                    MessageBox.Show("NO se pudo agregar!!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                Limpiar();
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Esta seguro que quiere salir???", "CUIDADO", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2)==DialogResult.Yes) 
            this.Close();
        }
    }
}
