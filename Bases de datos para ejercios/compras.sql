USE [master]
GO
/****** Object:  Database [compras]    Script Date: 30/01/2015 13:12:11 ******/
CREATE DATABASE [compras]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'compras', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\compras.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'compras_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\compras_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [compras] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [compras].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [compras] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [compras] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [compras] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [compras] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [compras] SET ARITHABORT OFF 
GO
ALTER DATABASE [compras] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [compras] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [compras] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [compras] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [compras] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [compras] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [compras] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [compras] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [compras] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [compras] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [compras] SET  ENABLE_BROKER 
GO
ALTER DATABASE [compras] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [compras] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [compras] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [compras] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [compras] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [compras] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [compras] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [compras] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [compras] SET  MULTI_USER 
GO
ALTER DATABASE [compras] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [compras] SET DB_CHAINING OFF 
GO
ALTER DATABASE [compras] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [compras] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [compras]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 30/01/2015 13:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulos](
	[codigart] [char](6) NOT NULL,
	[descrart] [char](40) NOT NULL,
	[preunart] [decimal](9, 2) NOT NULL,
	[stockart] [int] NOT NULL,
	[stockmin] [int] NOT NULL,
	[fecbaja] [date] NULL,
 CONSTRAINT [id_art] PRIMARY KEY CLUSTERED 
(
	[codigart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lineas]    Script Date: 30/01/2015 13:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lineas](
	[numped] [int] NOT NULL,
	[numlin] [smallint] NOT NULL,
	[codigart] [char](6) NOT NULL,
	[unilin] [decimal](6, 0) NOT NULL,
	[preunlin] [decimal](9, 2) NOT NULL,
	[desculin] [decimal](4, 1) NOT NULL,
	[totallin]  AS (([preunlin]*[unilin])*((1)-[desculin]/(100.0))),
 CONSTRAINT [id_lin] PRIMARY KEY CLUSTERED 
(
	[numped] ASC,
	[numlin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 30/01/2015 13:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedidos](
	[numped] [int] NOT NULL,
	[fechaped] [date] NOT NULL DEFAULT (getdate()),
	[codigpro] [char](4) NOT NULL,
	[ivaped] [decimal](4, 1) NOT NULL,
	[fentrped] [date] NOT NULL,
 CONSTRAINT [id_ped] PRIMARY KEY CLUSTERED 
(
	[numped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 30/01/2015 13:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedores](
	[codigpro] [char](4) NOT NULL,
	[cifpro] [char](12) NOT NULL,
	[nombrpro] [char](30) NOT NULL,
	[direcpro] [char](30) NOT NULL,
	[cpostpro] [char](5) NOT NULL,
	[localpro] [char](20) NOT NULL,
	[telefpro] [char](17) NOT NULL,
	[faxpro] [char](17) NULL,
	[emailpro] [char](25) NULL,
	[procepro] [char](5) NOT NULL,
 CONSTRAINT [id_pro] PRIMARY KEY CLUSTERED 
(
	[codigpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [u_cif] UNIQUE NONCLUSTERED 
(
	[cifpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resumen]    Script Date: 30/01/2015 13:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resumen](
	[codigart] [char](6) NOT NULL,
	[descrart] [char](40) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resumen1]    Script Date: 30/01/2015 13:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resumen1](
	[codigart] [char](6) NOT NULL,
	[descrart] [char](40) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[EncabezadoPedido]    Script Date: 30/01/2015 13:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EncabezadoPedido]
AS
SELECT dbo.Pedidos.numped, dbo.Pedidos.fechaped, dbo.Pedidos.codigpro, dbo.Pedidos.ivaped, dbo.Pedidos.fentrped, dbo.Proveedores.nombrpro, dbo.Proveedores.direcpro, dbo.Proveedores.cpostpro, dbo.Proveedores.localpro, dbo.Proveedores.telefpro, dbo.Proveedores.faxpro,
dbo.Proveedores.procepro, dbo.Proveedores.emailpro, dbo.Proveedores.cifpro
FROM dbo.Proveedores INNER JOIN
dbo.Pedidos ON dbo.Proveedores.codigpro = dbo.Pedidos.codigpro
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FK_LineasArt]    Script Date: 30/01/2015 13:12:11 ******/
CREATE NONCLUSTERED INDEX [FK_LineasArt] ON [dbo].[Lineas]
(
	[codigart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_LineasPed]    Script Date: 30/01/2015 13:12:11 ******/
CREATE NONCLUSTERED INDEX [FK_LineasPed] ON [dbo].[Lineas]
(
	[numped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FK_prop]    Script Date: 30/01/2015 13:12:11 ******/
CREATE NONCLUSTERED INDEX [FK_prop] ON [dbo].[Pedidos]
(
	[codigpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Lineas]  WITH CHECK ADD  CONSTRAINT [f_art] FOREIGN KEY([codigart])
REFERENCES [dbo].[Articulos] ([codigart])
GO
ALTER TABLE [dbo].[Lineas] CHECK CONSTRAINT [f_art]
GO
ALTER TABLE [dbo].[Lineas]  WITH CHECK ADD  CONSTRAINT [f_ped] FOREIGN KEY([numped])
REFERENCES [dbo].[Pedidos] ([numped])
GO
ALTER TABLE [dbo].[Lineas] CHECK CONSTRAINT [f_ped]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [f_pro] FOREIGN KEY([codigpro])
REFERENCES [dbo].[Proveedores] ([codigpro])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [f_pro]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD CHECK  (([stockart]>=(0)))
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD CHECK  (([stockmin]>=(0)))
GO
ALTER TABLE [dbo].[Lineas]  WITH CHECK ADD CHECK  (([desculin]>=(0) AND [desculin]<=(100)))
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [c_fecha] CHECK  (([fechaped]<=[fentrped]))
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [c_fecha]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD CHECK  (([ivaped]>(0) AND [ivaped]<(100)))
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD CHECK  (([cpostpro] like '[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD CHECK  (([procepro]='No UE' OR [procepro]='UE'))
GO
USE [master]
GO
ALTER DATABASE [compras] SET  READ_WRITE 
GO
