USE [master]
GO
/****** Object:  Database [nba]    Script Date: 30/01/2015 13:14:17 ******/
CREATE DATABASE [nba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\nba.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'nba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\nba_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [nba] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nba] SET ARITHABORT OFF 
GO
ALTER DATABASE [nba] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [nba] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [nba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nba] SET  ENABLE_BROKER 
GO
ALTER DATABASE [nba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [nba] SET  MULTI_USER 
GO
ALTER DATABASE [nba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nba] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [nba]
GO
/****** Object:  Table [dbo].[equipos]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[equipos](
	[Nombre] [varchar](20) NOT NULL,
	[Ciudad] [varchar](20) NULL DEFAULT (NULL),
	[Conferencia] [varchar](4) NULL DEFAULT (NULL),
	[Division] [varchar](9) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estadisticas]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estadisticas](
	[temporada] [varchar](5) NOT NULL,
	[jugador] [int] NOT NULL,
	[Puntos_por_partido] [float] NULL DEFAULT (NULL),
	[Asistencias_por_partido] [float] NULL DEFAULT (NULL),
	[Tapones_por_partido] [float] NULL DEFAULT (NULL),
	[Rebotes_por_partido] [float] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[temporada] ASC,
	[jugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jugadores]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jugadores](
	[codigo] [int] NOT NULL,
	[Nombre] [varchar](30) NULL DEFAULT (NULL),
	[Procedencia] [varchar](20) NULL DEFAULT (NULL),
	[Altura] [varchar](4) NULL DEFAULT (NULL),
	[Peso] [int] NULL DEFAULT (NULL),
	[Posicion] [varchar](5) NULL DEFAULT (NULL),
	[Nombre_equipo] [varchar](20) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[partidos]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[partidos](
	[codigo] [int] NOT NULL,
	[equipo_local] [varchar](20) NULL DEFAULT (NULL),
	[equipo_visitante] [varchar](20) NULL DEFAULT (NULL),
	[puntos_local] [int] NULL DEFAULT (NULL),
	[puntos_visitante] [int] NULL DEFAULT (NULL),
	[temporada] [varchar](5) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[jugadores_lakers]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[jugadores_lakers] AS 
SELECT nombre , Nombre_equipo 
FROM jugadores
WHERE Nombre_equipo LIKE'Lakers' WITH CHECK OPTION;

GO
/****** Object:  View [dbo].[vista_jugadores_lakers]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista_jugadores_lakers] AS SELECT nombre FROM jugadores_lakers;


GO
/****** Object:  View [dbo].[cuartaVista_jugadores]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[cuartaVista_jugadores] AS 
SELECT jugadores. nombre , Estadisticas.Puntos_por_partido
FROM jugadores
INNER JOIN estadisticas ON jugadores.codigo = Estadisticas.jugador AND
Estadisticas.Puntos_por_partido > (SELECT AVG(Puntos_por_partido) FROM estadisticas);




GO
/****** Object:  View [dbo].[primeraVista_jugadores]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[primeraVista_jugadores] AS 
SELECT codigo, nombre , Nombre_equipo , Altura
FROM jugadores;


GO
/****** Object:  View [dbo].[quintaVista_jugadores]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[quintaVista_jugadores] AS 
SELECT b.nombre , a.Puntos_por_partido, a.jugador
FROM estadisticas a, jugadores b
WHERE Puntos_por_partido >= (SELECT AVG(Puntos_por_partido) FROM estadisticas) and b.codigo = a.jugador;

GO
/****** Object:  View [dbo].[segundaVista_jugadores]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[segundaVista_jugadores] AS 
SELECT codigo, nombre , Nombre_equipo
FROM jugadores;



GO
/****** Object:  View [dbo].[terceraVista_jugadores]    Script Date: 30/01/2015 13:14:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[terceraVista_jugadores] AS 
SELECT jugadores.codigo,jugadores. nombre , Estadisticas.Puntos_por_partido
FROM jugadores
INNER JOIN estadisticas ON jugadores.codigo = Estadisticas.jugador;




GO
ALTER TABLE [dbo].[estadisticas]  WITH CHECK ADD FOREIGN KEY([jugador])
REFERENCES [dbo].[jugadores] ([codigo])
GO
ALTER TABLE [dbo].[jugadores]  WITH CHECK ADD FOREIGN KEY([Nombre_equipo])
REFERENCES [dbo].[equipos] ([Nombre])
GO
ALTER TABLE [dbo].[partidos]  WITH CHECK ADD FOREIGN KEY([equipo_local])
REFERENCES [dbo].[equipos] ([Nombre])
GO
ALTER TABLE [dbo].[partidos]  WITH CHECK ADD FOREIGN KEY([equipo_visitante])
REFERENCES [dbo].[equipos] ([Nombre])
GO
USE [master]
GO
ALTER DATABASE [nba] SET  READ_WRITE 
GO
