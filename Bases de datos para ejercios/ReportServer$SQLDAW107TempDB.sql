USE [master]
GO
/****** Object:  Database [ReportServer$SQLDAW107TempDB]    Script Date: 30/01/2015 13:17:43 ******/
CREATE DATABASE [ReportServer$SQLDAW107TempDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReportServer$SQLDAW107TempDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\ReportServer$SQLDAW107TempDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ReportServer$SQLDAW107TempDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\ReportServer$SQLDAW107TempDB_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReportServer$SQLDAW107TempDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET  MULTI_USER 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ReportServer$SQLDAW107TempDB]
GO
/****** Object:  User [NT SERVICE\ReportServer$SQLDAW107]    Script Date: 30/01/2015 13:17:43 ******/
CREATE USER [NT SERVICE\ReportServer$SQLDAW107] FOR LOGIN [NT SERVICE\ReportServer$SQLDAW107] WITH DEFAULT_SCHEMA=[NT SERVICE\ReportServer$SQLDAW107]
GO
/****** Object:  DatabaseRole [RSExecRole]    Script Date: 30/01/2015 13:17:43 ******/
CREATE ROLE [RSExecRole]
GO
ALTER ROLE [RSExecRole] ADD MEMBER [NT SERVICE\ReportServer$SQLDAW107]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT SERVICE\ReportServer$SQLDAW107]
GO
ALTER ROLE [db_owner] ADD MEMBER [RSExecRole]
GO
/****** Object:  Schema [NT SERVICE\ReportServer$SQLDAW107]    Script Date: 30/01/2015 13:17:43 ******/
CREATE SCHEMA [NT SERVICE\ReportServer$SQLDAW107]
GO
/****** Object:  Schema [RSExecRole]    Script Date: 30/01/2015 13:17:43 ******/
CREATE SCHEMA [RSExecRole]
GO
/****** Object:  StoredProcedure [dbo].[GetDBVersion]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE PROCEDURE [dbo].[GetDBVersion]
    @DBVersion nvarchar(32) OUTPUT
    AS
    SET @DBVersion = (select top(1) [DbVersion]  from [dbo].[DBUpgradeHistory])
GO
/****** Object:  Table [dbo].[ChunkData]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChunkData](
	[ChunkID] [uniqueidentifier] NOT NULL,
	[SnapshotDataID] [uniqueidentifier] NOT NULL,
	[ChunkFlags] [tinyint] NULL,
	[ChunkName] [nvarchar](260) NULL,
	[ChunkType] [int] NULL,
	[Version] [smallint] NULL,
	[MimeType] [nvarchar](260) NULL,
	[Content] [image] NULL,
 CONSTRAINT [PK_ChunkData] PRIMARY KEY NONCLUSTERED 
(
	[ChunkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChunkSegmentMapping]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChunkSegmentMapping](
	[ChunkId] [uniqueidentifier] NOT NULL,
	[SegmentId] [uniqueidentifier] NOT NULL,
	[StartByte] [bigint] NOT NULL,
	[LogicalByteCount] [int] NOT NULL,
	[ActualByteCount] [int] NOT NULL,
 CONSTRAINT [PK_ChunkSegmentMapping] PRIMARY KEY CLUSTERED 
(
	[ChunkId] ASC,
	[SegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DBUpgradeHistory]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBUpgradeHistory](
	[UpgradeID] [bigint] IDENTITY(1,1) NOT NULL,
	[DbVersion] [nvarchar](25) NULL,
	[User] [nvarchar](128) NULL DEFAULT (suser_sname()),
	[DateTime] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_DBUpgradeHistory] PRIMARY KEY CLUSTERED 
(
	[UpgradeID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExecutionCache]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExecutionCache](
	[ExecutionCacheID] [uniqueidentifier] NOT NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[ExpirationFlags] [int] NOT NULL,
	[AbsoluteExpiration] [datetime] NULL,
	[RelativeExpiration] [int] NULL,
	[SnapshotDataID] [uniqueidentifier] NOT NULL,
	[LastUsedTime] [datetime] NOT NULL,
	[ParamsHash] [int] NOT NULL,
 CONSTRAINT [PK_ExecutionCache] PRIMARY KEY NONCLUSTERED 
(
	[ExecutionCacheID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersistedStream]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersistedStream](
	[SessionID] [varchar](32) NOT NULL,
	[Index] [int] NOT NULL,
	[Content] [image] NULL,
	[Name] [nvarchar](260) NULL,
	[MimeType] [nvarchar](260) NULL,
	[Extension] [nvarchar](260) NULL,
	[Encoding] [nvarchar](260) NULL,
	[Error] [nvarchar](512) NULL,
	[RefCount] [int] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PersistedStream] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC,
	[Index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Segment]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Segment](
	[SegmentId] [uniqueidentifier] NOT NULL,
	[Content] [varbinary](max) NULL,
 CONSTRAINT [PK_Segment] PRIMARY KEY CLUSTERED 
(
	[SegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SegmentedChunk]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SegmentedChunk](
	[ChunkId] [uniqueidentifier] NOT NULL,
	[SnapshotDataId] [uniqueidentifier] NOT NULL,
	[ChunkFlags] [tinyint] NOT NULL,
	[ChunkName] [nvarchar](260) NOT NULL,
	[ChunkType] [int] NOT NULL,
	[Version] [smallint] NOT NULL,
	[MimeType] [nvarchar](260) NULL,
	[Machine] [nvarchar](512) NOT NULL,
	[SegmentedChunkId] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SegmentedChunk] PRIMARY KEY CLUSTERED 
(
	[SegmentedChunkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SessionData]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionData](
	[SessionID] [varchar](32) NOT NULL,
	[CompiledDefinition] [uniqueidentifier] NULL,
	[SnapshotDataID] [uniqueidentifier] NULL,
	[IsPermanentSnapshot] [bit] NULL,
	[ReportPath] [nvarchar](464) NULL,
	[Timeout] [int] NOT NULL,
	[AutoRefreshSeconds] [int] NULL,
	[Expiration] [datetime] NOT NULL,
	[ShowHideInfo] [image] NULL,
	[DataSourceInfo] [image] NULL,
	[OwnerID] [uniqueidentifier] NOT NULL,
	[EffectiveParams] [ntext] NULL,
	[CreationTime] [datetime] NOT NULL,
	[HasInteractivity] [bit] NULL,
	[SnapshotExpirationDate] [datetime] NULL,
	[HistoryDate] [datetime] NULL,
	[PageHeight] [float] NULL,
	[PageWidth] [float] NULL,
	[TopMargin] [float] NULL,
	[BottomMargin] [float] NULL,
	[LeftMargin] [float] NULL,
	[RightMargin] [float] NULL,
	[AwaitingFirstExecution] [bit] NULL,
	[EditSessionID] [varchar](32) NULL,
	[DataSetInfo] [varbinary](max) NULL,
	[SitePath] [nvarchar](440) NULL,
	[SiteZone] [int] NOT NULL,
	[ReportDefinitionPath] [nvarchar](464) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SessionLock]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionLock](
	[SessionID] [varchar](32) NOT NULL,
	[LockVersion] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SnapshotData]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SnapshotData](
	[SnapshotDataID] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ParamsHash] [int] NULL,
	[QueryParams] [ntext] NULL,
	[EffectiveParams] [ntext] NULL,
	[Description] [nvarchar](512) NULL,
	[DependsOnUser] [bit] NULL,
	[PermanentRefcount] [int] NOT NULL,
	[TransientRefcount] [int] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[PageCount] [int] NULL,
	[HasDocMap] [bit] NULL,
	[Machine] [nvarchar](512) NOT NULL,
	[PaginationMode] [smallint] NULL,
	[ProcessingFlags] [int] NULL,
	[IsCached] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempCatalog]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempCatalog](
	[EditSessionID] [varchar](32) NOT NULL,
	[TempCatalogID] [uniqueidentifier] NOT NULL,
	[ContextPath] [nvarchar](425) NOT NULL,
	[Name] [nvarchar](425) NOT NULL,
	[Content] [varbinary](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Intermediate] [uniqueidentifier] NULL,
	[IntermediateIsPermanent] [bit] NOT NULL,
	[Property] [nvarchar](max) NULL,
	[Parameter] [nvarchar](max) NULL,
	[OwnerID] [uniqueidentifier] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[ExpirationTime] [datetime] NOT NULL,
	[DataCacheHash] [varbinary](64) NULL,
 CONSTRAINT [PK_TempCatalog] PRIMARY KEY CLUSTERED 
(
	[EditSessionID] ASC,
	[ContextPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQ_TempCatalogID] UNIQUE NONCLUSTERED 
(
	[TempCatalogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempDataSets]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempDataSets](
	[ID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[LinkID] [uniqueidentifier] NULL,
	[Name] [nvarchar](260) NOT NULL,
 CONSTRAINT [PK_TempDataSet] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempDataSources]    Script Date: 30/01/2015 13:17:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempDataSources](
	[DSID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](260) NULL,
	[Extension] [nvarchar](260) NULL,
	[Link] [uniqueidentifier] NULL,
	[CredentialRetrieval] [int] NULL,
	[Prompt] [ntext] NULL,
	[ConnectionString] [image] NULL,
	[OriginalConnectionString] [image] NULL,
	[OriginalConnectStringExpressionBased] [bit] NULL,
	[UserName] [image] NULL,
	[Password] [image] NULL,
	[Flags] [int] NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED 
(
	[DSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ChunkData]    Script Date: 30/01/2015 13:17:43 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_ChunkData] ON [dbo].[ChunkData]
(
	[SnapshotDataID] ASC,
	[ChunkType] ASC,
	[ChunkName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExecutionCache]    Script Date: 30/01/2015 13:17:43 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_ExecutionCache] ON [dbo].[ExecutionCache]
(
	[AbsoluteExpiration] DESC,
	[ReportID] ASC,
	[SnapshotDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_SessionData]    Script Date: 30/01/2015 13:17:43 ******/
