USE [master]
GO

/****** Object:  Database [db_kovalchuk_271_pz1_5]    Script Date: 10.02.2020 22:33:15 ******/
CREATE DATABASE [db_kovalchuk_271_pz1_5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_kovalchuk(1)', FILENAME = N'/var/opt/mssql/data/db_kovalchuk(1).mdf' , SIZE = 10240KB , MAXSIZE = 51200KB , FILEGROWTH = 1024KB ),
( NAME = N'db_kovalchuk(2)', FILENAME = N'/var/opt/mssql/data/db_kovalchuk(2).ndf' , SIZE = 10240KB , MAXSIZE = 51200KB , FILEGROWTH = 1024KB ),
( NAME = N'db_kovalchuk(3)', FILENAME = N'/var/opt/mssql/data/db_kovalchuk(3).ndf' , SIZE = 10240KB , MAXSIZE = 51200KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_kovalchuk_271_pz1_5_log', FILENAME = N'/var/opt/mssql/data/db_kovalchuk_271_pz1_5_log.ldf' , SIZE = 10240KB , MAXSIZE = 51200KB , FILEGROWTH = 1024KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_kovalchuk_271_pz1_5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET ARITHABORT OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET  DISABLE_BROKER 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET RECOVERY FULL 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET  MULTI_USER 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET DB_CHAINING OFF 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET QUERY_STORE = OFF
GO

ALTER DATABASE [db_kovalchuk_271_pz1_5] SET  READ_WRITE 
GO


EXECUTE sp_databases;


CREATE SCHEMA PZ_1_5;  
GO

CREATE TABLE PZ_1_5.kursant
	( id_kursant INT NOT NULL IDENTITY,
	  kadet_name VARCHAR(30) NOT NULL,
	  kadet_surname VARCHAR(30) NOT NULL,
	  phone INT NOT NULL,
	  email VARCHAR(50)
	  CONSTRAINT id_kursant_pk PRIMARY KEY(id_kursant));
GO

CREATE TABLE PZ_1_5.groups
	( id_groups INT NOT NULL IDENTITY,
	  number_group INT NOT NULL,
	  title_group VARCHAR(20),
	  CONSTRAINT id_groups_pk PRIMARY KEY(id_groups));
	 
GO

CREATE TABLE  PZ_1_5.facultet
	( id_facultet INT NOT NULL IDENTITY,
	  number_facultet INT NOT NULL,
	  title_facultet VARCHAR(50),
	  CONSTRAINT id_facultet_pk PRIMARY KEY(id_facultet));
GO

ALTER TABLE PZ_1_5.kursant ADD group_id INT NOT NULL;
ALTER TABLE PZ_1_5.kursant ADD  CONSTRAINT id_group_fk FOREIGN KEY (group_id)
        REFERENCES PZ_1_5.groups (id_groups)
        ON DELETE CASCADE
        ON UPDATE CASCADE;

GO

ALTER TABLE PZ_1_5.groups ADD facultet_id INT NOT NULL;
ALTER TABLE PZ_1_5.groups ADD CONSTRAINT id_facultet_fk FOREIGN KEY (facultet_id)
        REFERENCES PZ_1_5.facultet (id_facultet)
        ON DELETE CASCADE
        ON UPDATE CASCADE;
		GO


	
		exec sp_columns facultet;
		GO

INSERT INTO PZ_1_5.facultet (number_facultet,  title_facultet) VALUES (1, 'Факультет телекомунікаційних систем');
INSERT INTO PZ_1_5.facultet (number_facultet,  title_facultet) VALUES (2, 'Факультет інформаційних технологій');
INSERT INTO PZ_1_5.facultet (number_facultet,  title_facultet) VALUES (3, 'Факультет бойового застосування');
GO

SELECT * FROM PZ_1_5.facultet;


exec sp_columns groups;
		GO
INSERT INTO PZ_1_5.groups (number_group, title_group, facultet_id) VALUES (271, 'IT', 8);
GO
INSERT INTO PZ_1_5.groups (number_group, title_group, facultet_id) VALUES (272, 'IT', 8);
INSERT INTO PZ_1_5.groups (number_group, title_group, facultet_id) VALUES (273, 'ASU', 8);
GO

SELECT * FROM PZ_1_5.groups ;
GO

INSERT INTO PZ_1_5.groups (number_group, facultet_id) VALUES (171, 7);
GO
SELECT * FROM PZ_1_5.groups ;
GO

INSERT INTO PZ_1_5.groups (number_group, facultet_id) VALUES (172, 7);
INSERT INTO PZ_1_5.groups (number_group, title_group, facultet_id) VALUES (371, 'ВУ', 9);
INSERT INTO PZ_1_5.groups (number_group, title_group, facultet_id) VALUES (373, 'ВУ', 9);
INSERT INTO PZ_1_5.groups (number_group, title_group, facultet_id) VALUES (375, 'КА', 9);
INSERT INTO PZ_1_5.groups (number_group, title_group, facultet_id) VALUES (376, 'КА', 9);

GO

SELECT * FROM PZ_1_5.groups ;
GO

exec sp_columns kursant;
		GO

INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Валерій', 'Михайлов', 0753368856, 'valera@gmail.com', 1 );
GO

SELECT * FROM PZ_1_5.kursant;


INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, group_id) VALUES ( 'Дмитро', 'Аннасон', 098713555, 1);
GO

INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Георгій ', 'Білявський', 0998845672, 'georg@gmail.com', 1);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Руслан', 'Лучейко', 0884569658, 'ruslan@gmail.com', 1);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Валерій', 'Михайлов', 0753368856, 'valera@gmail.com', 1);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Андрій', 'Шевчук', 0753368856, 'andriy@gmail.com', 2);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Микола', 'Шевчук', 0753888856, 'mikola@gmail.com', 2);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Олександра', 'Савенок', 0669998565, 'alex@gmail.com', 2);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Олександра', 'Савенок', 0669998565, 'alex@gmail.com', 2);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Влад', 'Бринза', 0996856988, 'vlad@gmail.com', 3);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Максим', 'Харченко', 0996856988, 'vax@gmail.com', 3);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Коля', 'Снітко', 0996856988, 'ko@gmail.com', 3);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'ОЛександр', 'Гречуха', 0996856988, 'alexandr@gmail.com', 3);
GO

INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Петро', 'Борисович', 0996856988, 'alexandr@gmail.com', 4);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, email, group_id) VALUES ( 'Ольга', 'Анреєва', 0998766355, 'olga@gmail.com', 4);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone,  group_id) VALUES ( 'Тарас', 'Анреєв', 0998766355,  4);
INSERT INTO PZ_1_5.kursant (  kadet_name, kadet_surname, phone, group_id) VALUES ( 'Максим', 'Петров', 0998765553,  4);
GO

SELECT * FROM PZ_1_5.kursant ;
GO

SELECT kursant.kadet_name, kursant.kadet_surname, kursant.phone,  groups.number_group
	FROM PZ_1_5.kursant 
		JOIN PZ_1_5.groups ON groups.id_groups = kursant.group_id 
			WHERE groups.id_groups =1 ;

SELECT kursant.kadet_name, kursant.kadet_surname, kursant.phone, groups.number_group, facultet.title_facultet 
	FROM PZ_1_5.kursant 
		JOIN PZ_1_5.groups ON groups.id_groups = kursant.group_id 
			JOIN PZ_1_5.facultet ON facultet.id_facultet = groups.facultet_id 
				WHERE facultet.id_facultet = 8;

				
/*
CREATE VIEW v_cadets (kadet_name, number_group ) AS
 SELECT COUNT(kursant.kadet_name) AS kadet_name,  groups.number_group AS number_group
	FROM PZ_1_5.kursant 
		JOIN PZ_1_5.groups ON groups.id_groups = kursant.group_id
		GROUP BY groups.number_group;
	
SELECT * FROM v_cadets;

*/


CREATE LOGIN nastya_login WITH PASSWORD = '1111';

CREATE USER nastya_user FOR LOGIN nastya_login;

