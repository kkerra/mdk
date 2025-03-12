using Dapper;

namespace LabWork15
{
    public class GenreRepository : IRepository<Genre>
    {
        private readonly DatabaseContext _dbContext;

        public GenreRepository(DatabaseContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<int> AddAsync(Genre entity)
        {
            string query = "INSERT INTO Genre(Name) VALUES(@Name); SELECT SCOPE_IDENTITY()";
            using var connection = _dbContext.CreateConnection();
            return await connection.ExecuteScalarAsync<int>(query, entity);
        }

        public async Task DeleteAsync(int id)
        {
            string query = "DELETE FROM Genre WHERE GenreId=@Id";
            using var connection = _dbContext.CreateConnection();
            await connection.ExecuteAsync(query, new { Id = id });
        }

        public async Task<IEnumerable<Genre>> GetAllAsync()
        {
            string query = "SELECT * FROM Genre";
            using var connection = _dbContext.CreateConnection();
            return await connection.QueryAsync<Genre>(query);
        }

        public async Task<Genre> GetByIdAsync(int id)
        {
            string query = "SELECT * FROM Genre WHERE GenreId=@Id";
            using var connection = _dbContext.CreateConnection();
            return await connection.QuerySingleOrDefaultAsync<Genre>(query, new { Id = id });
        }

        public async Task UpdateAsync(Genre entity)
        {
            string query = "UPDATE Genre SET Name=@Name WHERE GenreId=@Id";
            using var connection = _dbContext.CreateConnection();
            await connection.ExecuteAsync(query, new {entity.Name, entity.GenreId });
        }
    }
}
