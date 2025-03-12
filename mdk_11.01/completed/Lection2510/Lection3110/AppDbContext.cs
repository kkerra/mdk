using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace Lection3110
{
    public class AppDbContext : DbContext
    {
        public DbSet<Category> Categories => Set<Category>();
        public DbSet<Game> Games => Set<Game>();

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            SqlConnectionStringBuilder builder = new()
            {
                DataSource = @"PRSERVER\SQLEXPRESS",
                InitialCatalog = "ispp3503",
                UserID = "ispp3503",
                Password = "3503",
                TrustServerCertificate = true
            };
            string connectionString = builder.ConnectionString;
            optionsBuilder.UseSqlServer(connectionString);
        }
    }
}
