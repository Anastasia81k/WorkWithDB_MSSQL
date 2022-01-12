USE [master]
GO

/****** Object:  Database [db_2_5_2222]    Script Date: 23.03.2020 20:40:13 ******/
CREATE DATABASE [db_2_5_2222]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_2_5_2222', FILENAME = N'/var/opt/mssql/data/db_2_5_2222.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_2_5_2222_log', FILENAME = N'/var/opt/mssql/data/db_2_5_2222_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_2_5_2222].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [db_2_5_2222] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [db_2_5_2222] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [db_2_5_2222] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [db_2_5_2222] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [db_2_5_2222] SET ARITHABORT OFF 
GO

ALTER DATABASE [db_2_5_2222] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [db_2_5_2222] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [db_2_5_2222] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [db_2_5_2222] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [db_2_5_2222] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [db_2_5_2222] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [db_2_5_2222] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [db_2_5_2222] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [db_2_5_2222] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [db_2_5_2222] SET  DISABLE_BROKER 
GO

ALTER DATABASE [db_2_5_2222] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [db_2_5_2222] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [db_2_5_2222] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [db_2_5_2222] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [db_2_5_2222] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [db_2_5_2222] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [db_2_5_2222] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [db_2_5_2222] SET RECOVERY FULL 
GO

ALTER DATABASE [db_2_5_2222] SET  MULTI_USER 
GO

ALTER DATABASE [db_2_5_2222] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [db_2_5_2222] SET DB_CHAINING OFF 
GO

ALTER DATABASE [db_2_5_2222] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [db_2_5_2222] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [db_2_5_2222] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [db_2_5_2222] SET QUERY_STORE = OFF
GO

ALTER DATABASE [db_2_5_2222] SET  READ_WRITE 
GO


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
	sum_onCard DECIMAL(10,2) NOT NULL,
	currency VARCHAR(30) NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT id_account_pk PRIMARY KEY(id_account));

	ALTER TABLE UserAccount ADD  CONSTRAINT id_user_fk FOREIGN KEY (user_id)
        REFERENCES UserBank (id_user)
        ON DELETE CASCADE
        ON UPDATE CASCADE;

		

	CREATE TABLE FixedTransaction 
