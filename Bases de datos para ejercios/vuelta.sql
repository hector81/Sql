USE [master]
GO
/****** Object:  Database [vuelta]    Script Date: 30/01/2015 13:18:17 ******/
CREATE DATABASE [vuelta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vuelta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\vuelta.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'vuelta_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\vuelta_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [vuelta] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vuelta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vuelta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vuelta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vuelta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vuelta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vuelta] SET ARITHABORT OFF 
GO
ALTER DATABASE [vuelta] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [vuelta] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [vuelta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vuelta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vuelta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vuelta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vuelta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vuelta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vuelta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vuelta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vuelta] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vuelta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vuelta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vuelta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vuelta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vuelta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vuelta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vuelta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vuelta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vuelta] SET  MULTI_USER 
GO
ALTER DATABASE [vuelta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vuelta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vuelta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vuelta] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [vuelta]
GO
/****** Object:  Table [dbo].[ciclista]    Script Date: 30/01/2015 13:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ciclista](
	[dorsal] [int] NOT NULL,
	[nombre] [varchar](35) NULL,
	[edad] [int] NULL,
	[nomequipo] [varchar](20) NULL,
 CONSTRAINT [cp_ciclista] PRIMARY KEY CLUSTERED 
(
	[dorsal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[equipo]    Script Date: 30/01/2015 13:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[equipo](
	[nomequipo] [varchar](20) NOT NULL,
	[director] [varchar](35) NULL,
 CONSTRAINT [cp_equipo] PRIMARY KEY CLUSTERED 
(
	[nomequipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[etapa]    Script Date: 30/01/2015 13:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[etapa](
	[numetapa] [int] NOT NULL,
	[kms] [int] NULL,
	[salida] [varchar](40) NULL,
	[llegada] [varchar](40) NULL,
	[dorsal] [int] NULL,
 CONSTRAINT [cp_etapa] PRIMARY KEY CLUSTERED 
(
	[numetapa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lleva]    Script Date: 30/01/2015 13:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lleva](
	[dorsal] [int] NULL,
	[numetapa] [int] NOT NULL,
	[codigo] [varchar](3) NOT NULL,
 CONSTRAINT [cp_lleva] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC,
	[numetapa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[maillot]    Script Date: 30/01/2015 13:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[maillot](
	[codigo] [varchar](3) NOT NULL,
	[tipo] [varchar](20) NULL,
	[color] [varchar](20) NULL,
	[premio] [int] NULL,
 CONSTRAINT [cp_maillot] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[puerto]    Script Date: 30/01/2015 13:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[puerto](
	[nompuerto] [varchar](35) NOT NULL,
	[altura] [int] NULL,
	[categoria] [varchar](1) NULL,
	[pendiente] [decimal](6, 2) NULL,
	[numetapa] [int] NULL,
	[dorsal] [int] NULL,
 CONSTRAINT [cp_puerto] PRIMARY KEY CLUSTERED 
(
	[nompuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ciclista]  WITH CHECK ADD  CONSTRAINT [ca_cicl_equipo] FOREIGN KEY([nomequipo])
REFERENCES [dbo].[equipo] ([nomequipo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ciclista] CHECK CONSTRAINT [ca_cicl_equipo]
GO
ALTER TABLE [dbo].[etapa]  WITH CHECK ADD  CONSTRAINT [ca_etapa_cicl] FOREIGN KEY([dorsal])
REFERENCES [dbo].[ciclista] ([dorsal])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[etapa] CHECK CONSTRAINT [ca_etapa_cicl]
GO
ALTER TABLE [dbo].[lleva]  WITH CHECK ADD  CONSTRAINT [ca_lleva_cicl] FOREIGN KEY([dorsal])
REFERENCES [dbo].[ciclista] ([dorsal])
GO
ALTER TABLE [dbo].[lleva] CHECK CONSTRAINT [ca_lleva_cicl]
GO
ALTER TABLE [dbo].[lleva]  WITH CHECK ADD  CONSTRAINT [ca_lleva_etapa] FOREIGN KEY([numetapa])
REFERENCES [dbo].[etapa] ([numetapa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lleva] CHECK CONSTRAINT [ca_lleva_etapa]
GO
ALTER TABLE [dbo].[lleva]  WITH CHECK ADD  CONSTRAINT [ca_lleva_maill] FOREIGN KEY([codigo])
REFERENCES [dbo].[maillot] ([codigo])
GO
ALTER TABLE [dbo].[lleva] CHECK CONSTRAINT [ca_lleva_maill]
GO
ALTER TABLE [dbo].[puerto]  WITH CHECK ADD  CONSTRAINT [ca_puerto_cicl] FOREIGN KEY([dorsal])
REFERENCES [dbo].[ciclista] ([dorsal])
GO
ALTER TABLE [dbo].[puerto] CHECK CONSTRAINT [ca_puerto_cicl]
GO
ALTER TABLE [dbo].[puerto]  WITH CHECK ADD  CONSTRAINT [ca_puerto_etapa] FOREIGN KEY([numetapa])
REFERENCES [dbo].[etapa] ([numetapa])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[puerto] CHECK CONSTRAINT [ca_puerto_etapa]
GO
USE [master]
GO
ALTER DATABASE [vuelta] SET  READ_WRITE 
GO
