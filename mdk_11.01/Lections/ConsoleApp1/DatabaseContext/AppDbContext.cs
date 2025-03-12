using System;
using System.Collections.Generic;
using Scaffold.Models;
using Microsoft.EntityFrameworkCore;

namespace Scaffold.DatabaseContext;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Game> Games { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source = mssql; Initial Catalog = ispp3503; User ID = ispp3503; Password = 3503; Trust Server Certificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.CategoryId).HasName("PK__Category__19093A0B45856341");

            entity.ToTable("Category");

            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Game>(entity =>
        {
            entity.HasKey(e => e.GameId).HasName("PK__Game__2AB897FDB4F1374C");

            entity.ToTable("Game", tb =>
                {
                    tb.HasTrigger("trChangedGamesCount");
                    tb.HasTrigger("trDeleteGame");
                    tb.HasTrigger("trSavePrice");
                });

            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.IsDeleted).HasDefaultValue(false);
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Price).HasColumnType("decimal(16, 2)");
            entity.Property(e => e.TotalKeys).HasDefaultValue(100);

            entity.HasOne(d => d.Category).WithMany(p => p.Games)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Game_Category");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
