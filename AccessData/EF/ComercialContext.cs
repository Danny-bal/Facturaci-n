using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace AccessData.EF;

public partial class ComercialContext : DbContext
{
    public ComercialContext()
    {
    }

    public ComercialContext(DbContextOptions<ComercialContext> options)
        : base(options)
    {
    }

    public virtual DbSet<cliente> clientes { get; set; }

    public virtual DbSet<factura> facturas { get; set; }

    public virtual DbSet<producto> productos { get; set; }

    public virtual DbSet<pxf> pxfs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Database=Comercial;Username=postgres;Password=kasan2001");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.HasPostgresEnum("sexo_enum", new[] { "M", "F" });

        modelBuilder.Entity<cliente>(entity =>
        {
            entity.HasKey(e => e.clicodigo).HasName("clientes_pkey");

            entity.Property(e => e.clicodigo).HasMaxLength(7);
            entity.Property(e => e.clicelular).HasMaxLength(10);
            entity.Property(e => e.clidireccion).HasMaxLength(60);
            entity.Property(e => e.cliemail).HasMaxLength(60);
            entity.Property(e => e.cliidentificacion).HasMaxLength(13);
            entity.Property(e => e.cliimage).HasMaxLength(4000);
            entity.Property(e => e.clinombre).HasMaxLength(60);
            entity.Property(e => e.clistatus).HasMaxLength(3);
            entity.Property(e => e.clitelefono).HasMaxLength(10);
            entity.Property(e => e.clitipo).HasMaxLength(3);
        });

        modelBuilder.Entity<factura>(entity =>
        {
            entity.HasKey(e => e.facnumero).HasName("facturas_pkey");

            entity.Property(e => e.facnumero).HasMaxLength(9);
            entity.Property(e => e.clicodigo).HasMaxLength(7);
            entity.Property(e => e.facdescuento).HasPrecision(9, 2);
            entity.Property(e => e.facformapago).HasMaxLength(5);
            entity.Property(e => e.facice).HasPrecision(9, 2);
            entity.Property(e => e.faciva).HasPrecision(9, 2);
            entity.Property(e => e.facstatus).HasMaxLength(3);
            entity.Property(e => e.facsubtotal).HasPrecision(9, 2);
        });

        modelBuilder.Entity<producto>(entity =>
        {
            entity.HasKey(e => e.procodigo).HasName("productos_pkey");

            entity.Property(e => e.procodigo).HasMaxLength(9);
            entity.Property(e => e.proajustes).HasPrecision(9, 2);
            entity.Property(e => e.procostoum).HasPrecision(7, 2);
            entity.Property(e => e.prodescripcion).HasMaxLength(50);
            entity.Property(e => e.proegresos).HasPrecision(9, 2);
            entity.Property(e => e.proingresos).HasPrecision(9, 2);
            entity.Property(e => e.proprecioum).HasPrecision(7, 2);
            entity.Property(e => e.prosaldofinal).HasPrecision(9, 2);
            entity.Property(e => e.prosaldoinicial).HasPrecision(9, 2);
            entity.Property(e => e.prostatus).HasMaxLength(3);
            entity.Property(e => e.prounidadmedida).HasMaxLength(3);
        });

        modelBuilder.Entity<pxf>(entity =>
        {
            entity.HasKey(e => new { e.facnumero, e.procodigo }).HasName("pxf_pkey");

            entity.ToTable("pxf");

            entity.Property(e => e.facnumero).HasMaxLength(9);
            entity.Property(e => e.procodigo).HasMaxLength(9);
            entity.Property(e => e.pxfcantidad).HasPrecision(9, 2);
            entity.Property(e => e.pxfstatus).HasMaxLength(3);
            entity.Property(e => e.pxfsubtotal).HasPrecision(9, 2);
            entity.Property(e => e.pxfvalor).HasPrecision(7, 2);

            entity.HasOne(d => d.facnumeroNavigation).WithMany(p => p.pxfs)
                .HasForeignKey(d => d.facnumero)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_pxf_facnumero");

            entity.HasOne(d => d.procodigoNavigation).WithMany(p => p.pxfs)
                .HasForeignKey(d => d.procodigo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_pxf_procodigo");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
