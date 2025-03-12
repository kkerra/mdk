using Microsoft.EntityFrameworkCore;

namespace MigrationApp
{

    public partial class AppDbContext : DbContext
    {
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<Group> Groups { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    => optionsBuilder.UseSqlServer("Data Source = PRSERVER\\SQLEXPRESS; Initial Catalog = ispp3503; User ID = ispp3503; Password = 3503; Trust Server Certificate=True");

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //Fluent API
            modelBuilder.Entity<Group>().HasData(
                new Group { GroupId = 1, Name = "ispp-35" },
                new Group { GroupId = 2, Name = "ispp-21" }
                );
            modelBuilder.Entity<Student>().HasData(
                new Student { StudentId = 1, Name = "Каспер", GroupId = 1 },
                new Student { StudentId = 2, Name = "Луев", GroupId = 1 },
                new Student { StudentId = 3, Name = "Рыбин", GroupId = 2 }
                );
        }
    }

}
