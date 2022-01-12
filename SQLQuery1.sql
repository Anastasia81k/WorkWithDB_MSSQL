USE [master]
GO

/****** Object:  Database [PIS_pz_3_5]    Script Date: 24.04.2020 09:59:41 ******/
CREATE DATABASE [PIS_pz_3_5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PIS_pz_3_5', FILENAME = N'/var/opt/mssql/data/PIS_pz_3_5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PIS_pz_3_5_log', FILENAME = N'/var/opt/mssql/data/PIS_pz_3_5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PIS_pz_3_5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [PIS_pz_3_5] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET ARITHABORT OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [PIS_pz_3_5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [PIS_pz_3_5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET  DISABLE_BROKER 
GO

ALTER DATABASE [PIS_pz_3_5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [PIS_pz_3_5] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET RECOVERY FULL 
GO

ALTER DATABASE [PIS_pz_3_5] SET  MULTI_USER 
GO

ALTER DATABASE [PIS_pz_3_5] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [PIS_pz_3_5] SET DB_CHAINING OFF 
GO

ALTER DATABASE [PIS_pz_3_5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [PIS_pz_3_5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [PIS_pz_3_5] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [PIS_pz_3_5] SET QUERY_STORE = OFF
GO

ALTER DATABASE [PIS_pz_3_5] SET  READ_WRITE 
GO


USE PIS_pz_3_5;

CREATE TABLE Cadet
	( id_cadet INT NOT NULL IDENTITY,
	  cadet_name VARCHAR(30) NOT NULL,
	  cadet_surname VARCHAR(30) NOT NULL,
	  phone INT NOT NULL,
	  CONSTRAINT id_cadet_pk PRIMARY KEY(id_cadet));
GO

INSERT INTO Cadet ( cadet_name, cadet_surname, phone ) VALUES ( 'Nastya', 'Kovalchuk', 0987135303);

SELECT * FROM Cadet;





CREATE DATABASE js COLLATE Cyrillic_General_CI_AS;
USE js;

CREATE TABLE Cadet
	( id_cadet INT NOT NULL IDENTITY,
	  cadet_name VARCHAR(30) NOT NULL,
	  cadet_surname VARCHAR(30) NOT NULL,
	  phone INT NOT NULL,
	  CONSTRAINT id_cadet_pk PRIMARY KEY(id_cadet));
GO

INSERT INTO Cadet ( cadet_name, cadet_surname, phone ) VALUES ( 'Nastya', 'Kovalchuk', 0987135303);

SELECT * FROM Cadet;
