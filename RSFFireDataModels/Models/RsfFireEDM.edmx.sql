
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/07/2015 21:47:15
-- Generated from EDMX file: C:\Users\Chuck\Source\RSFFire\RSFFireDataModels\Models\RsfFireEDM.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [RSFFire];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_OrdinanceFee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fees] DROP CONSTRAINT [FK_OrdinanceFee];
GO
IF OBJECT_ID(N'[dbo].[FK_ParcelDocument]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_ParcelDocument];
GO
IF OBJECT_ID(N'[dbo].[FK_ParcelStreet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parcels] DROP CONSTRAINT [FK_ParcelStreet];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonFee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fees] DROP CONSTRAINT [FK_PersonFee];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonParcel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parcels] DROP CONSTRAINT [FK_PersonParcel];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonProject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_PersonProject];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectDocument]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_ProjectDocument];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectFee]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fees] DROP CONSTRAINT [FK_ProjectFee];
GO
IF OBJECT_ID(N'[dbo].[FK_ProjectJournalEntry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[JournalEntries] DROP CONSTRAINT [FK_ProjectJournalEntry];
GO
IF OBJECT_ID(N'[dbo].[FK_StreetProject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_StreetProject];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Documents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents];
GO
IF OBJECT_ID(N'[dbo].[Fees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Fees];
GO
IF OBJECT_ID(N'[dbo].[JournalEntries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[JournalEntries];
GO
IF OBJECT_ID(N'[dbo].[Ordinances]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ordinances];
GO
IF OBJECT_ID(N'[dbo].[Parcels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parcels];
GO
IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Streets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Streets];
GO
IF OBJECT_ID(N'[RSFFireModelStoreContainer].[ProjectList]', 'U') IS NOT NULL
    DROP TABLE [RSFFireModelStoreContainer].[ProjectList];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Documents'
CREATE TABLE [dbo].[Documents] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Type] nchar(10)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL,
    [ProjectId] int  NOT NULL,
    [ParcelId] int  NOT NULL,
    [Parcel_id] int  NOT NULL,
    [Project_id] int  NOT NULL
);
GO

-- Creating table 'Fees'
CREATE TABLE [dbo].[Fees] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [OrdinanceId] int  NOT NULL,
    [ProjectId] int  NOT NULL,
    [Fee1] decimal(19,4)  NOT NULL,
    [Qty] int  NOT NULL,
    [AmtPaid] decimal(19,4)  NOT NULL,
    [PaidWith] nvarchar(50)  NULL,
    [Reference] nvarchar(50)  NULL,
    [ContactId] int  NOT NULL,
    [OTRequest] bit  NOT NULL,
    [PlanCheckerId] int  NOT NULL,
    [PassFail] bit  NOT NULL,
    [PCKType] nvarchar(50)  NULL,
    [NotifiedOn] datetime  NULL,
    [PickedUpOn] datetime  NULL,
    [PickedUpBy] nvarchar(max)  NULL,
    [Notes] nvarchar(max)  NULL,
    [Project_id] int  NOT NULL,
    [Person_id] int  NOT NULL,
    [Ordinance_id] int  NOT NULL
);
GO

-- Creating table 'JournalEntries'
CREATE TABLE [dbo].[JournalEntries] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [ProjectId] int  NOT NULL,
    [Project_id] int  NOT NULL
);
GO

-- Creating table 'Ordinances'
CREATE TABLE [dbo].[Ordinances] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Number] nchar(10)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Parcels'
CREATE TABLE [dbo].[Parcels] (
    [id] int IDENTITY(1,1) NOT NULL,
    [APN] nchar(10)  NOT NULL,
    [OwnerId] int  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(2)  NOT NULL,
    [Zip] nvarchar(5)  NOT NULL,
    [StreetId] int  NOT NULL,
    [Streets_id] int  NOT NULL,
    [Person_id] int  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NULL,
    [City] nvarchar(max)  NULL,
    [State] nvarchar(2)  NULL,
    [Zip] nvarchar(5)  NULL,
    [Phone] nvarchar(max)  NULL,
    [AltPhone] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [id] int IDENTITY(1,1) NOT NULL,
    [PlanCheckNumber] nchar(10)  NOT NULL,
    [Date] datetime  NOT NULL,
    [FinalSignOff] datetime  NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Active] bit  NOT NULL,
    [AddressNumber] nchar(10)  NOT NULL,
    [StreetId] int  NOT NULL,
    [APN] nchar(10)  NOT NULL,
    [ProjectType] nchar(10)  NULL,
    [PlansReceived] bit  NOT NULL,
    [OnHold] bit  NOT NULL,
    [HoldDescription] nvarchar(max)  NULL,
    [Notes] nvarchar(max)  NULL,
    [Oct2007Related] bit  NOT NULL,
    [SeeFileCabinet] bit  NOT NULL,
    [ContactId] int  NULL,
    [LandscapeContactId] int  NULL,
    [PropertyOwnerId] int  NOT NULL,
    [ConstructionType] int  NULL,
    [Basement] bit  NOT NULL,
    [SprinklerContractorId] int  NULL,
    [OriginalSqFt] int  NULL,
    [Stories] int  NULL,
    [SqFtAdded] int  NULL,
    [FireFlow] nchar(10)  NULL,
    [UFCYear] int  NULL,
    [ParcelId] int  NOT NULL,
    [Street_id] int  NOT NULL,
    [Person_id] int  NOT NULL
);
GO

-- Creating table 'Streets'
CREATE TABLE [dbo].[Streets] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Street1] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProjectLists'
CREATE TABLE [dbo].[ProjectLists] (
    [AddressNumber] nchar(10)  NOT NULL,
    [Street1] nvarchar(max)  NOT NULL,
    [APN] nchar(10)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [PlanCheckNumber] nchar(10)  NOT NULL,
    [Notes] nvarchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [PK_Documents]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Fees'
ALTER TABLE [dbo].[Fees]
ADD CONSTRAINT [PK_Fees]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'JournalEntries'
ALTER TABLE [dbo].[JournalEntries]
ADD CONSTRAINT [PK_JournalEntries]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Ordinances'
ALTER TABLE [dbo].[Ordinances]
ADD CONSTRAINT [PK_Ordinances]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Parcels'
ALTER TABLE [dbo].[Parcels]
ADD CONSTRAINT [PK_Parcels]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Streets'
ALTER TABLE [dbo].[Streets]
ADD CONSTRAINT [PK_Streets]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [AddressNumber], [Street1], [APN], [Date], [Name], [PlanCheckNumber] in table 'ProjectLists'
ALTER TABLE [dbo].[ProjectLists]
ADD CONSTRAINT [PK_ProjectLists]
    PRIMARY KEY CLUSTERED ([AddressNumber], [Street1], [APN], [Date], [Name], [PlanCheckNumber] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Parcel_id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_ParcelDocument]
    FOREIGN KEY ([Parcel_id])
    REFERENCES [dbo].[Parcels]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ParcelDocument'
CREATE INDEX [IX_FK_ParcelDocument]
ON [dbo].[Documents]
    ([Parcel_id]);
GO

-- Creating foreign key on [Project_id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_ProjectDocument]
    FOREIGN KEY ([Project_id])
    REFERENCES [dbo].[Projects]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectDocument'
CREATE INDEX [IX_FK_ProjectDocument]
ON [dbo].[Documents]
    ([Project_id]);
GO

-- Creating foreign key on [Ordinance_id] in table 'Fees'
ALTER TABLE [dbo].[Fees]
ADD CONSTRAINT [FK_OrdinanceFee]
    FOREIGN KEY ([Ordinance_id])
    REFERENCES [dbo].[Ordinances]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdinanceFee'
CREATE INDEX [IX_FK_OrdinanceFee]
ON [dbo].[Fees]
    ([Ordinance_id]);
GO

-- Creating foreign key on [Person_id] in table 'Fees'
ALTER TABLE [dbo].[Fees]
ADD CONSTRAINT [FK_PersonFee]
    FOREIGN KEY ([Person_id])
    REFERENCES [dbo].[People]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonFee'
CREATE INDEX [IX_FK_PersonFee]
ON [dbo].[Fees]
    ([Person_id]);
GO

-- Creating foreign key on [Project_id] in table 'Fees'
ALTER TABLE [dbo].[Fees]
ADD CONSTRAINT [FK_ProjectFee]
    FOREIGN KEY ([Project_id])
    REFERENCES [dbo].[Projects]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectFee'
CREATE INDEX [IX_FK_ProjectFee]
ON [dbo].[Fees]
    ([Project_id]);
GO

-- Creating foreign key on [Project_id] in table 'JournalEntries'
ALTER TABLE [dbo].[JournalEntries]
ADD CONSTRAINT [FK_ProjectJournalEntry]
    FOREIGN KEY ([Project_id])
    REFERENCES [dbo].[Projects]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectJournalEntry'
CREATE INDEX [IX_FK_ProjectJournalEntry]
ON [dbo].[JournalEntries]
    ([Project_id]);
GO

-- Creating foreign key on [Streets_id] in table 'Parcels'
ALTER TABLE [dbo].[Parcels]
ADD CONSTRAINT [FK_ParcelStreet]
    FOREIGN KEY ([Streets_id])
    REFERENCES [dbo].[Streets]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ParcelStreet'
CREATE INDEX [IX_FK_ParcelStreet]
ON [dbo].[Parcels]
    ([Streets_id]);
GO

-- Creating foreign key on [Person_id] in table 'Parcels'
ALTER TABLE [dbo].[Parcels]
ADD CONSTRAINT [FK_PersonParcel]
    FOREIGN KEY ([Person_id])
    REFERENCES [dbo].[People]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonParcel'
CREATE INDEX [IX_FK_PersonParcel]
ON [dbo].[Parcels]
    ([Person_id]);
GO

-- Creating foreign key on [Person_id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_PersonProject]
    FOREIGN KEY ([Person_id])
    REFERENCES [dbo].[People]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonProject'
CREATE INDEX [IX_FK_PersonProject]
ON [dbo].[Projects]
    ([Person_id]);
GO

-- Creating foreign key on [Street_id] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_StreetProject]
    FOREIGN KEY ([Street_id])
    REFERENCES [dbo].[Streets]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StreetProject'
CREATE INDEX [IX_FK_StreetProject]
ON [dbo].[Projects]
    ([Street_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------