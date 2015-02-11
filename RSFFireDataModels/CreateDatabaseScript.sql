USE [master]
GO
/****** Object:  Database [RSFFire]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE DATABASE [RSFFire]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RSFFire', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CHUCKSLAPTOP\MSSQL\DATA\RSFFire.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RSFFire_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CHUCKSLAPTOP\MSSQL\DATA\RSFFire_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RSFFire] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RSFFire].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RSFFire] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RSFFire] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RSFFire] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RSFFire] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RSFFire] SET ARITHABORT OFF 
GO
ALTER DATABASE [RSFFire] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RSFFire] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RSFFire] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RSFFire] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RSFFire] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RSFFire] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RSFFire] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RSFFire] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RSFFire] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RSFFire] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RSFFire] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RSFFire] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RSFFire] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RSFFire] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RSFFire] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RSFFire] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RSFFire] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RSFFire] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RSFFire] SET RECOVERY FULL 
GO
ALTER DATABASE [RSFFire] SET  MULTI_USER 
GO
ALTER DATABASE [RSFFire] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RSFFire] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RSFFire] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RSFFire] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RSFFire', N'ON'
GO
USE [RSFFire]
GO
/****** Object:  User [cdc]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE USER [cdc] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[cdc]
GO
ALTER ROLE [db_owner] ADD MEMBER [cdc]
GO
/****** Object:  Schema [cdc]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE SCHEMA [cdc]
GO
/****** Object:  StoredProcedure [dbo].[usp_ProjectsDelete]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProjectsDelete] 
    @id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Projects]
	WHERE  [id] = @id

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_ProjectsInsert]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProjectsInsert] 
    @Created datetime,
    @Updated datetime = NULL,
    @PlanCheckNumber nchar(10),
    @Date datetime,
    @FinalSignOff datetime = NULL,
    @Name nvarchar(MAX),
    @Active bit,
    @Address nchar(10),
    @Street nvarchar(MAX),
    @APN nchar(10),
    @ProjectType nchar(10) = NULL,
    @PlansReceived bit,
    @OnHold bit,
    @HoldDescription nvarchar(MAX) = NULL,
    @Notes nvarchar(MAX) = NULL,
    @Oct2007Related bit,
    @SeeFileCabinet bit,
    @ContactId int = NULL,
    @LandscapeContactId int = NULL,
    @PropertyOwnerId int,
    @ConstructionType int = NULL,
    @Basement bit,
    @SprinklerContractorId int = NULL,
    @OriginalSqFt int = NULL,
    @Stories int = NULL,
    @SqFtAdded int = NULL,
    @FireFlow nchar(10) = NULL,
    @UFCYear int = NULL,
    @ParcelId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Projects] ([Created], [Updated], [PlanCheckNumber], [Date], [FinalSignOff], [Name], [Active], [Address], [Street], [APN], [ProjectType], [PlansReceived], [OnHold], [HoldDescription], [Notes], [Oct2007Related], [SeeFileCabinet], [ContactId], [LandscapeContactId], [PropertyOwnerId], [ConstructionType], [Basement], [SprinklerContractorId], [OriginalSqFt], [Stories], [SqFtAdded], [FireFlow], [UFCYear], [ParcelId])
	SELECT @Created, @Updated, @PlanCheckNumber, @Date, @FinalSignOff, @Name, @Active, @Address, @Street, @APN, @ProjectType, @PlansReceived, @OnHold, @HoldDescription, @Notes, @Oct2007Related, @SeeFileCabinet, @ContactId, @LandscapeContactId, @PropertyOwnerId, @ConstructionType, @Basement, @SprinklerContractorId, @OriginalSqFt, @Stories, @SqFtAdded, @FireFlow, @UFCYear, @ParcelId
	
	-- Begin Return Select <- do not remove
	SELECT [id], [Created], [Updated], [PlanCheckNumber], [Date], [FinalSignOff], [Name], [Active], [Address], [Street], [APN], [ProjectType], [PlansReceived], [OnHold], [HoldDescription], [Notes], [Oct2007Related], [SeeFileCabinet], [ContactId], [LandscapeContactId], [PropertyOwnerId], [ConstructionType], [Basement], [SprinklerContractorId], [OriginalSqFt], [Stories], [SqFtAdded], [FireFlow], [UFCYear], [ParcelId]
	FROM   [dbo].[Projects]
	WHERE  [id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_ProjectsSelect]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProjectsSelect] 
    @id int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [id], [Created], [Updated], [PlanCheckNumber], [Date], [FinalSignOff], [Name], [Active], [Address], [Street], [APN], [ProjectType], [PlansReceived], [OnHold], [HoldDescription], [Notes], [Oct2007Related], [SeeFileCabinet], [ContactId], [LandscapeContactId], [PropertyOwnerId], [ConstructionType], [Basement], [SprinklerContractorId], [OriginalSqFt], [Stories], [SqFtAdded], [FireFlow], [UFCYear], [ParcelId] 
	FROM   [dbo].[Projects] 
	WHERE  ([id] = @id OR @id IS NULL) 

	COMMIT

GO
/****** Object:  StoredProcedure [dbo].[usp_ProjectsUpdate]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ProjectsUpdate] 
    @id int,
    @Created datetime,
    @Updated datetime = NULL,
    @PlanCheckNumber nchar(10),
    @Date datetime,
    @FinalSignOff datetime = NULL,
    @Name nvarchar(MAX),
    @Active bit,
    @Address nchar(10),
    @Street nvarchar(MAX),
    @APN nchar(10),
    @ProjectType nchar(10) = NULL,
    @PlansReceived bit,
    @OnHold bit,
    @HoldDescription nvarchar(MAX) = NULL,
    @Notes nvarchar(MAX) = NULL,
    @Oct2007Related bit,
    @SeeFileCabinet bit,
    @ContactId int = NULL,
    @LandscapeContactId int = NULL,
    @PropertyOwnerId int,
    @ConstructionType int = NULL,
    @Basement bit,
    @SprinklerContractorId int = NULL,
    @OriginalSqFt int = NULL,
    @Stories int = NULL,
    @SqFtAdded int = NULL,
    @FireFlow nchar(10) = NULL,
    @UFCYear int = NULL,
    @ParcelId int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Projects]
	SET    [Created] = @Created, [Updated] = @Updated, [PlanCheckNumber] = @PlanCheckNumber, [Date] = @Date, [FinalSignOff] = @FinalSignOff, [Name] = @Name, [Active] = @Active, [Address] = @Address, [Street] = @Street, [APN] = @APN, [ProjectType] = @ProjectType, [PlansReceived] = @PlansReceived, [OnHold] = @OnHold, [HoldDescription] = @HoldDescription, [Notes] = @Notes, [Oct2007Related] = @Oct2007Related, [SeeFileCabinet] = @SeeFileCabinet, [ContactId] = @ContactId, [LandscapeContactId] = @LandscapeContactId, [PropertyOwnerId] = @PropertyOwnerId, [ConstructionType] = @ConstructionType, [Basement] = @Basement, [SprinklerContractorId] = @SprinklerContractorId, [OriginalSqFt] = @OriginalSqFt, [Stories] = @Stories, [SqFtAdded] = @SqFtAdded, [FireFlow] = @FireFlow, [UFCYear] = @UFCYear, [ParcelId] = @ParcelId
	WHERE  [id] = @id
	
	-- Begin Return Select <- do not remove
	SELECT [id], [Created], [Updated], [PlanCheckNumber], [Date], [FinalSignOff], [Name], [Active], [Address], [Street], [APN], [ProjectType], [PlansReceived], [OnHold], [HoldDescription], [Notes], [Oct2007Related], [SeeFileCabinet], [ContactId], [LandscapeContactId], [PropertyOwnerId], [ConstructionType], [Basement], [SprinklerContractorId], [OriginalSqFt], [Stories], [SqFtAdded], [FireFlow], [UFCYear], [ParcelId]
	FROM   [dbo].[Projects]
	WHERE  [id] = @id	
	-- End Return Select <- do not remove

	COMMIT

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Documents]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NULL,
	[Type] [nchar](10) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[ParcelId] [int] NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fees]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NULL,
	[Description] [nvarchar](max) NOT NULL,
	[OrdinanceId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[FeeAmt] [decimal](19, 4) NOT NULL,
	[Qty] [int] NOT NULL,
	[AmtPaid] [decimal](19, 4) NOT NULL,
	[PaidWith] [nvarchar](50) NULL,
	[Reference] [nvarchar](50) NULL,
	[ContactId] [int] NOT NULL,
	[OTRequest] [bit] NOT NULL,
	[PlanCheckerId] [int] NOT NULL,
	[PassFail] [bit] NOT NULL,
	[PCKType] [nvarchar](50) NULL,
	[NotifiedOn] [datetime] NULL,
	[PickedUpOn] [datetime] NULL,
	[PickedUpBy] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Fees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JournalEntries]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NULL,
	[Text] [nvarchar](max) NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_JournalEntries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ordinances]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordinances](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL DEFAULT (getdate()),
	[Updated] [datetime] NULL,
	[Number] [nchar](10) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Ordinances] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parcels]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL DEFAULT (getdate()),
	[Updated] [datetime] NULL,
	[APN] [nchar](10) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[Zip] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Parcels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL DEFAULT (getdate()),
	[Updated] [datetime] NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](5) NULL,
	[Phone] [nvarchar](max) NULL,
	[AltPhone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL DEFAULT (getdate()),
	[Updated] [datetime] NULL,
	[PlanCheckNumber] [nchar](10) NOT NULL,
	[Date] [datetime] NOT NULL,
	[FinalSignOff] [datetime] NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
	[Address] [nchar](10) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[APN] [nchar](10) NOT NULL,
	[ProjectType] [nchar](10) NULL,
	[PlansReceived] [bit] NOT NULL,
	[OnHold] [bit] NOT NULL,
	[HoldDescription] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Oct2007Related] [bit] NOT NULL,
	[SeeFileCabinet] [bit] NOT NULL,
	[ContactId] [int] NULL,
	[LandscapeContactId] [int] NULL,
	[PropertyOwnerId] [int] NOT NULL,
	[ConstructionType] [int] NULL,
	[Basement] [bit] NOT NULL,
	[SprinklerContractorId] [int] NULL,
	[OriginalSqFt] [int] NULL,
	[Stories] [int] NULL,
	[SqFtAdded] [int] NULL,
	[FireFlow] [nchar](10) NULL,
	[UFCYear] [int] NULL,
	[ParcelId] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Streets]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Streets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[ProjectList]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ProjectList]
AS
SELECT dbo.Projects.Address, dbo.Streets.Street1, dbo.Projects.APN, dbo.Projects.Date, dbo.Projects.Name, dbo.Projects.PlanCheckNumber, dbo.Projects.Notes
FROM   dbo.People INNER JOIN
             dbo.Projects ON dbo.People.id = dbo.Projects.Person_id INNER JOIN
             dbo.Streets ON dbo.Projects.Street_id = dbo.Streets.id


GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/10/2015 9:49:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [DF_Documents_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Fees] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[JournalEntries] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Streets] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Parcels] FOREIGN KEY([ParcelId])
REFERENCES [dbo].[Parcels] ([id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_Parcels]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_Projects]
GO
ALTER TABLE [dbo].[Fees]  WITH CHECK ADD  CONSTRAINT [FK_Fees_Ordinances] FOREIGN KEY([OrdinanceId])
REFERENCES [dbo].[Ordinances] ([id])
GO
ALTER TABLE [dbo].[Fees] CHECK CONSTRAINT [FK_Fees_Ordinances]
GO
ALTER TABLE [dbo].[Fees]  WITH CHECK ADD  CONSTRAINT [FK_Fees_People] FOREIGN KEY([ContactId])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[Fees] CHECK CONSTRAINT [FK_Fees_People]
GO
ALTER TABLE [dbo].[Fees]  WITH CHECK ADD  CONSTRAINT [FK_Fees_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[Fees] CHECK CONSTRAINT [FK_Fees_Projects]
GO
ALTER TABLE [dbo].[JournalEntries]  WITH CHECK ADD  CONSTRAINT [FK_JournalEntries_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([id])
GO
ALTER TABLE [dbo].[JournalEntries] CHECK CONSTRAINT [FK_JournalEntries_Projects]
GO
ALTER TABLE [dbo].[Parcels]  WITH CHECK ADD  CONSTRAINT [FK_Parcels_People] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[Parcels] CHECK CONSTRAINT [FK_Parcels_People]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Parcels] FOREIGN KEY([ParcelId])
REFERENCES [dbo].[Parcels] ([id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Parcels]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_People] FOREIGN KEY([ContactId])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_People]
GO
/****** Object:  Trigger [dbo].[FeeUpdateTrigger]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		E7
-- Create date: 
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[FeeUpdateTrigger] 
   ON  [dbo].[Fees] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE dbo.Fees
		SET Updated = GetDate()
		WHERE Id IN(SELECT Id FROM inserted)
END

GO
/****** Object:  Trigger [dbo].[JournalEntriesUpdateTrigger]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		E7
-- Create date: 
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[JournalEntriesUpdateTrigger] 
   ON  [dbo].[JournalEntries] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE dbo.JournalEntries
		SET Updated = GetDate()
		WHERE Id IN(SELECT Id FROM inserted)
END

GO
/****** Object:  Trigger [dbo].[UpdateOrdinancesTrigger]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		E7
-- Create date: 
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[UpdateOrdinancesTrigger] 
   ON  [dbo].[Ordinances] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE dbo.Ordinances
		SET Updated = GetDate()
		WHERE Id IN(SELECT Id FROM inserted)
END

GO
/****** Object:  Trigger [dbo].[UpdateParcelsTrigger]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		E7
-- Create date: 
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[UpdateParcelsTrigger] 
   ON  [dbo].[Parcels] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE dbo.Parcels
		SET Updated = GetDate()
		WHERE Id IN(SELECT Id FROM inserted)
END

GO
/****** Object:  Trigger [dbo].[UpdatePeopleTrigger]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		E7
-- Create date: 
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[UpdatePeopleTrigger] 
   ON  [dbo].[People] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE dbo.People
		SET Updated = GetDate()
		WHERE Id IN(SELECT Id FROM inserted)

END

GO
/****** Object:  Trigger [dbo].[UpdateStreetsTrigger]    Script Date: 2/10/2015 9:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		E7
-- Create date: 
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[UpdateStreetsTrigger] 
   ON  [dbo].[Streets] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE dbo.Streets
		SET Updated = GetDate()
		WHERE Id IN(SELECT Id FROM inserted)

END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "People"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 221
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Projects"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 609
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "Streets"
            Begin Extent = 
               Top = 9
               Left = 666
               Bottom = 152
               Right = 888
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProjectList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProjectList'
GO
USE [master]
GO
ALTER DATABASE [RSFFire] SET  READ_WRITE 
GO
