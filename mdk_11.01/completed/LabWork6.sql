-- task1
CREATE VIEW	 SessionInfo 
AS
SELECT Session.SessionId, Session.MovieId, Title, Session.DateTime, Cinema, HallNumber, Price, 
	   CAST(RowAmount AS int) * CAST(SeatsAmount AS INT) SeatsNumber
FROM Session 
	 INNER JOIN Movie ON Session.MovieId = Movie.MovieId 
	 INNER JOIN Hall ON Session.HallId = Hall.HallId

--task2
CREATE VIEW MovieInfo
AS
SELECT Movie.MovieId, Movie.Title, Movie.ReleaseYear, Movie.Description, Movie.RentalBeginning, 
CONCAT_WS(' ', CAST(Duration / 60 AS varchar(10)), 'h', CAST(Duration % 60 AS varchar(10)), 'm') Duration,
STRING_AGG(Genre, ',') Genre
FROM Movie 
	INNER JOIN Genre ON Movie.GenreId = Genre.GenreId
GROUP BY MovieId, Title, ReleaseYear, Duration, Description, RentalBeginning

--task3
CREATE VIEW FutureRentals
AS
SELECT Movie.MovieId, Movie.Title, Movie.ReleaseYear, Movie.Description, Movie.RentalBeginning, 
CONCAT_WS(' ', CAST(Duration / 60 AS varchar(10)), 'h', CAST(Duration % 60 AS varchar(10)), 'm') Duration,
STRING_AGG(Genre, ',') Genre

FROM Movie 
	 INNER JOIN Genre ON Movie.GenreId = Genre.GenreId
WHERE Movie.RentalBeginning BETWEEN GETDATE() 
	  AND DATEADD(MONTH, 1 ,GETDATE())
GROUP BY MovieId, Title, ReleaseYear, Duration, Description, RentalBeginning

--task4
CREATE VIEW FutureSessions
AS
SELECT Session.SessionId, Session.MovieId, Title, Session.DateTime, Cinema, HallNumber, Price, 
	   CAST(RowAmount AS int) * CAST(SeatsAmount AS INT) SeatsNumber
FROM Session 
	  INNER JOIN Ticket ON Session.SessionId = Ticket.SessionId
      INNER JOIN Hall ON Session.HallId = Hall.HallId 
	  INNER JOIN Movie ON Session.MovieId = Movie.MovieId
WHERE Session.DateTime > GETDATE() 
	  AND TicketId IS NULL                         
