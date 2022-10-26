namespace UTNtecnicaturas.Presentacion.Reporte
{
    partial class Report
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
            this.components = new System.ComponentModel.Container();
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.dataSet21 = new UTNtecnicaturas.Presentacion.Report2.DataSet2();
            this.dataSet1 = new UTNtecnicaturas.Presentacion.Reporte.DataSet1();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.btnSALIR = new System.Windows.Forms.Button();
            this.Consultar = new System.Windows.Forms.Button();
            this.Desde = new System.Windows.Forms.Label();
            this.txtLegajoEst = new System.Windows.Forms.TextBox();
            this.sp_estudiante_datosBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.dataSet21)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sp_estudiante_datosBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "UTNtecnicaturas.Presentacion.Reporte.Report1.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(45, 226);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(712, 196);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // dataSet21
            // 
            this.dataSet21.DataSetName = "DataSet2";
            this.dataSet21.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // dataSet1
            // 
            this.dataSet1.DataSetName = "DataSet1";
            this.dataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // richTextBox1
            // 
            this.richTextBox1.BackColor = System.Drawing.Color.White;
            this.richTextBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.richTextBox1.Font = new System.Drawing.Font("Montserrat", 8.2F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBox1.ForeColor = System.Drawing.SystemColors.MenuText;
            this.richTextBox1.Location = new System.Drawing.Point(180, 103);
            this.richTextBox1.Margin = new System.Windows.Forms.Padding(50);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.richTextBox1.Size = new System.Drawing.Size(423, 18);
            this.richTextBox1.TabIndex = 12;
            this.richTextBox1.Text = "Para recuperar todos los datos personales del estudiante ingrese el legajo";
            // 
            // btnSALIR
            // 
            this.btnSALIR.BackColor = System.Drawing.Color.RoyalBlue;
            this.btnSALIR.FlatAppearance.BorderSize = 0;
            this.btnSALIR.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSALIR.Font = new System.Drawing.Font("Montserrat", 9.749999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSALIR.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnSALIR.Location = new System.Drawing.Point(467, 174);
            this.btnSALIR.Name = "btnSALIR";
            this.btnSALIR.Size = new System.Drawing.Size(103, 30);
            this.btnSALIR.TabIndex = 11;
            this.btnSALIR.Text = "Salir";
            this.btnSALIR.UseVisualStyleBackColor = false;
            this.btnSALIR.Click += new System.EventHandler(this.btnSALIR_Click);
            // 
            // Consultar
            // 
            this.Consultar.BackColor = System.Drawing.Color.RoyalBlue;
            this.Consultar.FlatAppearance.BorderSize = 0;
            this.Consultar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Consultar.Font = new System.Drawing.Font("Montserrat", 9.749999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Consultar.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.Consultar.Location = new System.Drawing.Point(467, 138);
            this.Consultar.Name = "Consultar";
            this.Consultar.Size = new System.Drawing.Size(103, 30);
            this.Consultar.TabIndex = 10;
            this.Consultar.Text = "Consultar";
            this.Consultar.UseVisualStyleBackColor = false;
            this.Consultar.Click += new System.EventHandler(this.Consultar_Click);
            // 
            // Desde
            // 
            this.Desde.AutoSize = true;
            this.Desde.BackColor = System.Drawing.Color.Transparent;
            this.Desde.Font = new System.Drawing.Font("Montserrat", 9.749999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Desde.ForeColor = System.Drawing.SystemColors.ControlText;
            this.Desde.Location = new System.Drawing.Point(187, 161);
            this.Desde.Name = "Desde";
            this.Desde.Size = new System.Drawing.Size(148, 16);
            this.Desde.TabIndex = 9;
            this.Desde.Text = "Legajo Estudiante:";
            // 
            // txtLegajoEst
            // 
            this.txtLegajoEst.Location = new System.Drawing.Point(341, 159);
            this.txtLegajoEst.Name = "txtLegajoEst";
            this.txtLegajoEst.Size = new System.Drawing.Size(100, 20);
            this.txtLegajoEst.TabIndex = 13;
            // 
            // sp_estudiante_datosBindingSource
            // 
            this.sp_estudiante_datosBindingSource.DataMember = "sp_estudiante_datos";
            this.sp_estudiante_datosBindingSource.DataSource = this.dataSet1;
            // 
            // Report
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::UTNtecnicaturas.Properties.Resources.WhatsApp_Image_2022_10_26_at_9_01_54_AM;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.txtLegajoEst);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.btnSALIR);
            this.Controls.Add(this.Consultar);
            this.Controls.Add(this.Desde);
            this.Controls.Add(this.reportViewer1);
            this.Name = "Report";
            this.Text = "Report";
            this.Load += new System.EventHandler(this.Report_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataSet21)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sp_estudiante_datosBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private DataSet1 dataSet1;
        private Report2.DataSet2 dataSet21;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Button btnSALIR;
        private System.Windows.Forms.Button Consultar;
        private System.Windows.Forms.Label Desde;
        private System.Windows.Forms.TextBox txtLegajoEst;
        private System.Windows.Forms.BindingSource sp_estudiante_datosBindingSource;
    }
}