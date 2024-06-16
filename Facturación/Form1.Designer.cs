namespace Facturación
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            addProduct = new Button();
            cbProducts = new ComboBox();
            panelInformacion = new DataGridView();
            tbCantidad = new TextBox();
            label2 = new Label();
            label3 = new Label();
            label4 = new Label();
            labelSuma = new Label();
            lableIva = new Label();
            totalTxt = new Label();
            label1 = new Label();
            label5 = new Label();
            FACTURACION = new Label();
            label6 = new Label();
            tbCedula = new TextBox();
            facN = new Label();
            lbCliente = new Label();
            lblFacturaNumero = new Label();
            labelClienteMostrar = new Label();
            btnBuscarCliente = new Button();
            label7 = new Label();
            cbTipoPago = new ComboBox();
            button1 = new Button();
            ((System.ComponentModel.ISupportInitialize)panelInformacion).BeginInit();
            SuspendLayout();
            // 
            // addProduct
            // 
            addProduct.Location = new Point(780, 206);
            addProduct.Name = "addProduct";
            addProduct.Size = new Size(146, 41);
            addProduct.TabIndex = 0;
            addProduct.Text = "Agregar producto";
            addProduct.UseVisualStyleBackColor = true;
            addProduct.Click += addProduct_Click;
            // 
            // cbProducts
            // 
            cbProducts.FormattingEnabled = true;
            cbProducts.Location = new Point(244, 212);
            cbProducts.Name = "cbProducts";
            cbProducts.Size = new Size(404, 28);
            cbProducts.TabIndex = 1;
            // 
            // panelInformacion
            // 
            panelInformacion.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            panelInformacion.Location = new Point(38, 259);
            panelInformacion.Name = "panelInformacion";
            panelInformacion.RowHeadersWidth = 51;
            panelInformacion.Size = new Size(888, 341);
            panelInformacion.TabIndex = 2;
            // 
            // tbCantidad
            // 
            tbCantidad.Location = new Point(672, 213);
            tbCantidad.Name = "tbCantidad";
            tbCantidad.Size = new Size(85, 27);
            tbCantidad.TabIndex = 3;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(761, 616);
            label2.Name = "label2";
            label2.Size = new Size(49, 20);
            label2.TabIndex = 5;
            label2.Text = "Suma:";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(761, 640);
            label3.Name = "label3";
            label3.Size = new Size(66, 20);
            label3.TabIndex = 6;
            label3.Text = "IVA 12%:";
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(764, 666);
            label4.Name = "label4";
            label4.Size = new Size(53, 20);
            label4.TabIndex = 7;
            label4.Text = "TOTAL:";
            // 
            // labelSuma
            // 
            labelSuma.AutoSize = true;
            labelSuma.Location = new Point(836, 616);
            labelSuma.Name = "labelSuma";
            labelSuma.Size = new Size(0, 20);
            labelSuma.TabIndex = 8;
            // 
            // lableIva
            // 
            lableIva.AutoSize = true;
            lableIva.Location = new Point(844, 641);
            lableIva.Name = "lableIva";
            lableIva.Size = new Size(0, 20);
            lableIva.TabIndex = 9;
            // 
            // totalTxt
            // 
            totalTxt.AutoSize = true;
            totalTxt.Location = new Point(831, 668);
            totalTxt.Name = "totalTxt";
            totalTxt.Size = new Size(0, 20);
            totalTxt.TabIndex = 10;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(839, 676);
            label1.Name = "label1";
            label1.Size = new Size(0, 20);
            label1.TabIndex = 11;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(40, 216);
            label5.Name = "label5";
            label5.Size = new Size(162, 20);
            label5.TabIndex = 12;
            label5.Text = "Selecciona tu producto";
            // 
            // FACTURACION
            // 
            FACTURACION.AutoSize = true;
            FACTURACION.Font = new Font("Segoe UI Semibold", 13.8F, FontStyle.Bold, GraphicsUnit.Point, 0);
            FACTURACION.Location = new Point(41, 9);
            FACTURACION.Name = "FACTURACION";
            FACTURACION.Size = new Size(168, 31);
            FACTURACION.TabIndex = 13;
            FACTURACION.Text = "FACTURACIÓN";
            // 
            // label6
            // 
            label6.AutoSize = true;
            label6.Location = new Point(39, 51);
            label6.Name = "label6";
            label6.Size = new Size(194, 20);
            label6.TabIndex = 14;
            label6.Text = "Ingresa la cedula del cliente";
            // 
            // tbCedula
            // 
            tbCedula.Location = new Point(245, 44);
            tbCedula.Name = "tbCedula";
            tbCedula.Size = new Size(404, 27);
            tbCedula.TabIndex = 15;
            // 
            // facN
            // 
            facN.AutoSize = true;
            facN.Location = new Point(41, 88);
            facN.Name = "facN";
            facN.Size = new Size(83, 20);
            facN.TabIndex = 0;
            facN.Text = "Factura No:";
            // 
            // lbCliente
            // 
            lbCliente.AutoSize = true;
            lbCliente.Location = new Point(42, 123);
            lbCliente.Name = "lbCliente";
            lbCliente.Size = new Size(58, 20);
            lbCliente.TabIndex = 16;
            lbCliente.Text = "Cliente:";
            // 
            // lblFacturaNumero
            // 
            lblFacturaNumero.AutoSize = true;
            lblFacturaNumero.Location = new Point(157, 89);
            lblFacturaNumero.Name = "lblFacturaNumero";
            lblFacturaNumero.Size = new Size(0, 20);
            lblFacturaNumero.TabIndex = 17;
            // 
            // labelClienteMostrar
            // 
            labelClienteMostrar.AutoSize = true;
            labelClienteMostrar.Location = new Point(134, 125);
            labelClienteMostrar.Name = "labelClienteMostrar";
            labelClienteMostrar.Size = new Size(0, 20);
            labelClienteMostrar.TabIndex = 18;
            // 
            // btnBuscarCliente
            // 
            btnBuscarCliente.Location = new Point(694, 42);
            btnBuscarCliente.Name = "btnBuscarCliente";
            btnBuscarCliente.Size = new Size(94, 29);
            btnBuscarCliente.TabIndex = 19;
            btnBuscarCliente.Text = "Buscar";
            btnBuscarCliente.UseVisualStyleBackColor = true;
            btnBuscarCliente.Click += btnBuscarCliente_Click;
            // 
            // label7
            // 
            label7.AutoSize = true;
            label7.Location = new Point(45, 156);
            label7.Name = "label7";
            label7.Size = new Size(125, 20);
            label7.TabIndex = 20;
            label7.Text = "Metodo de pago:";
            // 
            // cbTipoPago
            // 
            cbTipoPago.FormattingEnabled = true;
            cbTipoPago.Location = new Point(258, 156);
            cbTipoPago.Name = "cbTipoPago";
            cbTipoPago.Size = new Size(391, 28);
            cbTipoPago.TabIndex = 21;
            // 
            // button1
            // 
            button1.Location = new Point(764, 705);
            button1.Name = "button1";
            button1.Size = new Size(94, 29);
            button1.TabIndex = 22;
            button1.Text = "COMPRAR";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(979, 746);
            Controls.Add(button1);
            Controls.Add(cbTipoPago);
            Controls.Add(label7);
            Controls.Add(btnBuscarCliente);
            Controls.Add(labelClienteMostrar);
            Controls.Add(lblFacturaNumero);
            Controls.Add(lbCliente);
            Controls.Add(facN);
            Controls.Add(tbCedula);
            Controls.Add(label6);
            Controls.Add(FACTURACION);
            Controls.Add(label5);
            Controls.Add(label1);
            Controls.Add(totalTxt);
            Controls.Add(lableIva);
            Controls.Add(labelSuma);
            Controls.Add(label4);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(tbCantidad);
            Controls.Add(panelInformacion);
            Controls.Add(cbProducts);
            Controls.Add(addProduct);
            Name = "Form1";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)panelInformacion).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button addProduct;
        private ComboBox cbProducts;
        private DataGridView panelInformacion;
        private TextBox tbCantidad;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label labelSuma;
        private Label lableIva;
        private Label totalTxt;
        private Label label1;
        private Label label5;
        private Label FACTURACION;
        private Label label6;
        private TextBox tbCedula;
        private Label facN;
        private Label lbCliente;
        private Label lblFacturaNumero;
        private Label labelClienteMostrar;
        private Button btnBuscarCliente;
        private Label label7;
        private ComboBox cbTipoPago;
        private Button button1;
    }
}
