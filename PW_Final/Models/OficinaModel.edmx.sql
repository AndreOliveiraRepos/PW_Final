
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/08/2017 23:23:05
-- Generated from EDMX file: C:\Users\red_f\Documents\fac\GitRepos\PW\PW_Final\PW_Final\Models\OficinaModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [OFICINABD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_TipoReparacaoOficina]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OficinaSet] DROP CONSTRAINT [FK_TipoReparacaoOficina];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoReparacaoAspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PedidoReparacaoSet] DROP CONSTRAINT [FK_PedidoReparacaoAspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoReparacaoTipoReparacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PedidoReparacaoSet] DROP CONSTRAINT [FK_PedidoReparacaoTipoReparacao];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoReparacaoRespostaPedido]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RespostaPedidoSet] DROP CONSTRAINT [FK_PedidoReparacaoRespostaPedido];
GO
IF OBJECT_ID(N'[dbo].[FK_RespostaPedidoOficina]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RespostaPedidoSet] DROP CONSTRAINT [FK_RespostaPedidoOficina];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[C__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[C__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[OficinaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OficinaSet];
GO
IF OBJECT_ID(N'[dbo].[PedidoReparacaoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PedidoReparacaoSet];
GO
IF OBJECT_ID(N'[dbo].[TipoReparacaoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoReparacaoSet];
GO
IF OBJECT_ID(N'[dbo].[RespostaPedidoSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RespostaPedidoSet];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'OficinaSet'
CREATE TABLE [dbo].[OficinaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Morada] nvarchar(max)  NOT NULL,
    [Telefone] nvarchar(max)  NOT NULL,
    [TipoReparacaoId] int  NOT NULL,
    [Avaliacao] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PedidoReparacaoSet'
CREATE TABLE [dbo].[PedidoReparacaoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DescricaoAvaria] nvarchar(max)  NOT NULL,
    [DataPedido] datetime  NOT NULL,
    [Avaliacao] smallint  NOT NULL,
    [AspNetUsersId] nvarchar(128)  NOT NULL,
    [TipoReparacaoId] int  NOT NULL
);
GO

-- Creating table 'TipoReparacaoSet'
CREATE TABLE [dbo].[TipoReparacaoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descricao] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RespostaPedidoSet'
CREATE TABLE [dbo].[RespostaPedidoSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Valor] float  NOT NULL,
    [Aceite] bit  NOT NULL,
    [PedidoReparacaoId] int  NOT NULL,
    [Oficina_Id] int  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OficinaSet'
ALTER TABLE [dbo].[OficinaSet]
ADD CONSTRAINT [PK_OficinaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PedidoReparacaoSet'
ALTER TABLE [dbo].[PedidoReparacaoSet]
ADD CONSTRAINT [PK_PedidoReparacaoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TipoReparacaoSet'
ALTER TABLE [dbo].[TipoReparacaoSet]
ADD CONSTRAINT [PK_TipoReparacaoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RespostaPedidoSet'
ALTER TABLE [dbo].[RespostaPedidoSet]
ADD CONSTRAINT [PK_RespostaPedidoSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [TipoReparacaoId] in table 'OficinaSet'
ALTER TABLE [dbo].[OficinaSet]
ADD CONSTRAINT [FK_TipoReparacaoOficina]
    FOREIGN KEY ([TipoReparacaoId])
    REFERENCES [dbo].[TipoReparacaoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TipoReparacaoOficina'
CREATE INDEX [IX_FK_TipoReparacaoOficina]
ON [dbo].[OficinaSet]
    ([TipoReparacaoId]);
GO

-- Creating foreign key on [AspNetUsersId] in table 'PedidoReparacaoSet'
ALTER TABLE [dbo].[PedidoReparacaoSet]
ADD CONSTRAINT [FK_PedidoReparacaoAspNetUsers]
    FOREIGN KEY ([AspNetUsersId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoReparacaoAspNetUsers'
CREATE INDEX [IX_FK_PedidoReparacaoAspNetUsers]
ON [dbo].[PedidoReparacaoSet]
    ([AspNetUsersId]);
GO

-- Creating foreign key on [TipoReparacaoId] in table 'PedidoReparacaoSet'
ALTER TABLE [dbo].[PedidoReparacaoSet]
ADD CONSTRAINT [FK_PedidoReparacaoTipoReparacao]
    FOREIGN KEY ([TipoReparacaoId])
    REFERENCES [dbo].[TipoReparacaoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoReparacaoTipoReparacao'
CREATE INDEX [IX_FK_PedidoReparacaoTipoReparacao]
ON [dbo].[PedidoReparacaoSet]
    ([TipoReparacaoId]);
GO

-- Creating foreign key on [PedidoReparacaoId] in table 'RespostaPedidoSet'
ALTER TABLE [dbo].[RespostaPedidoSet]
ADD CONSTRAINT [FK_PedidoReparacaoRespostaPedido]
    FOREIGN KEY ([PedidoReparacaoId])
    REFERENCES [dbo].[PedidoReparacaoSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoReparacaoRespostaPedido'
CREATE INDEX [IX_FK_PedidoReparacaoRespostaPedido]
ON [dbo].[RespostaPedidoSet]
    ([PedidoReparacaoId]);
GO

-- Creating foreign key on [Oficina_Id] in table 'RespostaPedidoSet'
ALTER TABLE [dbo].[RespostaPedidoSet]
ADD CONSTRAINT [FK_RespostaPedidoOficina]
    FOREIGN KEY ([Oficina_Id])
    REFERENCES [dbo].[OficinaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RespostaPedidoOficina'
CREATE INDEX [IX_FK_RespostaPedidoOficina]
ON [dbo].[RespostaPedidoSet]
    ([Oficina_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------