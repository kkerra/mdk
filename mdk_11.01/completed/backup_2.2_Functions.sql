USE [ispp3503]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPrice]    Script Date: 14.10.2024 11:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAvgPrice]
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
GO
/****** Object:  UserDefinedFunction [dbo].[GetSum]    Script Date: 14.10.2024 11:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetSum]
(
	@a INT,
	@b INT = 1
)
RETURNS INT 
AS 
BEGIN
	RETURN @a + @b
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetTicketCost]    Script Date: 14.10.2024 11:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTicketCost](@VisitorID INT, @SessionID INT)
RETURNS DECIMAL(4, 0)
AS
BEGIN
    DECLARE @totalCost DECIMAL(4, 0);

    SELECT @totalCost = SUM(Price)
    FROM Ticket
    JOIN Session ON Ticket.SessionID = Session.SessionID
    WHERE Ticket.VisitorID = @VisitorID AND Ticket.SessionID = @SessionID;

    RETURN @totalCost;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalPoints]    Script Date: 14.10.2024 11:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTotalPoints](@VisitorId INT)
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
GO
/****** Object:  UserDefinedFunction [dbo].[GetGamesByCategory]    Script Date: 14.10.2024 11:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetGamesByCategory]
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
GO
/****** Object:  UserDefinedFunction [dbo].[GetMoviesByGenre]    Script Date: 14.10.2024 11:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMoviesByGenre]
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
GO
/****** Object:  UserDefinedFunction [dbo].[GetMoviesByVisitor]    Script Date: 14.10.2024 11:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMoviesByVisitor](@VisitorID INT)
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
GO
/****** Object:  UserDefinedFunction [dbo].[GetTodaySession]    Script Date: 14.10.2024 11:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTodaySession]()
RETURNS TABLE
AS
RETURN
(
	SELECT SessionId, Title, Duration, Cinema, Hall.HallId, FORMAT(Session.DateTime, N'HH\:mm') StartTime, FORMAT(DATEADD(MINUTE, Duration, Session.DateTime), N'HH\:mm') EndTime
	FROM Session 
         INNER JOIN Hall ON Session.HallId = Hall.HallId 
         INNER JOIN Movie ON Session.MovieId = Movie.MovieId
	WHERE CAST(Session.DateTime AS DATE) = CAST(GETDATE() AS DATE)
)
GO
