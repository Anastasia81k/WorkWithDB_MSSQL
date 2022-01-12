USE [master]
GO

/****** Object:  Database [pz_2_5_kovalchuk]    Script Date: 18.03.2020 23:35:12 ******/
CREATE DATABASE [pz_2_5_kovalchuk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pz_2_5_kovalchuk', FILENAME = N'/var/opt/mssql/data/pz_2_5_kovalchuk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pz_2_5_kovalchuk_log', FILENAME = N'/var/opt/mssql/data/pz_2_5_kovalchuk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pz_2_5_kovalchuk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET ARITHABORT OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET  DISABLE_BROKER 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET RECOVERY FULL 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET  MULTI_USER 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET DB_CHAINING OFF 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET QUERY_STORE = OFF
GO

ALTER DATABASE [pz_2_5_kovalchuk] SET  READ_WRITE 
GO


USE pz_2_5_kovalchuk;
CREATE TABLE ExchangeRate(
	id_currency INT NOT NULL IDENTITY,
	назва_валюти VARCHAR(30) NOT NULL,
	current_rate_dol DECIMAL(5,2),
	 CONSTRAINT id_kursant_pk PRIMARY KEY(id_currency));

CREATE TABLE ExchangeRate_NEW(
	id_currency INT NOT NULL IDENTITY,
	назва_валюти VARCHAR(30) NOT NULL,
	current_rate_dol DECIMAL(5,2),
	created_date DATE NOT NULL DEFAULT GETDATE(),
	 CONSTRAINT id_kursant_pk1 PRIMARY KEY(id_currency));

INSERT INTO ExchangeRate (назва_валюти, current_rate_dol) VALUES('євро', 1.09);
INSERT INTO ExchangeRate (назва_валюти, current_rate_dol) VALUES('гривня', 0.04);
INSERT INTO ExchangeRate (назва_валюти, current_rate_dol) VALUES('рубль', 0.01);

SELECT * FROM ExchangeRate;


CREATE PROCEDURE dol_proc (@dol DECIMAL(5,2), @cur VARCHAR(30))
AS
	BEGIN
	UPDATE ExchangeRate SET current_rate_dol = @dol WHERE  назва_валюти =  @cur
	END


EXECUTE dol_proc 1.20, 'гривня';
SELECT * FROM ExchangeRate;



CREATE TRIGGER upd_tr ON ExchangeRate
AFTER UPDATE 
AS
	BEGIN
		DECLARE @old_назва_валюти VARCHAR(30)
		DECLARE @new_current_rate_dol DECIMAL(5,2)
		IF @@ROWCOUNT= 0
		RETURN

		SELECT @old_назва_валюти = (SELECT назва_валюти FROM deleted )
		SELECT @new_current_rate_dol =(SELECT current_rate_dol FROM inserted)
		INSERT INTO ExchangeRate_NEW (назва_валюти, current_rate_dol, created_date) VALUES (@old_назва_валюти,  @new_current_rate_dol, GETDATE() )
	END

SELECT * FROM ExchangeRate_NEW;



	
