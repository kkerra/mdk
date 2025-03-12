--task1
--5.1.1
CREATE LOGIN [ispp3503] WITH PASSWORD=N'3503', 
DEFAULT_DATABASE=[ispp3503], 
DEFAULT_LANGUAGE=[русский], 
CHECK_EXPIRATION=OFF, 
CHECK_POLICY=OFF

--5.1.2
CREATE LOGIN isppLogin3503
WITH PASSWORD='Password!',
	 CHECK_EXPIRATION=OFF,
	 CHECK_POLICY = OFF

EXEC sp_addlogin 'isppLogin3503', 'Password!'
EXEC sp_addsrvrolemember 'isppLogin3503', 'securityadmin'

--5.1.3
EXEC sp_adduser 'login1', 'user1'

EXEC sp_adduser 'login2', 'user2'

CREATE USER user3
FOR LOGIN login3

CREATE USER user4
FOR LOGIN login4

--task2
EXEC sp_addrolemember 'user1', 'db_owner'
EXEC sp_addrolemember 'user2', 'db_datareader'
EXEC sp_addrolemember 'user2', 'db_datawriter'
GRANT INSERT, DELETE
ON Ticket
TO user3

GRANT SELECT
ON Visitor
TO user4
GRANT UPDATE
ON Visitor(Name, Email)
TO user4

EXEC sp_droprolemember 'user2', 'db_datawriter'
DENY SELECT
ON Visitor
TO user2

DENY UPDATE
ON Visitor(Name)
TO user4

--task3
DECLARE @i INT = 1
WHILE(@i <= 4)
	BEGIN
		DECLARE @login VARCHAR(10) = CONCAT('reader', @i)
		--EXEC sp_addlogin @login, '1'
		EXEC sp_adduser @login, @login
		EXEC sp_addrolemember @login, 'db_datareader'
		SET @i += 1
	END;

--task5
UPDATE Task1Users
SET EncryptedPassword = HASHBYTES('SHA2_256', Password)

SELECT *
FROM Task1Users

