USE [master]
GO
/****** Object:  Database [compras1]    Script Date: 30/01/2015 13:12:47 ******/
CREATE DATABASE [compras1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'compras1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\compras1.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'compras1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLDAW107\MSSQL\DATA\compras1_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [compras1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [compras1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [compras1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [compras1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [compras1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [compras1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [compras1] SET ARITHABORT OFF 
GO
ALTER DATABASE [compras1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [compras1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [compras1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [compras1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [compras1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [compras1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [compras1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [compras1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [compras1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [compras1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [compras1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [compras1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [compras1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [compras1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [compras1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [compras1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [compras1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [compras1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [compras1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [compras1] SET  MULTI_USER 
GO
ALTER DATABASE [compras1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [compras1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [compras1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [compras1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [compras1] SET  READ_WRITE 
GO
