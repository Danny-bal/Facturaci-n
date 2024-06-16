using AccessData;
using AccessData.EF;
using AccessData.Response;
using Repository;

namespace Facturación
{
    public partial class Form1 : Form
    {
        private readonly IRepository<producto> productoRepository;
        private readonly IRepository<cliente> clienteRepository;
        private readonly IRepository<factura> facturaRepository;

        public List<decimal> sumaProductos = new();
        public decimal suma = 0;
        public decimal sumaiva;
        public decimal sumaice;
        public Form1(IRepository<producto> productoRepository, IRepository<cliente> clienteRepository, IRepository<factura> facturaRepository)
        {
            InitializeComponent();
            this.productoRepository = productoRepository ?? throw new ArgumentNullException(nameof(productoRepository));
            this.clienteRepository = clienteRepository ?? throw new ArgumentNullException(nameof(clienteRepository));
            this.facturaRepository = facturaRepository ?? throw new ArgumentNullException(nameof(facturaRepository));
            InitializeDataGridView();
            LoadProductosAsync();
            CargarComboBoxTipoPago();
        }

        private void InitializeDataGridView()
        {
            panelInformacion.ColumnCount = 6;
            panelInformacion.Columns[0].Name = "Id";
            panelInformacion.Columns[1].Name = "Nombre";
            panelInformacion.Columns[2].Name = "Unidad";
            panelInformacion.Columns[3].Name = "Cantidad";
            panelInformacion.Columns[4].Name = "Valor";
            panelInformacion.Columns[5].Name = "Subtotal";
        }

        private async void LoadProductosAsync()
        {
            var response = await GetProductos();
            if (response.Data != null)
            {
                cbProducts.DisplayMember = "prodescripcion"; // La propiedad que se mostrará
                cbProducts.ValueMember = "procodigo";
                cbProducts.DataSource = response.Data;
            }
            else
            {
                MessageBox.Show($"Error al cargar productos: {response.Message}");
            }
        }

        public async Task<Response<List<producto>>> GetProductos()
        {
            var data = await productoRepository.GetAllAsync();
            return data;
        }

        private async void addProduct_Click(object sender, EventArgs e)
        {
            var cedula = tbCedula.Text;

            var selectedProduct = cbProducts.SelectedItem as producto;
            var cantidad = tbCantidad.Text;
            var vfpxc = Convert.ToInt32(cantidad) * selectedProduct.proprecioum;

            
            // Obtener el ID del producto seleccionado
            var selectedProductId = cbProducts.SelectedValue;
            panelInformacion.Rows.Add(selectedProductId, selectedProduct.prodescripcion, selectedProduct.prounidadmedida, cantidad, selectedProduct.proprecioum, vfpxc);

            sumaProductos.Add(vfpxc);

            foreach (var i in sumaProductos)
            {
                suma += i;
            }

            labelSuma.Text = suma.ToString();

             sumaiva = suma * 0.12m;
            lableIva.Text = sumaiva.ToString();

             sumaice = suma * 0.5m;

            totalTxt.Text = (suma + sumaiva).ToString();
            var facturaId = await getFacturaId();
            var dataCliente = await clienteRepository.GetClientByCED(cedula);
            
        }

        private async void btnBuscarCliente_Click(object sender, EventArgs e)
        {
            var facturaId = await getFacturaId();
            var cedula = tbCedula.Text;
            var dataCliente = await clienteRepository.GetClientByCED(cedula);

            lblFacturaNumero.Text = facturaId;
            labelClienteMostrar.Text = dataCliente.Data.clinombre;
        }

        public async Task<string> getFacturaId()
        {
            return await facturaRepository.GenerateNewFacturaId();
        }

        public void CargarComboBoxTipoPago()
        {
            var tiposDePago = new List<TipoPago>
            {
                new TipoPago { nombre = "Efectivo", valor = "EFEC" },
                new TipoPago { nombre = "Tarjeta de Crédito", valor = "TARCR" },
                new TipoPago { nombre = "Transferencia", valor = "TRANS" },
                new TipoPago {nombre = "Tarjeta de Debito" , valor = "TARDB"},
                new TipoPago {nombre = "Cheque" , valor = "CHEQ"}
            };
            cbTipoPago.DisplayMember = "nombre";
            cbTipoPago.ValueMember = "valor";
            cbTipoPago.DataSource = tiposDePago;
        }

        private async void button1_Click(object sender, EventArgs e)
        {         
            var cedula = tbCedula.Text;
            var dataCliente = await clienteRepository.GetClientByCED(cedula);
            factura request = new factura
            {
                facnumero = lblFacturaNumero.Text,
                clicodigo = dataCliente.Data.clicodigo,
                facfecha = DateOnly.FromDateTime(DateTime.Now),
                facsubtotal = suma,
                facdescuento = 0,
                faciva = sumaiva,
                facice = sumaice,
                facformapago = cbTipoPago.SelectedValue.ToString(),
                facstatus = "CAN"
            };

            var insertFactura = await facturaRepository.InsertAsync(request);
        }
    }
}