--task1 
CREATE PROCEDURE AddHall
	@cinema NVARCHAR(50) = 'Титан-Арена',
	@rowAmount INT,
	@seatsAmount INT,
	@hallNumber INT
AS
	INSERT INTO Hall(Cinema, RowAmount, SeatsAmount, HallNumber) 
	VALUES(@cinema, @rowAmount, @seatsAmount, @hallNumber)

EXEC AddHall DEFAULT, 15, 16, 1
SELECT *
FROM Hall

--task2
ALTER PROCEDURE AddHall
	@cinema NVARCHAR(50) = 'Титан-Арена',
	@rowAmount INT,
	@seatsAmount INT,
	@hallNumber INT
AS
BEGIN
	DECLARE @id INT
	SET @id = (SELECT HallId
		FROM Hall
		WHERE Cinema = @cinema AND HallNumber = @hallNumber)
	IF(@id IS NOT NULL)
		UPDATE Hall
		SET
			SeatsAmount = @seatsAmount,
			RowAmount = @rowAmount
		WHERE HallId = @id
	ELSE			
		INSERT INTO Hall(Cinema, RowAmount, SeatsAmount, HallNumber) 
		VALUES(@cinema, @rowAmount, @seatsAmount, @hallNumber)
END

EXEC AddHall DEFAULT, 20, 19, 3
SELECT *
FROM Hall

--task3
ALTER PROCEDURE AddTicket
	@phone CHAR(10),
	@sessionId INT,
	@row INT,
	@place INT,
	@id INT OUTPUT
AS
BEGIN
	DECLARE @visitorId INT
	SET @visitorId = (SELECT VisitorId
			FROM Visitor
			WHERE Phone = @phone)
	IF(@visitorId IS NOT NULL)
		INSERT INTO Ticket(SessionId, Row, Place, VisitorId)
		VALUES(@sessionId, @row, @place, @visitorId);

	SET @id = SCOPE_IDENTITY();
END

DECLARE @id INT 
EXEC AddTicket '77777777', 3,7,1, @id OUTPUT
SELECT @id

--task4
ALTER PROCEDURE AddTicket
	@phone CHAR(10),
	@sessionId INT,
	@row INT,
	@place INT
AS
BEGIN
	DECLARE @visitorId INT
	SET @visitorId = (SELECT VisitorId
			FROM Visitor
			WHERE Phone = @phone)
	IF(@visitorId IS NOT NULL)
		INSERT INTO Ticket(SessionId, Row, Place, VisitorId)
		VALUES(@sessionId, @row, @place, @visitorId);

	SELECT Row, Place 
	FROM Ticket
	WHERE VisitorId = @visitorId AND SessionId = @sessionId
END

EXEC AddTicket '77777777', 7, 17, 9