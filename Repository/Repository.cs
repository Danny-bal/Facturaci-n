using AccessData.EF;
using AccessData.Response;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace Repository
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        private readonly ComercialContext dbContext;
        private readonly DbSet<TEntity> dbSet;

        public Repository(ComercialContext dbContext)
        {
            this.dbContext = dbContext;
            this.dbSet = dbContext.Set<TEntity>();
        }
        public async Task<Response<List<TEntity>>> GetAllAsync()
        {
            try
            {
                return new()
                {
                    Success = true,
                    Message = "Ok",
                    Data = await dbSet.ToListAsync()
                };
            }
            catch (Exception ex)
            {
                return new()
                {
                    Success = false,
                    Message = ex.Message,
                    Data = null
                };
            }
        }

        public async Task<Response<bool>> InsertAsync(TEntity data)
        {
            try
            {

                await dbSet.AddAsync(data);
                await dbContext.SaveChangesAsync();
               
                return new()
                {
                    Success = true,
                    Message = "Ok",
                    Data = true
                };

            }
            catch (Exception ex)
            {
                return new()
                {
                    Success = false,
                    Message = ex.Message,
                    Data = false
                };
            }
        }

        public async Task<Response<bool>> InsertManyAsync(List<TEntity> data)
        {
            try
            {
                await dbSet.AddRangeAsync(data);
                await dbContext.SaveChangesAsync();

                return new()
                {
                    Success = true,
                    Message = "OK",
                    Data = true
                };
            }
            catch (Exception ex)
            {
                return new()
                {
                    Success = false,
                    Message = ex.Message,
                    Data = false
                };
            }
        }

        public async Task<Response<bool>> DeleteAsync(string id)
        {
            var response = new Response<bool>();

            try
            {
                var entity = await GetByIdAsync(id);
                dbSet.Remove(entity.Data);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                response.Data = false;
                response.Message = $"Error en eliminacion : {ex.Message}";
            }

            return response;
        }



        public async Task<Response<bool>> UpdateAsync(TEntity data)
        {
            try
            {
                await Task.Run(() =>
                {
                    // Adjunta la entidad al contexto
                    dbSet.Attach(data);
                    // Cambia el estado de la entidad a modificado
                    dbContext.Entry(data).State = EntityState.Modified;
                });

                await dbContext.SaveChangesAsync();
                
                return new()
                {
                    Success = true,
                    Message = "OK",
                    Data = true
                };
            }
            catch (Exception ex)
            {
                return new()
                {
                    Success = false,
                    Message = ex.Message,
                    Data = false
                };
            }
        }

        public async Task<Response<TEntity>> GetByIdAsync(string id)
        {
            return new()
            {
                Data = await dbSet.FindAsync(id),
                Success = true,
                Message = "OK",
            };
        }

        public async Task<Response<cliente>> GetClientByCED(string cedula)
        {
            var cliente = await dbContext.clientes
                .Where(c => c.cliidentificacion == cedula)
                .FirstOrDefaultAsync();

            return new()
            {
                Data = cliente,
                Message = "OK",
                Success = true,
            };
        }

        public async Task<string> GenerateNewFacturaId()
        {
            var lastFactura = await dbContext.facturas
                .OrderByDescending(f => f.facnumero)
                .FirstOrDefaultAsync();

            string newId = "FAC-001";

            if (lastFactura != null)
            {
                string lastId = lastFactura.facnumero;
                int number = int.Parse(lastId.Substring(4)) + 1;
                newId = $"FAC-{number:D3}";
            }

            return newId;
        }

        public async Task<Response<List<factura>>> GetFacturasByCliCed(string cedula)
        {
            var clicodigopasar = await dbContext.clientes.Where(y => y.cliidentificacion == cedula).FirstOrDefaultAsync();

            var obtenerFacturas =  await dbContext.facturas.Where(x => x.clicodigo == clicodigopasar.clicodigo && x.facstatus != "CAN" ).ToListAsync();

            return new()
            {
                Data = obtenerFacturas,
                Success = true,
                Message = "OK"
            };
        }
    }
}
