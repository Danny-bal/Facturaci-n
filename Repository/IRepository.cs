using AccessData.EF;
using AccessData.Response;
using Microsoft.EntityFrameworkCore;

namespace Repository
{
    public interface IRepository<TEntity>
    {
        Task<Response<List<TEntity>>> GetAllAsync();
        Task<Response<TEntity>> GetByIdAsync(string id);
        Task<Response<bool>> InsertAsync(TEntity data);
        Task<Response<bool>> InsertManyAsync(List<TEntity> data);
        Task<Response<bool>> DeleteAsync(string id);
        Task<Response<bool>> UpdateAsync(TEntity data);
        Task<Response<cliente>> GetClientByCED(string cedula);
        Task<Response<List<factura>>> GetFacturasByCliCed(string cedula);
        Task<string> GenerateNewFacturaId();
        
    }
}
