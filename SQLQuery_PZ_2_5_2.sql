USE [master]
GO

/****** Object:  Database [CyprusBank]    Script Date: 19.03.2020 00:28:08 ******/
CREATE DATABASE [CyprusBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CyprusBank', FILENAME = N'/var/opt/mssql/data/CyprusBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CyprusBank_log', FILENAME = N'/var/opt/mssql/data/CyprusBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CyprusBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [CyprusBank] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [CyprusBank] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [CyprusBank] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [CyprusBank] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [CyprusBank] SET ARITHABORT OFF 
GO

ALTER DATABASE [CyprusBank] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [CyprusBank] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [CyprusBank] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [CyprusBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [CyprusBank] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [CyprusBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [CyprusBank] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [CyprusBank] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [CyprusBank] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [CyprusBank] SET  DISABLE_BROKER 
GO

ALTER DATABASE [CyprusBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [CyprusBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [CyprusBank] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [CyprusBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [CyprusBank] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [CyprusBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [CyprusBank] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [CyprusBank] SET RECOVERY FULL 
GO

ALTER DATABASE [CyprusBank] SET  MULTI_USER 
GO

ALTER DATABASE [CyprusBank] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [CyprusBank] SET DB_CHAINING OFF 
GO

ALTER DATABASE [CyprusBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [CyprusBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [CyprusBank] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [CyprusBank] SET QUERY_STORE = OFF
GO

ALTER DATABASE [CyprusBank] SET  READ_WRITE 
GO


USE CyprusBank;
CREATE TABLE UserBank(
	id_user INT NOT NULL IDENTITY,
	surname_user VARCHAR(30) NOT NULL,
	name_user VARCHAR(30) NOT NULL,
	patronymic VARCHAR(30) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone INT,
	CONSTRAINT id_user_pk PRIMARY KEY(id_user));

CREATE TABLE UserAccount(
	id_account INT NOT NULL IDENTITY,
	number_card INT NOT NULL,
	type_card VARCHAR(30) NOT NULL,
	sum_onCard DECIMAL(5,2) NOT NULL,
	currency VARCHAR(30) NOT NULL,



	user_id INT NOT NULL,
	CONSTRAINT id_account_pk PRIMARY KEY(id_account));

	INSERT INTO UserBank (surname_user, name_user, patronymic, address,phone ) VALUES ('���������','��������','�������','�. ���, ���.��������� 45/1', 0987135303);

ALTER TABLE UserAccount ADD  CONSTRAINT id_user_fk FOREIGN KEY (user_id)
        REFERENCES UserBank (id_user)
        ON DELETE CASCADE
        ON UPDATE CASCADE;


	CREATE TRIGGER t_sum ON UserAccount
	FOR INSERT 
	AS
		IF EXISTS (SELECT sum_onCard

		CREATE FUNCTION GetSum (@user_id)
		RETURN numeric(10,2)
		BEGIN
			DECLARE @summ numeric(10,2)
			SELECT @summ = sum_onCard 




			SELECT * FROM UserBank;
			SELECT * FROM UserAccount;