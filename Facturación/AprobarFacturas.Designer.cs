namespace Facturación
{
    partial class AprobarFacturas
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
            label1 = new Label();
            txtCedulaNoFactura = new TextBox();
            Buscar = new Button();
            label2 = new Label();
            dataGridView1 = new DataGridView();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI Semibold", 19.8000011F, FontStyle.Bold, GraphicsUnit.Point, 0);
            label1.Location = new Point(26, 20);
            label1.Name = "label1";
            label1.Size = new Size(379, 46);
            label1.TabIndex = 0;
            label1.Text = "Aprovación de Facturas";
            // 
            // txtCedulaNoFactura
            // 
            txtCedulaNoFactura.Location = new Point(365, 73);
            txtCedulaNoFactura.Name = "txtCedulaNoFactura";
            txtCedulaNoFactura.Size = new Size(284, 27);
            txtCedulaNoFactura.TabIndex = 1;
            // 
            // Buscar
            // 
            Buscar.Location = new Point(669, 71);
            Buscar.Name = "Buscar";
            Buscar.Size = new Size(94, 29);
            Buscar.TabIndex = 2;
            Buscar.Text = "Buscar";
            Buscar.UseVisualStyleBackColor = true;
            Buscar.Click += Buscar_Click;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(26, 76);
            label2.Name = "label2";
            label2.Size = new Size(333, 20);
            label2.TabIndex = 3;
            label2.Text = "Ingresa el numero de factura o cedula del cliente";
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(30, 129);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 51;
            dataGridView1.Size = new Size(733, 291);
            dataGridView1.TabIndex = 4;
            // 
            // AprobarFacturas
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(dataGridView1);
            Controls.Add(label2);
            Controls.Add(Buscar);
            Controls.Add(txtCedulaNoFactura);
            Controls.Add(label1);
            Name = "AprobarFacturas";
            Text = "AprobarFacturas";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private TextBox txtCedulaNoFactura;
        private Button Buscar;
        private Label label2;
        private DataGridView dataGridView1;
    }
}