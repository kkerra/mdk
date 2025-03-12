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
    PRINT CONCAT_WS(' ','�������� �����: ', @@ROWCOUNT)
END

SELECT *
FROM Game;
UPDATE Game SET Price +=1

create TRIGGER trSavePrice --���� ��������� ���
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

--������ ��������� ����� � ��������� �������
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

--���������� ������� ��� ����� ���������� ����� ������
CREATE TRIGGER TrChangeKeysCount
ON Sale
AFTER INSERT
AS 
	UPDATE Game
	SET TotalKeys -= SaledKeys
	FROM Game JOIN inserted ON Game.GameId = inserted.GameId


-- ���������� ������� � ������ ���������� ���������� ������
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
		RAISERROR ('������������ ������ ��� �������', 11, 1);

END;