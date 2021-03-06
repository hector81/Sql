USE [master]
GO
/****** Object:  Database [jardineria]    Script Date: 30/01/2015 13:13:20 ******/
CREATE DATABASE [jardineria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jardineria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\jardineria.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'jardineria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\jardineria_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [jardineria] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jardineria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jardineria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jardineria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jardineria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jardineria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jardineria] SET ARITHABORT OFF 
GO
ALTER DATABASE [jardineria] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [jardineria] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [jardineria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jardineria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jardineria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jardineria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jardineria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jardineria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jardineria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jardineria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jardineria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [jardineria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jardineria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jardineria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jardineria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jardineria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jardineria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jardineria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jardineria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [jardineria] SET  MULTI_USER 
GO
ALTER DATABASE [jardineria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jardineria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jardineria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jardineria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [jardineria]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[CodigoCliente] [int] NOT NULL,
	[NombreCliente] [varchar](50) NOT NULL,
	[NombreContacto] [varchar](30) NULL DEFAULT (NULL),
	[ApellidoContacto] [varchar](30) NULL DEFAULT (NULL),
	[Telefono] [varchar](15) NOT NULL,
	[Fax] [varchar](15) NOT NULL,
	[LineaDireccion1] [varchar](50) NOT NULL,
	[LineaDireccion2] [varchar](50) NULL DEFAULT (NULL),
	[Ciudad] [varchar](50) NOT NULL,
	[Region] [varchar](50) NULL DEFAULT (NULL),
	[Pais] [varchar](50) NULL DEFAULT (NULL),
	[CodigoPostal] [varchar](10) NULL DEFAULT (NULL),
	[CodigoEmpleadoRepVentas] [int] NULL DEFAULT (NULL),
	[LimiteCredito] [numeric](15, 2) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[CodigoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetallePedidos]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetallePedidos](
	[CodigoPedido] [int] NOT NULL,
	[CodigoProducto] [varchar](15) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnidad] [numeric](15, 2) NOT NULL,
	[NumeroLinea] [smallint] NOT NULL,
	[IVA] [numeric](18, 0) NULL,
	[TotalLinea] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoPedido] ASC,
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpBarcelona]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmpBarcelona](
	[CodigoEmpleado] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NULL,
	[Extension] [varchar](10) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CodigoOficina] [varchar](10) NOT NULL,
	[CodigoJefe] [int] NULL,
	[Puesto] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[CodigoEmpleado] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NULL DEFAULT (NULL),
	[Extension] [varchar](10) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CodigoOficina] [varchar](10) NOT NULL,
	[CodigoJefe] [int] NULL DEFAULT (NULL),
	[Puesto] [varchar](50) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[CodigoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpRepVentasSinClientes]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmpRepVentasSinClientes](
	[CodigoEmpleado] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NULL,
	[Extension] [varchar](10) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CodigoOficina] [varchar](10) NOT NULL,
	[CodigoJefe] [int] NULL,
	[Puesto] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[España]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[España](
	[CodigoOficina] [varchar](10) NOT NULL,
	[Ciudad] [varchar](30) NOT NULL,
	[Pais] [varchar](50) NOT NULL,
	[Region] [varchar](50) NULL,
	[CodigoPostal] [varchar](10) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[LineaDireccion1] [varchar](50) NOT NULL,
	[LineaDireccion2] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GamasProductos]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GamasProductos](
	[Gama] [varchar](50) NOT NULL,
	[DescripcionTexto] [text] NULL,
	[DescripcionHTML] [text] NULL,
	[Imagen] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[Gama] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NuevosPedidos]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NuevosPedidos](
	[CodigoPedido] [int] NOT NULL,
	[FechaPedido] [date] NOT NULL,
	[FechaEsperada] [date] NOT NULL,
	[FechaEntrega] [date] NULL,
	[Estado] [varchar](15) NOT NULL,
	[Comentarios] [text] NULL,
	[CodigoCliente] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Oficinas]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Oficinas](
	[CodigoOficina] [varchar](10) NOT NULL,
	[Ciudad] [varchar](30) NOT NULL,
	[Pais] [varchar](50) NOT NULL,
	[Region] [varchar](50) NULL DEFAULT (NULL),
	[CodigoPostal] [varchar](10) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[LineaDireccion1] [varchar](50) NOT NULL,
	[LineaDireccion2] [varchar](50) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[CodigoOficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pagos](
	[CodigoCliente] [int] NOT NULL,
	[FormaPago] [varchar](40) NOT NULL,
	[IDTransaccion] [varchar](50) NOT NULL,
	[FechaPago] [date] NOT NULL,
	[Cantidad] [numeric](15, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoCliente] ASC,
	[IDTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedidos](
	[CodigoPedido] [int] NOT NULL,
	[FechaPedido] [date] NOT NULL,
	[FechaEsperada] [date] NOT NULL,
	[FechaEntrega] [date] NULL DEFAULT (NULL),
	[Estado] [varchar](15) NOT NULL,
	[Comentarios] [text] NULL,
	[CodigoCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[CodigoProducto] [varchar](15) NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[Gama] [varchar](50) NOT NULL,
	[Dimensiones] [varchar](25) NULL,
	[Proveedor] [varchar](50) NULL DEFAULT (NULL),
	[Descripcion] [text] NULL,
	[CantidadEnStock] [smallint] NOT NULL,
	[PrecioVenta] [numeric](15, 2) NOT NULL,
	[PrecioProveedor] [numeric](15, 2) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[primeraVista_ClientesPedidos]    Script Date: 30/01/2015 13:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[primeraVista_ClientesPedidos] AS 
SELECT Clientes.NombreCliente ,DetallePedidos.CodigoPedido, SUM(CANTIDAD*PrecioUnidad)
 AS Total
FROM Clientes
INNER JOIN Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
INNER JOIN DetallePedidos ON DetallePedidos.CodigoPedido = Pedidos.CodigoPedido 
GROUP BY Clientes.NombreCliente,DetallePedidos.CodigoPedido;
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [Clientes_EmpleadosFK] FOREIGN KEY([CodigoEmpleadoRepVentas])
REFERENCES [dbo].[Empleados] ([CodigoEmpleado])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [Clientes_EmpleadosFK]
GO
ALTER TABLE [dbo].[DetallePedidos]  WITH CHECK ADD  CONSTRAINT [DetallePedidos_PedidoFK] FOREIGN KEY([CodigoPedido])
REFERENCES [dbo].[Pedidos] ([CodigoPedido])
GO
ALTER TABLE [dbo].[DetallePedidos] CHECK CONSTRAINT [DetallePedidos_PedidoFK]
GO
ALTER TABLE [dbo].[DetallePedidos]  WITH CHECK ADD  CONSTRAINT [DetallePedidos_ProductoFK] FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[Productos] ([CodigoProducto])
GO
ALTER TABLE [dbo].[DetallePedidos] CHECK CONSTRAINT [DetallePedidos_ProductoFK]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [Empleados_EmpleadosFK] FOREIGN KEY([CodigoJefe])
REFERENCES [dbo].[Empleados] ([CodigoEmpleado])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [Empleados_EmpleadosFK]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [Empleados_OficinasFK] FOREIGN KEY([CodigoOficina])
REFERENCES [dbo].[Oficinas] ([CodigoOficina])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [Empleados_OficinasFK]
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD  CONSTRAINT [Pagos_clienteFK] FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[Clientes] ([CodigoCliente])
GO
ALTER TABLE [dbo].[Pagos] CHECK CONSTRAINT [Pagos_clienteFK]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [Pedidos_Cliente] FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[Clientes] ([CodigoCliente])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [Pedidos_Cliente]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [Productos_gamaFK] FOREIGN KEY([Gama])
REFERENCES [dbo].[GamasProductos] ([Gama])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [Productos_gamaFK]
GO
USE [master]
GO
ALTER DATABASE [jardineria] SET  READ_WRITE 
GO
