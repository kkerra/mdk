DECLARE @login VARCHAR(100) = 'admin';
--DECLARE @year SMALLINT;
SET @year = 2024;

DECLARE @maxPrice DECIMAL(16,2)
SET @maxPrice = (SELECT MAX(Price)
				 FROM Game)


--SELECT @login, @year, @maxPrice
PRINT @login;
--PRINT CONCAT_WS(' ', @login, @year, @maxPrice)

IF(5>0)
	BEGIN 
		PRINT '5>0';
	END
ELSE
	BEGIN
		PRINT 'not 5>0';
	END

DECLARE @usersCount INT = 15;
DECLARE @i INT = 1;
WHILE @i <= @usersCount
	BEGIN
		DECLARE @login VARCHAR(10) = CONCAT('ispp350', @i);
			IF(@i < 10)
				SET @login = CONCAT('ispp350', @i);
			ELSE
				SET @login = CONCAT('ispp35', @i);
		PRINT @login
		SET @i += 1
	END;

THROW 51000, 'текст', 1

--скал€рна€
CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int,
	@param2 int
)
RETURNS INT
AS
    RETURN CONCAT(@param1, @param2)

--таблична€

CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int,
    @param2 char(5)
)
RETURNS TABLE AS RETURN
(
    SELECT @param1 AS c1,
	       @param2 AS c2
)


SELECT Name,Price, ROUND(Price, -2)
FROM Game

CREATE FUNCTION GetSum
(
	@a INT,
	@b INT = 1
)
RETURNS INT 
AS 
BEGIN
	RETURN @a + @b
END

SELECT dbo.GetSum(2,3)
SELECT dbo.GetSum(2, DEFAULT)

CREATE FUNCTION GetAvgPrice
(
	@idCategory INT
)
RETURNS DECIMAL(16,2)
AS
BEGIN
	DECLARE @avgPrice DECIMAL(16,2)
	SET @avgPrice = (SELECT AVG(Price)
					 FROM Game
					 WHERE @idCategory = CategoryId)
	RETURN @avgPrice
END

SELECT *, dbo.GetAvgPrice(CategoryId) AvgPrice
FROM Category

CREATE FUNCTION GetGamesByCategory
(
	@name NVARCHAR(100)
)
RETURNS TABLE
AS
	RETURN
	(
		SELECT Game.*
		FROM Game JOIN Category ON Game.CategoryId=Category.CategoryId
		WHERE Category.Name = @name
	)

SELECT *
FROM dbo.GetGamesByCategory('RPG')

CREATE PROCEDURE dbo.AddCategory
    @name NVARCHAR(100),
    @id int OUTPUT 
AS
BEGIN
    INSERT INTO Category(Name) VALUES (@name)
	SET @id = SCOPE_IDENTITY();
END

--вызов
DECLARE @n INT 
EXEC AddCategory 'arcada', @n OUTPUT
SELECT @n