CREATE UNIQUE CLUSTERED INDEX [IDX_SessionData] ON [dbo].[SessionData]
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_SessionLock]    Script Date: 30/01/2015 13:17:43 ******/
CREATE UNIQUE CLUSTERED INDEX [IDX_SessionLock] ON [dbo].[SessionLock]
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SnapshotData]    Script Date: 30/01/2015 13:17:43 ******/
CREATE CLUSTERED INDEX [IX_SnapshotData] ON [dbo].[SnapshotData]
(
	[SnapshotDataID] ASC,
	[ParamsHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TempDataSet_ItemID_Name]    Script Date: 30/01/2015 13:17:43 ******/
CREATE CLUSTERED INDEX [IX_TempDataSet_ItemID_Name] ON [dbo].[TempDataSets]
(
	[ItemID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChunkSegmentMapping_SegmentId]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_ChunkSegmentMapping_SegmentId] ON [dbo].[ChunkSegmentMapping]
(
	[SegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UNIQ_ChunkId_StartByte]    Script Date: 30/01/2015 13:17:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UNIQ_ChunkId_StartByte] ON [dbo].[ChunkSegmentMapping]
(
	[ChunkId] ASC,
	[StartByte] ASC
)
INCLUDE ( 	[ActualByteCount],
	[LogicalByteCount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CacheLookup]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_CacheLookup] ON [dbo].[ExecutionCache]
(
	[ReportID] ASC,
	[ParamsHash] ASC,
	[AbsoluteExpiration] DESC
)
INCLUDE ( 	[SnapshotDataID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SnapshotDataID]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_SnapshotDataID] ON [dbo].[ExecutionCache]
(
	[SnapshotDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SegmentMetadata]    Script Date: 30/01/2015 13:17:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SegmentMetadata] ON [dbo].[Segment]
(
	[SegmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChunkId_SnapshotDataId]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_ChunkId_SnapshotDataId] ON [dbo].[SegmentedChunk]
(
	[ChunkId] ASC,
	[SnapshotDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UNIQ_SnapshotChunkMapping]    Script Date: 30/01/2015 13:17:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UNIQ_SnapshotChunkMapping] ON [dbo].[SegmentedChunk]
(
	[SnapshotDataId] ASC,
	[ChunkType] ASC,
	[ChunkName] ASC
)
INCLUDE ( 	[ChunkFlags],
	[ChunkId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_EditSessionID]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_EditSessionID] ON [dbo].[SessionData]
(
	[EditSessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SessionCleanup]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_SessionCleanup] ON [dbo].[SessionData]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SessionSnapshotID]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_SessionSnapshotID] ON [dbo].[SessionData]
