USE [ispp3503]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 14.10.2024 11:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategory]
    @name NVARCHAR(100),
    @id int OUTPUT 
AS
BEGIN
    INSERT INTO Category(Name) VALUES (@name)
	SET @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[AddHall]    Script Date: 14.10.2024 11:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddHall]
	@cinema NVARCHAR(50) = 'Титан-Арена',
	@rowAmount INT,
	@seatsAmount INT,
	@hallNumber INT
AS
BEGIN
	declare @id int
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
GO
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 14.10.2024 11:23:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTicket]
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
GO
