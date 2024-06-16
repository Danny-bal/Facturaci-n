using AccessData.EF;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Repository;
using System;
using System.Configuration;
using System.Windows.Forms;

namespace Facturación
{
    public static class Program
    {
        [STAThread]
        static void Main()
        {
            var services = ConfigureServices();
            var serviceProvider = services.BuildServiceProvider();

            Application.SetHighDpiMode(HighDpiMode.SystemAware);
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(serviceProvider.GetRequiredService<Form1>());
        }

        private static IServiceCollection ConfigureServices()
        {
            var services = new ServiceCollection();

            // Leer la cadena de conexión desde App.config
            var connectionString = ConfigurationManager.ConnectionStrings["database"].ConnectionString;

            // Registrar el contexto de la base de datos
            services.AddDbContext<ComercialContext>(options =>
                options.UseNpgsql(connectionString));

            // Registrar el repositorio genérico
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
      

            // Registrar el formulario principal
            services.AddTransient<Form1>();

            return services;
        }
    }
}