(
	[SnapshotDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IS_SnapshotExpiration]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IS_SnapshotExpiration] ON [dbo].[SnapshotData]
(
	[PermanentRefcount] ASC,
	[ExpirationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SnapshotCleaning]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_SnapshotCleaning] ON [dbo].[SnapshotData]
(
	[PermanentRefcount] ASC,
	[TransientRefcount] ASC
)
INCLUDE ( 	[Machine]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cleanup]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_Cleanup] ON [dbo].[TempCatalog]
(
	[ExpirationTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataSetLinkID]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_DataSetLinkID] ON [dbo].[TempDataSets]
(
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataSourceItemID]    Script Date: 30/01/2015 13:17:43 ******/
CREATE NONCLUSTERED INDEX [IX_DataSourceItemID] ON [dbo].[TempDataSources]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExecutionCache] ADD  DEFAULT (getdate()) FOR [LastUsedTime]
GO
ALTER TABLE [dbo].[ExecutionCache] ADD  DEFAULT ((0)) FOR [ParamsHash]
GO
ALTER TABLE [dbo].[Segment] ADD  CONSTRAINT [DF_Segment_SegmentId]  DEFAULT (newsequentialid()) FOR [SegmentId]
GO
ALTER TABLE [dbo].[SegmentedChunk] ADD  CONSTRAINT [DF_SegmentedChunk_ChunkId]  DEFAULT (newsequentialid()) FOR [ChunkId]
GO
ALTER TABLE [dbo].[SessionData] ADD  DEFAULT ((0)) FOR [SiteZone]
GO
ALTER TABLE [dbo].[SessionLock] ADD  DEFAULT ((0)) FOR [LockVersion]
GO
ALTER TABLE [dbo].[SnapshotData] ADD  DEFAULT ((0)) FOR [IsCached]
GO
ALTER TABLE [dbo].[TempCatalog] ADD  DEFAULT ((0)) FOR [IntermediateIsPermanent]
GO
ALTER TABLE [dbo].[TempDataSets]  WITH NOCHECK ADD  CONSTRAINT [FK_DataSetItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[TempCatalog] ([TempCatalogID])
GO
ALTER TABLE [dbo].[TempDataSets] CHECK CONSTRAINT [FK_DataSetItemID]
GO
ALTER TABLE [dbo].[TempDataSources]  WITH NOCHECK ADD  CONSTRAINT [FK_DataSourceItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[TempCatalog] ([TempCatalogID])
GO
ALTER TABLE [dbo].[TempDataSources] CHECK CONSTRAINT [FK_DataSourceItemID]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]  WITH CHECK ADD  CONSTRAINT [Positive_ActualByteCount] CHECK  (([ActualByteCount]>=(0)))
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] CHECK CONSTRAINT [Positive_ActualByteCount]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]  WITH CHECK ADD  CONSTRAINT [Positive_LogicalByteCount] CHECK  (([LogicalByteCount]>=(0)))
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] CHECK CONSTRAINT [Positive_LogicalByteCount]
GO
ALTER TABLE [dbo].[ChunkSegmentMapping]  WITH CHECK ADD  CONSTRAINT [Positive_StartByte] CHECK  (([StartByte]>=(0)))
GO
ALTER TABLE [dbo].[ChunkSegmentMapping] CHECK CONSTRAINT [Positive_StartByte]
GO
USE [master]
GO
ALTER DATABASE [ReportServer$SQLDAW107TempDB] SET  READ_WRITE 
GO
