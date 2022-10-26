namespace UTNtecnicaturas.Presentacion.Report2
{
    partial class frmReport2
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmReport2));
            this.reportViewer1 = new Microsoft.Reporting.WinForms.ReportViewer();
            this.nudDesde = new System.Windows.Forms.NumericUpDown();
            this.Desde = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.nudHasta = new System.Windows.Forms.NumericUpDown();
            this.Consultar = new System.Windows.Forms.Button();
            this.btnSALIR = new System.Windows.Forms.Button();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.nudDesde)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudHasta)).BeginInit();
            this.SuspendLayout();
            // 
            // reportViewer1
            // 
            this.reportViewer1.LocalReport.ReportEmbeddedResource = "UTNtecnicaturas.Presentacion.Report2.Report2.rdlc";
            this.reportViewer1.Location = new System.Drawing.Point(83, 250);
            this.reportViewer1.Name = "reportViewer1";
            this.reportViewer1.ServerReport.BearerToken = null;
            this.reportViewer1.Size = new System.Drawing.Size(624, 139);
            this.reportViewer1.TabIndex = 0;
            this.reportViewer1.Load += new System.EventHandler(this.reportViewer1_Load);
            // 
            // nudDesde
            // 
            this.nudDesde.Location = new System.Drawing.Point(266, 166);
            this.nudDesde.Maximum = new decimal(new int[] {
            2022,
            0,
            0,
            0});
            this.nudDesde.Name = "nudDesde";
            this.nudDesde.Size = new System.Drawing.Size(107, 20);
            this.nudDesde.TabIndex = 2;
            this.nudDesde.Value = new decimal(new int[] {
            2020,
            0,
            0,
            0});
            // 
            // Desde
            // 
            this.Desde.AutoSize = true;
            this.Desde.BackColor = System.Drawing.Color.Transparent;
            this.Desde.Font = new System.Drawing.Font("Montserrat", 9.749999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Desde.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.Desde.Location = new System.Drawing.Point(263, 147);
            this.Desde.Name = "Desde";
            this.Desde.Size = new System.Drawing.Size(110, 16);
            this.Desde.TabIndex = 3;
            this.Desde.Text = "Desde el año:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Montserrat", 9.749999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label2.Location = new System.Drawing.Point(410, 147);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(106, 16);
            this.label2.TabIndex = 4;
            this.label2.Text = "Hasta el año:";
            // 
            // nudHasta
            // 
            this.nudHasta.Location = new System.Drawing.Point(413, 166);
            this.nudHasta.Maximum = new decimal(new int[] {
            2022,
            0,
            0,
            0});
            this.nudHasta.Name = "nudHasta";
            this.nudHasta.Size = new System.Drawing.Size(103, 20);
            this.nudHasta.TabIndex = 5;
            this.nudHasta.Value = new decimal(new int[] {
            2022,
            0,
            0,
            0});
            // 
            // Consultar
            // 
            this.Consultar.BackColor = System.Drawing.Color.RoyalBlue;
            this.Consultar.FlatAppearance.BorderSize = 0;
            this.Consultar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.Consultar.Font = new System.Drawing.Font("Montserrat", 8.249999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Consultar.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.Consultar.Location = new System.Drawing.Point(295, 209);
            this.Consultar.Name = "Consultar";
            this.Consultar.Size = new System.Drawing.Size(111, 35);
            this.Consultar.TabIndex = 6;
            this.Consultar.Text = "Consultar";
            this.Consultar.UseVisualStyleBackColor = false;
            this.Consultar.Click += new System.EventHandler(this.Consultar_Click);
            // 
            // btnSALIR
            // 
            this.btnSALIR.BackColor = System.Drawing.Color.RoyalBlue;
            this.btnSALIR.FlatAppearance.BorderSize = 0;
            this.btnSALIR.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSALIR.Font = new System.Drawing.Font("Montserrat", 9.749999F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSALIR.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnSALIR.Location = new System.Drawing.Point(422, 209);
            this.btnSALIR.Name = "btnSALIR";
            this.btnSALIR.Size = new System.Drawing.Size(111, 35);
            this.btnSALIR.TabIndex = 7;
            this.btnSALIR.Text = "Salir";
            this.btnSALIR.UseVisualStyleBackColor = false;
            // 
            // richTextBox1
            // 
            this.richTextBox1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(15)))), ((int)(((byte)(111)))), ((int)(((byte)(197)))));
            this.richTextBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.richTextBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.richTextBox1.ForeColor = System.Drawing.SystemColors.Window;
            this.richTextBox1.Location = new System.Drawing.Point(84, 88);
            this.richTextBox1.Margin = new System.Windows.Forms.Padding(50);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.richTextBox1.Size = new System.Drawing.Size(624, 51);
            this.richTextBox1.TabIndex = 8;
            this.richTextBox1.Text = resources.GetString("richTextBox1.Text");
            // 
            // frmReport2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::UTNtecnicaturas.Properties.Resources.WhatsApp_Image_2022_10_25_at_9_41_40_PM__2_;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.btnSALIR);
            this.Controls.Add(this.Consultar);
            this.Controls.Add(this.nudHasta);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Desde);
            this.Controls.Add(this.nudDesde);
            this.Controls.Add(this.reportViewer1);
            this.Name = "frmReport2";
            this.Text = "Reporte N°2";
            this.Load += new System.EventHandler(this.frmReport2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.nudDesde)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudHasta)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private Microsoft.Reporting.WinForms.ReportViewer reportViewer1;
        private System.Windows.Forms.NumericUpDown nudDesde;
        private System.Windows.Forms.Label Desde;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown nudHasta;
        private System.Windows.Forms.Button Consultar;
        private System.Windows.Forms.Button btnSALIR;
        private System.Windows.Forms.RichTextBox richTextBox1;
    }
}