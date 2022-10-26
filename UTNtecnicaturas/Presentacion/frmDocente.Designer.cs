namespace UTNtecnicaturas.Presentacion
{
    partial class frmDocente
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDocente));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.archivoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.salirToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.examenesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cargarNotasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.altaExamenToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.datosEstudiantesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackgroundImage = global::UTNtecnicaturas.Properties.Resources.WhatsApp_Image_2022_10_25_at_9_41_40_PM__3_;
            this.menuStrip1.Font = new System.Drawing.Font("Montserrat", 8.999999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.archivoToolStripMenuItem,
            this.consultasToolStripMenuItem,
            this.examenesToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(800, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // archivoToolStripMenuItem
            // 
            this.archivoToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.salirToolStripMenuItem});
            this.archivoToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.archivoToolStripMenuItem.Name = "archivoToolStripMenuItem";
            this.archivoToolStripMenuItem.Size = new System.Drawing.Size(73, 20);
            this.archivoToolStripMenuItem.Text = "Archivo";
            // 
            // salirToolStripMenuItem
            // 
            this.salirToolStripMenuItem.Name = "salirToolStripMenuItem";
            this.salirToolStripMenuItem.Size = new System.Drawing.Size(105, 22);
            this.salirToolStripMenuItem.Text = "Salir";
            this.salirToolStripMenuItem.Click += new System.EventHandler(this.salirToolStripMenuItem_Click);
            // 
            // consultasToolStripMenuItem
            // 
            this.consultasToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.datosEstudiantesToolStripMenuItem});
            this.consultasToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.consultasToolStripMenuItem.Name = "consultasToolStripMenuItem";
            this.consultasToolStripMenuItem.Size = new System.Drawing.Size(88, 20);
            this.consultasToolStripMenuItem.Text = "Consultas";
            // 
            // examenesToolStripMenuItem
            // 
            this.examenesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cargarNotasToolStripMenuItem,
            this.altaExamenToolStripMenuItem});
            this.examenesToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.examenesToolStripMenuItem.Name = "examenesToolStripMenuItem";
            this.examenesToolStripMenuItem.Size = new System.Drawing.Size(89, 20);
            this.examenesToolStripMenuItem.Text = "Examenes";
            // 
            // cargarNotasToolStripMenuItem
            // 
            this.cargarNotasToolStripMenuItem.Name = "cargarNotasToolStripMenuItem";
            this.cargarNotasToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.cargarNotasToolStripMenuItem.Text = "Cargar Notas";
            // 
            // altaExamenToolStripMenuItem
            // 
            this.altaExamenToolStripMenuItem.Name = "altaExamenToolStripMenuItem";
            this.altaExamenToolStripMenuItem.Size = new System.Drawing.Size(166, 22);
            this.altaExamenToolStripMenuItem.Text = " Alta Examen";
            // 
            // datosEstudiantesToolStripMenuItem
            // 
            this.datosEstudiantesToolStripMenuItem.Name = "datosEstudiantesToolStripMenuItem";
            this.datosEstudiantesToolStripMenuItem.Size = new System.Drawing.Size(200, 22);
            this.datosEstudiantesToolStripMenuItem.Text = "Datos Estudiantes";
            this.datosEstudiantesToolStripMenuItem.Click += new System.EventHandler(this.datosEstudiantesToolStripMenuItem_Click);
            // 
            // frmDocente
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::UTNtecnicaturas.Properties.Resources.WhatsApp_Image_2022_10_25_at_9_41_40_PM;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(800, 519);
            this.Controls.Add(this.menuStrip1);
            this.Font = new System.Drawing.Font("Franklin Gothic Medium", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "frmDocente";
            this.Text = "Docente";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem archivoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem salirToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem examenesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cargarNotasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem altaExamenToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem datosEstudiantesToolStripMenuItem;
    }
}