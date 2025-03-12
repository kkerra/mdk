CREATE TRIGGER TriggerName
ON TableName
INSTEAD OF / AFTER DELETE, INSERT, UPDATE
AS
BEGIN
    --
END

CREATE TRIGGER trChangedGamesCount
ON Game
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
    PRINT CONCAT_WS(' ','Изменено строк: ', @@ROWCOUNT)
END

SELECT *
FROM Game;
UPDATE Game SET Price +=1

create TRIGGER trSavePrice --учет изменения цен
ON Game
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Price) 
		INSERT INTO GamePrice(GameId, Price)
		SELECT GameId, Price
		FROM deleted
END

SELECT *
FROM GamePrice

--запись удаленных строк в отдельную таблицу
CREATE TRIGGER trSaveCategory
ON Category
AFTER DELETE
AS
BEGIN 
	INSERT INTO DeletedCategory(CategoryId, Name, DeletedDate, Login)
	SELECT CategoryId, Name, GetDate(), ORIGINAL_LOGIN()
	FROM deleted;
END


SELECT *
FROM DeletedCategory

CREATE TRIGGER trDeleteGame
ON Game
INSTEAD OF DELETE
AS
BEGIN 
	UPDATE Game 
	SET IsDeleted = 1
	WHERE GameId IN (SELECT GameId 
					 FROM deleted)
END

--оформление продажи без учета имеющегося колва ключей
CREATE TRIGGER TrChangeKeysCount
ON Sale
AFTER INSERT
AS 
	UPDATE Game
	SET TotalKeys -= SaledKeys
	FROM Game JOIN inserted ON Game.GameId = inserted.GameId


-- оформление продажи с учетом имеющегося количества ключей
CREATE TRIGGER TrChangeKeysCountWithCheck
ON Sale
INSTEAD OF INSERT
AS 
BEGIN
	DECLARE @saledKeys INT;
	DECLARE @totalKeys INT;

	SELECT @saledKeys = SaledKeys, @totalKeys = TotalKeys
	FROM Game JOIN inserted ON Game.GameId = inserted.GameId;

	IF @totalKeys >= @saledKeys
	BEGIN
		INSERT INTO Sale(GameId, SaledKeys)
		SELECT GameId, SaledKeys
		FROM Sale;

		UPDATE Game
		SET TotalKeys -= SaledKeys
		FROM Game JOIN inserted ON Game.GameId = inserted.GameId;
	END;
	ELSE
		RAISERROR ('недостаточно ключей для покупки', 11, 1);

END;