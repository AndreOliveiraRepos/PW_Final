﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PW_Final.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EntitiesConnection : DbContext
    {
        public EntitiesConnection()
            : base("name=EntitiesConnection")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<AvaliacaoClienteSet> AvaliacaoClienteSet { get; set; }
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<OficinaSet> OficinaSet { get; set; }
        public virtual DbSet<OrcamentoSet> OrcamentoSet { get; set; }
        public virtual DbSet<RelatorioServicoSet> RelatorioServicoSet { get; set; }
        public virtual DbSet<ServicoSet> ServicoSet { get; set; }
        public virtual DbSet<TipoReparacaoSet> TipoReparacaoSet { get; set; }
    }
}
