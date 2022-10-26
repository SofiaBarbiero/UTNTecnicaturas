namespace UTNtecnicaturas.Presentacion
{
    partial class frmTecnicatura
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmTecnicatura));
            this.label1 = new System.Windows.Forms.Label();
            this.cboTecnicatura = new System.Windows.Forms.ComboBox();
            this.txtLegajo = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.lblNroLegajo = new System.Windows.Forms.Label();
            this.Materia = new System.Windows.Forms.Label();
            this.cboMateria = new System.Windows.Forms.ComboBox();
            this.dgvTecnicatura = new System.Windows.Forms.DataGridView();
            this.idMateria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colMateria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCuatrimestre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCurso = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colAcciones = new System.Windows.Forms.DataGridViewButtonColumn();
            this.cboCuatrimestre = new System.Windows.Forms.ComboBox();
            this.cboCurso = new System.Windows.Forms.ComboBox();
            this.txtTotal = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.btnAgregar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTecnicatura)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Franklin Gothic Medium", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 52);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "Tecnicatura";
            // 
            // cboTecnicatura
            // 
            this.cboTecnicatura.FormattingEnabled = true;
            this.cboTecnicatura.Location = new System.Drawing.Point(98, 49);
            this.cboTecnicatura.Name = "cboTecnicatura";
            this.cboTecnicatura.Size = new System.Drawing.Size(300, 21);
            this.cboTecnicatura.TabIndex = 1;
            this.cboTecnicatura.SelectedIndexChanged += new System.EventHandler(this.cboTecnicatura_SelectedIndexChanged);
            // 
            // txtLegajo
            // 
            this.txtLegajo.Location = new System.Drawing.Point(87, 12);
            this.txtLegajo.Name = "txtLegajo";
            this.txtLegajo.Size = new System.Drawing.Size(82, 20);
            this.txtLegajo.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Franklin Gothic Medium", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(454, 332);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(92, 15);
            this.label2.TabIndex = 3;
            this.label2.Text = "Total de Materias";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Franklin Gothic Medium", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(407, 91);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(75, 15);
            this.label4.TabIndex = 5;
            this.label4.Text = "Cuatrismestre";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Franklin Gothic Medium", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(433, 58);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(34, 15);
            this.label5.TabIndex = 6;
            this.label5.Text = "Curso";
            // 
            // lblNroLegajo
            // 
            this.lblNroLegajo.AutoSize = true;
            this.lblNroLegajo.Font = new System.Drawing.Font("Franklin Gothic Medium", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNroLegajo.Location = new System.Drawing.Point(15, 15);
            this.lblNroLegajo.Name = "lblNroLegajo";
            this.lblNroLegajo.Size = new System.Drawing.Size(57, 15);
            this.lblNroLegajo.TabIndex = 7;
            this.lblNroLegajo.Text = "Nro legajo";
            // 
            // Materia
            // 
            this.Materia.AutoSize = true;
            this.Materia.Font = new System.Drawing.Font("Franklin Gothic Medium", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Materia.Location = new System.Drawing.Point(22, 88);
            this.Materia.Name = "Materia";
            this.Materia.Size = new System.Drawing.Size(45, 15);
            this.Materia.TabIndex = 8;
            this.Materia.Text = "Materia";
            // 
            // cboMateria
            // 
            this.cboMateria.FormattingEnabled = true;
            this.cboMateria.Location = new System.Drawing.Point(98, 85);
            this.cboMateria.Name = "cboMateria";
            this.cboMateria.Size = new System.Drawing.Size(300, 21);
            this.cboMateria.TabIndex = 9;
            // 
            // dgvTecnicatura
            // 
            this.dgvTecnicatura.AllowUserToAddRows = false;
            this.dgvTecnicatura.AllowUserToDeleteRows = false;
            this.dgvTecnicatura.BackgroundColor = System.Drawing.SystemColors.WindowFrame;
            this.dgvTecnicatura.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTecnicatura.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.idMateria,
            this.colMateria,
            this.colCuatrimestre,
            this.colCurso,
            this.colAcciones});
            this.dgvTecnicatura.Location = new System.Drawing.Point(32, 154);
            this.dgvTecnicatura.Name = "dgvTecnicatura";
            this.dgvTecnicatura.ReadOnly = true;
            this.dgvTecnicatura.Size = new System.Drawing.Size(599, 150);
            this.dgvTecnicatura.TabIndex = 10;
            this.dgvTecnicatura.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTecnicatura_CellContentClick);
            // 
            // idMateria
            // 
            this.idMateria.HeaderText = "idMateria";
            this.idMateria.Name = "idMateria";
            this.idMateria.ReadOnly = true;
            this.idMateria.Visible = false;
            // 
            // colMateria
            // 
            this.colMateria.HeaderText = "Materia";
            this.colMateria.Name = "colMateria";
            this.colMateria.ReadOnly = true;
            this.colMateria.Width = 250;
            // 
            // colCuatrimestre
            // 
            this.colCuatrimestre.HeaderText = "Cuatrimestre";
            this.colCuatrimestre.Name = "colCuatrimestre";
            this.colCuatrimestre.ReadOnly = true;
            // 
            // colCurso
            // 
            this.colCurso.HeaderText = "Curso";
            this.colCurso.Name = "colCurso";
            this.colCurso.ReadOnly = true;
            // 
            // colAcciones
            // 
            this.colAcciones.HeaderText = "Acciones";
            this.colAcciones.Name = "colAcciones";
            this.colAcciones.ReadOnly = true;
            this.colAcciones.Text = "Eliminar";
            this.colAcciones.UseColumnTextForButtonValue = true;
            // 
            // cboCuatrimestre
            // 
            this.cboCuatrimestre.FormattingEnabled = true;
            this.cboCuatrimestre.Location = new System.Drawing.Point(483, 88);
            this.cboCuatrimestre.Name = "cboCuatrimestre";
            this.cboCuatrimestre.Size = new System.Drawing.Size(129, 21);
            this.cboCuatrimestre.TabIndex = 12;
            // 
            // cboCurso
            // 
            this.cboCurso.FormattingEnabled = true;
            this.cboCurso.Location = new System.Drawing.Point(483, 52);
            this.cboCurso.Name = "cboCurso";
            this.cboCurso.Size = new System.Drawing.Size(129, 21);
            this.cboCurso.TabIndex = 13;
            // 
            // txtTotal
            // 
            this.txtTotal.Enabled = false;
            this.txtTotal.Location = new System.Drawing.Point(549, 325);
            this.txtTotal.Name = "txtTotal";
            this.txtTotal.ReadOnly = true;
            this.txtTotal.Size = new System.Drawing.Size(82, 20);
            this.txtTotal.TabIndex = 14;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(436, 363);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 15;
            this.button1.Text = "Aceptar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(556, 363);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 16;
            this.button2.Text = "Salir";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // btnAgregar
            // 
            this.btnAgregar.Location = new System.Drawing.Point(556, 115);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(75, 23);
            this.btnAgregar.TabIndex = 17;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // frmTecnicatura
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::UTNtecnicaturas.Properties.Resources.WhatsApp_Image_2022_10_26_at_9_01_54_AM;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(674, 398);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txtTotal);
            this.Controls.Add(this.cboCurso);
            this.Controls.Add(this.cboCuatrimestre);
            this.Controls.Add(this.dgvTecnicatura);
            this.Controls.Add(this.cboMateria);
            this.Controls.Add(this.Materia);
            this.Controls.Add(this.lblNroLegajo);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtLegajo);
            this.Controls.Add(this.cboTecnicatura);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmTecnicatura";
            this.Text = "Tecnicatura";
            this.Load += new System.EventHandler(this.frmTecnicatura_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTecnicatura)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cboTecnicatura;
        private System.Windows.Forms.TextBox txtLegajo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label lblNroLegajo;
        private System.Windows.Forms.Label Materia;
        private System.Windows.Forms.ComboBox cboMateria;
        private System.Windows.Forms.DataGridView dgvTecnicatura;
        private System.Windows.Forms.ComboBox cboCuatrimestre;
        private System.Windows.Forms.ComboBox cboCurso;
        private System.Windows.Forms.TextBox txtTotal;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.DataGridViewTextBoxColumn idMateria;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMateria;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCuatrimestre;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCurso;
        private System.Windows.Forms.DataGridViewButtonColumn colAcciones;
        private System.Windows.Forms.Button btnAgregar;
    }
}