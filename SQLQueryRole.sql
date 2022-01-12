USE [master]
GO

/****** Object:  Database [db_role_kovalchuk]    Script Date: 24.02.2020 22:49:22 ******/
CREATE DATABASE [db_role_kovalchuk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_role_kovalchuk', FILENAME = N'/var/opt/mssql/data/db_role_kovalchuk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_role_kovalchuk_log', FILENAME = N'/var/opt/mssql/data/db_role_kovalchuk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_role_kovalchuk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [db_role_kovalchuk] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET ARITHABORT OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [db_role_kovalchuk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [db_role_kovalchuk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET  DISABLE_BROKER 
GO

ALTER DATABASE [db_role_kovalchuk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [db_role_kovalchuk] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET RECOVERY FULL 
GO

ALTER DATABASE [db_role_kovalchuk] SET  MULTI_USER 
GO

ALTER DATABASE [db_role_kovalchuk] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [db_role_kovalchuk] SET DB_CHAINING OFF 
GO

ALTER DATABASE [db_role_kovalchuk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [db_role_kovalchuk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [db_role_kovalchuk] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [db_role_kovalchuk] SET QUERY_STORE = OFF
GO

ALTER DATABASE [db_role_kovalchuk] SET  READ_WRITE 
GO



USE db_role_kovalchuk;
CREATE LOGIN nastya WITH PASSWORD = '1111Nastya';
CREATE USER nastya FOR LOGIN nastya;

CREATE LOGIN nastya_2 WITH PASSWORD = '1112Nastya';
CREATE USER nastya_2 FOR LOGIN nastya_2;

CREATE LOGIN nastya_3 WITH PASSWORD = '1113Nastya';
CREATE USER nastya_3 FOR LOGIN nastya_3;


CREATE ROLE nastya_role AUTHORIZATION nastya;
ALTER ROLE nastya_role ADD MEMBER nastya_2;
ALTER ROLE nastya_role ADD MEMBER nastya_3;

CREATE ROLE nastya_role_2 AUTHORIZATION nastya;
ALTER ROLE nastya_role ADD MEMBER nastya_2;
ALTER ROLE nastya_role ADD MEMBER nastya_3;

GRANT SELECT  TO  nastya_role;
REVOKE UPDATE FROM nastya_role;
REVOKE CREATE TABLE FROM nastya_role;


GRANT EXEC sp_addrolemember db_role_kovalchuk, N'ReadOnlyUser'  TO  nastya_role_2;
/*
CREATE LOGIN [DESKTOP-6TFM4S0\Anastasia]
    FROM WINDOWS  
    WITH DEFAULT_DATABASE = [db_role_kovalchuk];  
	GO

	CREATE USER [Anastasia] FOR LOGIN [DESKTOP-6TFM4S0\Anastasia];  
	GO




DROP ROLE nastya_role;

DROP USER nastya;

DROP LOGIN  nastya ;
*/

