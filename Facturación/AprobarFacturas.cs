using AccessData.EF;
using Repository;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Facturación
{
    public partial class AprobarFacturas : Form
    {
        private readonly IRepository<factura> facturaRepository;
        private readonly IRepository<cliente> clienteRepository;
        private readonly IRepository<producto> productoRepository;

        public AprobarFacturas(IRepository<factura> facturaRepository, IRepository<cliente> clienteRepository)
        {
            this.clienteRepository = clienteRepository;
            this.facturaRepository = facturaRepository;
            InitializeComponent();

            // Configurar las columnas del DataGridView
            dataGridView1.ColumnCount = 9;
            dataGridView1.Columns[0].Name = "Numero de factura";
            dataGridView1.Columns[1].Name = "Nombre del cliente";
            dataGridView1.Columns[2].Name = "Fecha";
            dataGridView1.Columns[3].Name = "Subtotal";
            dataGridView1.Columns[4].Name = "Descuento";
            dataGridView1.Columns[5].Name = "IVA";
            dataGridView1.Columns[6].Name = "ICE";
            dataGridView1.Columns[7].Name = "Forma de pago";
            dataGridView1.Columns[8].Name = "Estado";

            // Añadir columna de botones
            DataGridViewButtonColumn btnCancelarColumna = new DataGridViewButtonColumn();
            btnCancelarColumna.Name = "Cancelar";
            btnCancelarColumna.Text = "Cancelar";
            btnCancelarColumna.UseColumnTextForButtonValue = true;
            dataGridView1.Columns.Add(btnCancelarColumna);

            dataGridView1.CellClick += dataGridView1_CellClick;

            if (string.IsNullOrEmpty(txtCedulaNoFactura.Text))
            {
                cargarTablaFacturas();
            }
        }

        public async void cargarTablaFacturas()
        {
            var facturasObteniudas = await facturaRepository.GetAllAsync();

            if (facturasObteniudas.Data != null)
            {
                foreach (var factura in facturasObteniudas.Data)
                {
                    if (factura.facstatus != "CAN")
                        dataGridView1.Rows.Add(
                            factura.facnumero,
                            factura.clicodigo, // Asegúrate de que esta propiedad exista en tu entidad factura
                            factura.facfecha,
                            factura.facsubtotal,
                            factura.facdescuento,
                            factura.faciva,
                            factura.facice,
                            factura.facformapago,
                            factura.facstatus
                        );
                }
            }
            else
            {
                MessageBox.Show($"Error al cargar facturas: {facturasObteniudas.Message}");
            }
        }

        private async void Buscar_Click(object sender, EventArgs e)
        {
            var cedofac = txtCedulaNoFactura.Text;
            if (string.IsNullOrEmpty(cedofac))
            {
                // Si el TextBox está vacío, carga todas las facturas
                cargarTablaFacturas();
            }
            else if (cedofac.Length <= 13 && cedofac.Length >= 10)
            {
                var clienteExiste = await clienteRepository.GetClientByCED(cedofac);
                if (clienteExiste.Data != null)
                {
                    var cedulaCli = clienteExiste.Data.cliidentificacion;
                    var facxcli = await facturaRepository.GetFacturasByCliCed(cedulaCli);
                    if (facxcli.Data != null)
                    {
                        dataGridView1.Rows.Clear(); // Limpiar las filas existentes
                        foreach (var factura in facxcli.Data)
                        {
                            if (factura.facstatus != "CAN")
                                dataGridView1.Rows.Add(
                                    factura.facnumero,
                                    factura.clicodigo, // Asegúrate de que esta propiedad exista en tu entidad factura
                                    factura.facfecha,
                                    factura.facsubtotal,
                                    factura.facdescuento,
                                    factura.faciva,
                                    factura.facice,
                                    factura.facformapago,
                                    factura.facstatus
                                );
                        }
                    }
                    else
                    {
                        MessageBox.Show("No se encontraron facturas para este cliente.");
                    }
                }
                else
                {
                    MessageBox.Show("Cliente inexistente.");
                }
            }
            else
            {
                var facturas = await facturaRepository.GetByIdAsync(cedofac.ToUpper());
                if (facturas.Data != null)
                {
                    dataGridView1.Rows.Clear(); // Limpiar las filas existentes
                    dataGridView1.Rows.Add(
                        facturas.Data.facnumero,
                        facturas.Data.clicodigo, // Asegúrate de que esta propiedad exista en tu entidad factura
                        facturas.Data.facfecha,
                        facturas.Data.facsubtotal,
                        facturas.Data.facdescuento,
                        facturas.Data.faciva,
                        facturas.Data.facice,
                        facturas.Data.facformapago,
                        facturas.Data.facstatus
                    );
                }
                else
                {
                    MessageBox.Show("No se encontraron facturas con este número.");
                }
            }
        }

        private async void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == dataGridView1.Columns["Cancelar"].Index && e.RowIndex >= 0)
            {
                // Obtener la fila seleccionada
                DataGridViewRow filaSeleccionada = dataGridView1.Rows[e.RowIndex];

                // Obtener el número de factura de la fila seleccionada
                string numeroFactura = filaSeleccionada.Cells["Numero de factura"].Value.ToString();

                // Confirmar la cancelación
                var confirmResult = MessageBox.Show("¿Estás seguro de que deseas cancelar esta factura?",
                                                     "Confirmar Cancelación",
                                                     MessageBoxButtons.YesNo);
                if (confirmResult == DialogResult.Yes)
                {
                    // Lógica para cancelar la factura
                    var resultado = await CancelarFactura(numeroFactura);
                    if (resultado)
                    {
                        MessageBox.Show("Factura cancelada exitosamente.");
                    }
                    else
                    {
                        MessageBox.Show("Error al cancelar la factura.");
                    }
                }
            }
        }

        private async Task<bool> CancelarFactura(string numeroFactura)
        {
            // Implementar la lógica para cancelar la factura en el repositorio
            var factura = await facturaRepository.GetByIdAsync(numeroFactura);
            if (factura != null && factura.Data != null)
            {
                factura.Data.facstatus = "CAN";
                var resultado = await facturaRepository.UpdateAsync(factura.Data);
                return resultado.Success;
            }
            return false;
        }
    }
}