(
    id_transaction INT IDENTITY PRIMARY KEY,
    number_card INT NOT NULL,
	sum_onCard DECIMAL(10,2) NOT NULL,
	currency VARCHAR(30) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
);	


		CREATE TRIGGER trig_addDate ON UserAccount
		AFTER UPDATE
		AS
		BEGIN
			DECLARE @new_accountFrom VARCHAR(30)
			DECLARE @new_amount DECIMAL(10,2)
			DECLARE @new_currency VARCHAR(30)
			IF @@ROWCOUNT= 0
			RETURN

			SELECT @new_accountFrom =(SELECT number_card FROM inserted)
			SELECT @new_amount =(SELECT sum_onCard FROM inserted)
			SELECT @new_currency =(SELECT currency FROM inserted)

			INSERT INTO FixedTransaction (number_card, sum_onCard, currency,CreateAt ) VALUES (@new_accountFrom, @new_amount, @new_currency, GETDATE() )
		END 

		SELECT * FROM FixedTransaction;
		

	INSERT INTO UserBank (surname_user, name_user, patronymic, address,phone ) VALUES (' Ó‚‡Î¸˜ÛÍ','¿Ì‡ÒÚ‡Ò≥ˇ','≤„Ó≥‚Ì‡','Ï.  Ëø‚, ‚ÛÎ.ÃÓÒÍÓ‚¸Í‡ 45/1', 0987135303);
	SELECT * FROM UserBank;

	SELECT * FROM UserAccount;
	INSERT INTO UserAccount(number_card,type_card, sum_onCard, currency, user_id ) VALUES (669944884, 'stud', 5000.00, '„Ì', 1);
	INSERT INTO UserAccount(number_card,type_card, sum_onCard, currency, user_id ) VALUES (669944884, 'stud', 250.00, 'Â‚Ó', 1);
	INSERT INTO UserAccount(number_card,type_card, sum_onCard, currency, user_id ) VALUES (669944884, 'stud', 300.00, '‰ÓÎ‡≥‚', 1);

	SELECT * FROM UserAccount;
			
	-------------------------------Œ¡Ÿ»… ¡¿À¿Õ—(¬ «¿¬»—»ÃŒ—“» Œ“ ¬¬≈ƒ≈ÕÕŒ… ¬ ‘”Õ ÷»» ¬¿Àﬁ“€)
		
		CREATE FUNCTION getSumFuncCurr (@userID INT, @current VARCHAR(30))
			RETURNS numeric(10,2)
			BEGIN
			DECLARE @summEvro numeric(10,2)
			DECLARE @summDolar numeric(10,2)
			DECLARE @summGriv numeric(10,2)
			DECLARE @curr VARCHAR(30)
			IF @current = 'Â‚Ó'
				BEGIN
					SELECT @summEvro = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='Â‚Ó' AND UserAccount.user_id = @userID) 
					SELECT @summDolar = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='‰ÓÎ‡≥‚' AND UserAccount.user_id = @userID) * 0.93					
					SELECT @summGriv = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='„Ì' AND UserAccount.user_id = @userID) * 0.03
				END
			IF @current = '‰ÓÎ‡≥‚'
			BEGIN
					SELECT @summEvro = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='Â‚Ó' AND UserAccount.user_id = @userID) * 1.07
					SELECT @summDolar = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='‰ÓÎ‡≥‚' AND UserAccount.user_id = @userID) 					
					SELECT @summGriv = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='„Ì' AND UserAccount.user_id = @userID) * 0.04
				END
			IF @current = '„Ì'
			BEGIN
					SELECT @summEvro = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='Â‚Ó' AND UserAccount.user_id = @userID) * 29.86
					SELECT @summDolar = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='‰ÓÎ‡≥‚' AND UserAccount.user_id = @userID) * 27.83					
					SELECT @summGriv = (SELECT SUM(sum_onCard) FROM UserAccount WHERE UserAccount.currency ='„Ì' AND UserAccount.user_id = @userID) 
				END
			RETURN @summEvro+@summDolar+@summGriv
			END

			SELECT dbo.getSumFuncCurr(1, 'Â‚Ó');
			SELECT dbo.getSumFuncCurr(1, '‰ÓÎ‡≥‚');
			SELECT dbo.getSumFuncCurr(1, '„Ì');
			
		
	---------------------------------------------“–¿Õ«¿ ÷»» œ≈–≈¬ŒƒŒ¬ — —◊≈“¿ Õ¿ —◊≈“
			CREATE PROCEDURE changeMon (@count1 INT, @count2 INT, @money DECIMAL(10,2) )
			AS
				BEGIN
				IF @count2 = 14599654
					BEGIN
						IF @count1 = 669944884
						BEGIN
							BEGIN TRANSACTION
							UPDATE UserAccount SET sum_onCard = sum_onCard - @money WHERE UserAccount.number_card = @count1;
							IF (@@ERROR <> 0)
							ROLLBACK
							UPDATE UserAccount SET sum_onCard = sum_onCard + (@money * 0.04)  WHERE UserAccount.number_card = @count2;
							IF (@@ERROR <> 0)
							ROLLBACK
							COMMIT
						END
						IF @count1 = 22447799
						BEGIN 
						BEGIN TRANSACTION
							UPDATE UserAccount SET sum_onCard = sum_onCard - @money WHERE UserAccount.number_card = @count1;
						IF (@@ERROR <> 0)
							ROLLBACK
							UPDATE UserAccount SET sum_onCard = sum_onCard + (@money * 0.93)  WHERE UserAccount.number_card = @count2;
							IF (@@ERROR <> 0)
							ROLLBACK
							COMMIT
						END
					END
				IF @count2 = 22447799
					BEGIN
						IF @count1 = 669944884
						BEGIN
							BEGIN TRANSACTION
							UPDATE UserAccount SET sum_onCard = sum_onCard - @money WHERE UserAccount.number_card = @count1;
							IF (@@ERROR <> 0)
							ROLLBACK
							UPDATE UserAccount SET sum_onCard = sum_onCard + (@money * 0.03)  WHERE UserAccount.number_card = @count2;
							IF (@@ERROR <> 0)
							ROLLBACK
							COMMIT

						END
						IF @count1 = 14599654
						BEGIN 
							BEGIN TRANSACTION
							UPDATE UserAccount SET sum_onCard = sum_onCard - @money WHERE UserAccount.number_card = @count1;
							IF (@@ERROR <> 0)
							ROLLBACK
							UPDATE UserAccount SET sum_onCard = sum_onCard + (@money * 1.07)  WHERE UserAccount.number_card = @count2;
							IF (@@ERROR <> 0)
							ROLLBACK
							COMMIT
						END
					END
					IF @count2 = 669944884
					BEGIN
						IF @count1 = 14599654
						BEGIN
							BEGIN TRANSACTION
							UPDATE UserAccount SET sum_onCard = sum_onCard - @money WHERE UserAccount.number_card = @count1;
							IF (@@ERROR <> 0)
							ROLLBACK
							UPDATE UserAccount SET sum_onCard = sum_onCard + (@money * 29.86)  WHERE UserAccount.number_card = @count2;
							IF (@@ERROR <> 0)
							ROLLBACK
							COMMIT

						END
						IF @count1 = 22447799
						BEGIN 
							BEGIN TRANSACTION
							UPDATE UserAccount SET sum_onCard = sum_onCard - @money WHERE UserAccount.number_card = @count1;
							IF (@@ERROR <> 0)
							ROLLBACK
							UPDATE UserAccount SET sum_onCard = sum_onCard + (@money * 27.83)  WHERE UserAccount.number_card = @count2;
							IF (@@ERROR <> 0)
							ROLLBACK
							COMMIT
						END
					END
				END

			

				EXECUTE changeMon 669944884, 14599654, 1000 ;
				EXECUTE changeMon 14599654, 22447799, 50 ;
				SELECT * FROM UserAccount;



				EXECUTE changeMon 14599654, 669944884, 40 ;
				EXECUTE changeMon 22447799, 14599654, 50 ;

				SELECT * FROM UserAccount;

				
				SELECT * FROM FixedTransaction;
				


			------------------------------------------------

	
	SELECT * FROM UserAccount;
	UPDATE UserAccount SET sum_onCard = 5000.00  WHERE number_card = 669944884;
	UPDATE UserAccount SET sum_onCard = 250.00  WHERE number_card = 14599654;
	UPDATE UserAccount SET sum_onCard = 300.00  WHERE number_card = 22447799;