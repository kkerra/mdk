using Dapper;
using static Dapper.SqlMapper;

namespace LabWork15
{
    public class VisitorRepository : IRepository<Visitor>
    {
        private readonly DatabaseContext _dbContext;

        public VisitorRepository(DatabaseContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<int> AddAsync(Visitor entity)
        {
            string query = "INSERT INTO Visitor(Phone) VALUES(@Phone); SELECT SCOPE_IDENTITY()";
            using var connection = _dbContext.CreateConnection();
            return await connection.ExecuteScalarAsync<int>(query, entity);
        }

        public async Task DeleteAsync(int id)
        {
            string query = "DELETE FROM Visitor WHERE VisitorId=@Id";
            using var connection = _dbContext.CreateConnection();
            await connection.ExecuteAsync(query, new {Id = id});
        }

        public async Task<IEnumerable<Visitor>> GetAllAsync()
        {
            string query = "SELECT * FROM Visitor";
            using var connection = _dbContext.CreateConnection();
            return await connection.QueryAsync<Visitor>(query);
        }

        public async Task<Visitor> GetByIdAsync(int id)
        {
            string query = "SELECT * FROM Visitor WHERE VisitorId=@Id";
            using var connection = _dbContext.CreateConnection();
            return await connection.QuerySingleOrDefaultAsync<Visitor>(query, new { Id = id });
        }

        public async Task UpdateAsync(Visitor entity)
        {
            string query = "UPDATE Visitor SET Phone=@Phone WHERE VisitorId=@Id";
            using var connection = _dbContext.CreateConnection();
            await connection.ExecuteAsync(query, entity);
        }
    }
}
