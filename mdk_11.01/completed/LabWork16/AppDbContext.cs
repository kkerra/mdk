using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace LabWork16
{
    public class AppDbContext : DbContext
    {
        public DbSet<Visitor> Visitors => Set<Visitor>();
        public DbSet<Ticket> Tickets => Set<Ticket>();

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
