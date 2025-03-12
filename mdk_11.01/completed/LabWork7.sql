-- task1
ALTER FUNCTION [dbo].GetTotalPoints(@VisitorId INT)
RETURNS INT
AS
BEGIN
    DECLARE @totalPoints INT;

    SELECT @totalPoints = ISNULL(SUM(Duration),0)
    FROM Ticket
		JOIN Session ON Ticket.SessionId = Session.SessionId
		JOIN Movie ON Session.MovieId = Movie.MovieId
    WHERE Ticket.VisitorId = @VisitorId;

    RETURN @totalPoints;
END;

SELECT VisitorId, Name, dbo.GetTotalPoints(VisitorId) 
FROM Visitor

--task2
CREATE FUNCTION [dbo].GetTodaySession()
RETURNS TABLE
AS
RETURN
(
	SELECT SessionId, Title, Duration, Cinema, Hall.HallId,
	FORMAT(Session.DateTime, N'HH:mm') StartTime, FORMAT(DATEADD(MINUTE, Duration, Session.DateTime), N'HH:mm') EndTime
	FROM Session 
         INNER JOIN Hall ON Session.HallId = Hall.HallId 
         INNER JOIN Movie ON Session.MovieId = Movie.MovieId
	WHERE CAST(Session.DateTime AS DATE) = CAST(GETDATE() AS DATE)
)

SELECT *
FROM dbo.GetTodaySession()

--task3
ALTER FUNCTION dbo.GetTicketCost(@VisitorID INT, @SessionID INT)
RETURNS DECIMAL(10, 0)
AS
BEGIN
    DECLARE @totalCost DECIMAL(10, 0);

    SELECT @totalCost = SUM(Price)
    FROM Ticket
		JOIN Session ON Ticket.SessionID = Session.SessionID
    WHERE Ticket.VisitorID = @VisitorID AND Ticket.SessionID = @SessionID;

    RETURN @totalCost;
END;

DECLARE @visitorID INT = 2;
DECLARE @sessionID INT = 2;

SELECT dbo.GetTicketCost(@visitorID, @sessionID) TotalCost;


--task4

ALTER FUNCTION dbo.GetMoviesByVisitor(@VisitorID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        Movie.MovieId,
        Movie.Title,
        Session.DateTime AS SessionDate,
        COUNT(Ticket.TicketId) AS TicketCount,
        Session.Price AS TicketPrice,
        COUNT(Ticket.TicketId) * Session.Price AS TotalCost
    FROM 
        Ticket
    JOIN 
        Session ON Ticket.SessionId = Session.SessionId
    JOIN 
        Movie ON Session.MovieID = Movie.MovieID
    WHERE 
        Ticket.VisitorId = @VisitorId
    GROUP BY 
        Movie.MovieID, Movie.Title, Session.DateTime, Session.Price
);

DECLARE @visitorID INT = 2

SELECT * 
FROM dbo.GetMoviesByVisitor(@visitorID)

--task6
ALTER FUNCTION [dbo].GetMoviesByGenre
(
	@genre NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
	SELECT MovieId, Title, Duration, STRING_AGG(Genre, ',') Genre
	FROM Movie 
         INNER JOIN Genre ON Movie.GenreId = Genre.GenreId
	WHERE Genre = @genre
	GROUP BY MovieId, Title, Duration
)

SELECT *
FROM dbo.GetMoviesByGenre('ужасы')