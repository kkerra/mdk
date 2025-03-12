using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Dapper.SqlMapper;

namespace LabWork15
{
    public class CategoryRepository : IRepository<Category>
    {
        private readonly DatabaseContext _dbContext;

        public CategoryRepository(DatabaseContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<int> AddAsync(Category entity)
        {
            string query = "INSERT INTO Category(Name) VALUES(@Name); SELECT SCOPE_IDENTITY()";
            using var connection = _dbContext.CreateConnection();
            return await connection.ExecuteScalarAsync<int>(query, entity);
        }

        public Task DeleteAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Category>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<Category> GetByIdAsync(int id)
        {
            string query = "SELECT * FROM Category WHERE CategoryId=@Id";
            using var connection = _dbContext.CreateConnection();
            return await connection.QuerySingleAsync<Category>(query, new { Id = id });
        }

        public Task UpdateAsync(Category entity)
        {
            throw new NotImplementedException();
        }
    }
}
