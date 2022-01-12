USE [master]
GO

/****** Object:  Database [db_role]    Script Date: 17.03.2020 23:24:23 ******/
CREATE DATABASE [db_role]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_role', FILENAME = N'/var/opt/mssql/data/db_role.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_role_log', FILENAME = N'/var/opt/mssql/data/db_role_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_role].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [db_role] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [db_role] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [db_role] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [db_role] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [db_role] SET ARITHABORT OFF 
GO

ALTER DATABASE [db_role] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [db_role] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [db_role] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [db_role] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [db_role] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [db_role] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [db_role] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [db_role] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [db_role] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [db_role] SET  DISABLE_BROKER 
GO

ALTER DATABASE [db_role] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [db_role] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [db_role] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [db_role] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [db_role] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [db_role] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [db_role] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [db_role] SET RECOVERY FULL 
GO

ALTER DATABASE [db_role] SET  MULTI_USER 
GO

ALTER DATABASE [db_role] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [db_role] SET DB_CHAINING OFF 
GO

ALTER DATABASE [db_role] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [db_role] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [db_role] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [db_role] SET QUERY_STORE = OFF
GO

ALTER DATABASE [db_role] SET  READ_WRITE 
GO


USE db_role;
GO


CREATE SCHEMA Role;  
GO
CREATE TABLE Role.kursant
	( id_kursant INT NOT NULL IDENTITY,
	  kadet_name VARCHAR(30) NOT NULL,
	  kadet_surname VARCHAR(30) NOT NULL,
	  phone INT NOT NULL,
	  email VARCHAR(50)
	  CONSTRAINT id_kursant_pk PRIMARY KEY(id_kursant));
GO

INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Георгій ', 'Білявський', 0998845672, 'georg@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Руслан', 'Лучейко', 0884569658, 'ruslan@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Валерій', 'Михайлов', 0753368856, 'valera@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Андрій', 'Шевчук', 0753368856, 'andriy@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Микола', 'Шевчук', 0753888856, 'mikola@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Олександра', 'Савенок', 0669998565, 'alex@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Олександра', 'Савенок', 0669998565, 'alex@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Влад', 'Бринза', 0996856988, 'vlad@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Максим', 'Харченко', 0996856988, 'vax@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Коля', 'Снітко', 0996856988, 'ko@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'ОЛександр', 'Гречуха', 0996856988, 'alexandr@gmail.com');
INSERT INTO Role.kursant (  kadet_name, kadet_surname, phone, email) VALUES ( 'Анна', 'Гречуха', 0996856988, 'alexandr@gmail.com');


CREATE LOGIN ANASTASIA WITH PASSWORD ='1234Nastya';
CREATE USER ANASTASIAUSER FOR LOGIN ANASTASIA;

CREATE LOGIN ANASTASIA1 WITH PASSWORD ='1234Nastya';
CREATE USER ANASTASIAUSER_1 FOR LOGIN ANASTASIA1;

CREATE ROLE ANASTASIA_ROLE;
ALTER ROLE ANASTASIA_ROLE ADD MEMBER ANASTASIAUSER;
ALTER ROLE ANASTASIA_ROLE ADD MEMBER ANASTASIAUSER_1;
GRANT ALTER ON DATABASE::db_role TO ANASTASIA_ROLE;
GRANT SELECT ON OBJECT::Role.kursant TO ANASTASIA_ROLE;
REVOKE CREATE TABLE TO ANASTASIA_ROLE;
REVOKE UPDATE ON OBJECT::Role.kursant TO ANASTASIA_ROLE;


CREATE LOGIN NASTY WITH PASSWORD = '1234Nastya';
CREATE USER nasty_user FOR LOGIN NASTY WITH DEFAULT_SCHEMA = Role;
CREATE ROLE NastyRole;
ALTER ROLE NastyRole ADD MEMBER nasty_user;
GRANT CONTROL ON DATABASE::db_role TO NastyRole;
GRANT UPDATE ON DATABASE::db_role TO NastyRole;




CREATE LOGIN NAS WITH PASSWORD = '1234Nastya';
CREATE USER nas_user FOR LOGIN NAS;
---CREATE SERVER ROLE NasRole AUTHORIZATION NAS;
---DENY CONTROL ON DATABASE::db_role TO NasRole;
---DROP SERVER ROLE NasRole;
CREATE ROLE NasRole;
DENY CONTROL ON DATABASE::db_role TO NasRole;





