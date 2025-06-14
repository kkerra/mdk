USE [ispp3503]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RpgGames'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RpgGames'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Games1000'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Games1000'
GO
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 30.09.2024 11:27:47 ******/
DROP PROCEDURE [dbo].[AddTicket]
GO
/****** Object:  StoredProcedure [dbo].[AddHall]    Script Date: 30.09.2024 11:27:47 ******/
DROP PROCEDURE [dbo].[AddHall]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 30.09.2024 11:27:47 ******/
DROP PROCEDURE [dbo].[AddCategory]
GO
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [CK_Row]
GO
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [CK_Place]
GO
ALTER TABLE [dbo].[ManagerUser] DROP CONSTRAINT [CK_ManagerUser]
GO
ALTER TABLE [dbo].[Hall] DROP CONSTRAINT [CK_Hall_SeatsAmount]
GO
ALTER TABLE [dbo].[Hall] DROP CONSTRAINT [CK_Hall_RowAmount]
GO
ALTER TABLE [dbo].[Hall] DROP CONSTRAINT [CK_Hall_Cinema]
GO
ALTER TABLE [dbo].[ClientUser] DROP CONSTRAINT [CK_ClientUser]
GO
ALTER TABLE [dbo].[AdminUser] DROP CONSTRAINT [CK_AdminUser]
GO
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_Ticket_Visitor]
GO
ALTER TABLE [dbo].[Ticket] DROP CONSTRAINT [FK_Ticket_Session]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [FK_Session_Movie]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [FK_Session_Hall]
GO
ALTER TABLE [dbo].[GenreMovie] DROP CONSTRAINT [FK_GenreMovie_Movie]
GO
ALTER TABLE [dbo].[GenreMovie] DROP CONSTRAINT [FK_GenreMovie_Genre]
GO
ALTER TABLE [dbo].[Game] DROP CONSTRAINT [FK_Game_Category]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [DF_Session_Is3D]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [DF_Session_DateTime]
GO
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [DF_Session_Price]
GO
ALTER TABLE [dbo].[Movie] DROP CONSTRAINT [DF_Movie_ReleaseYear]
GO
ALTER TABLE [dbo].[Movie] DROP CONSTRAINT [DF_Movie_Duration]
GO
ALTER TABLE [dbo].[Hall] DROP CONSTRAINT [DF_Hall_IsVIP]
GO
ALTER TABLE [dbo].[Hall] DROP CONSTRAINT [DF_Hall_Cimena]
GO
/****** Object:  Index [UQ_Visitor_Phone]    Script Date: 30.09.2024 11:27:47 ******/
DROP INDEX [UQ_Visitor_Phone] ON [dbo].[Visitor]
GO
/****** Object:  Index [UQ_Visitor_Email]    Script Date: 30.09.2024 11:27:47 ******/
DROP INDEX [UQ_Visitor_Email] ON [dbo].[Visitor]
GO
/****** Object:  Index [UQ_Ticket_Place]    Script Date: 30.09.2024 11:27:47 ******/
DROP INDEX [UQ_Ticket_Place] ON [dbo].[Ticket]
GO
/****** Object:  Index [UQ_Hall_Cinema]    Script Date: 30.09.2024 11:27:47 ******/
DROP INDEX [UQ_Hall_Cinema] ON [dbo].[Hall]
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Visitor]') AND type in (N'U'))
DROP TABLE [dbo].[Visitor]
GO
/****** Object:  Table [dbo].[GenreMovie]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenreMovie]') AND type in (N'U'))
DROP TABLE [dbo].[GenreMovie]
GO
/****** Object:  View [dbo].[FutureRentals]    Script Date: 30.09.2024 11:27:47 ******/
DROP VIEW [dbo].[FutureRentals]
GO
/****** Object:  View [dbo].[MovieInfo]    Script Date: 30.09.2024 11:27:47 ******/
DROP VIEW [dbo].[MovieInfo]
GO
/****** Object:  View [dbo].[SessionInfo]    Script Date: 30.09.2024 11:27:47 ******/
DROP VIEW [dbo].[SessionInfo]
GO
/****** Object:  View [dbo].[UsersView]    Script Date: 30.09.2024 11:27:47 ******/
DROP VIEW [dbo].[UsersView]
GO
/****** Object:  Table [dbo].[ManagerUser]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ManagerUser]') AND type in (N'U'))
DROP TABLE [dbo].[ManagerUser]
GO
/****** Object:  Table [dbo].[ClientUser]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientUser]') AND type in (N'U'))
DROP TABLE [dbo].[ClientUser]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminUser]') AND type in (N'U'))
DROP TABLE [dbo].[AdminUser]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMoviesByVisitor]    Script Date: 30.09.2024 11:27:47 ******/
DROP FUNCTION [dbo].[GetMoviesByVisitor]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ticket]') AND type in (N'U'))
DROP TABLE [dbo].[Ticket]
GO
/****** Object:  View [dbo].[Games1000]    Script Date: 30.09.2024 11:27:47 ******/
DROP VIEW [dbo].[Games1000]
GO
/****** Object:  View [dbo].[RpgGames]    Script Date: 30.09.2024 11:27:47 ******/
DROP VIEW [dbo].[RpgGames]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMoviesByGenre]    Script Date: 30.09.2024 11:27:47 ******/
DROP FUNCTION [dbo].[GetMoviesByGenre]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genre]') AND type in (N'U'))
DROP TABLE [dbo].[Genre]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTodaySession]    Script Date: 30.09.2024 11:27:47 ******/
DROP FUNCTION [dbo].[GetTodaySession]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hall]') AND type in (N'U'))
DROP TABLE [dbo].[Hall]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movie]') AND type in (N'U'))
DROP TABLE [dbo].[Movie]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGamesByCategory]    Script Date: 30.09.2024 11:27:47 ******/
DROP FUNCTION [dbo].[GetGamesByCategory]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
DROP TABLE [dbo].[Game]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 30.09.2024 11:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalPoints]    Script Date: 30.09.2024 11:27:47 ******/
DROP FUNCTION [dbo].[GetTotalPoints]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTicketCost]    Script Date: 30.09.2024 11:27:47 ******/
DROP FUNCTION [dbo].[GetTicketCost]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSum]    Script Date: 30.09.2024 11:27:47 ******/
DROP FUNCTION [dbo].[GetSum]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPrice]    Script Date: 30.09.2024 11:27:47 ******/
DROP FUNCTION [dbo].[GetAvgPrice]
GO
USE [master]
GO
/****** Object:  Database [ispp3503]    Script Date: 30.09.2024 11:27:47 ******/
DROP DATABASE [ispp3503]
GO
/****** Object:  Database [ispp3503]    Script Date: 30.09.2024 11:27:47 ******/
CREATE DATABASE [ispp3503]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ispp3503', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ispp3503.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ispp3503_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ispp3503_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ispp3503] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ispp3503].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ispp3503] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ispp3503] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ispp3503] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ispp3503] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ispp3503] SET ARITHABORT OFF 
GO
ALTER DATABASE [ispp3503] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ispp3503] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ispp3503] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ispp3503] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ispp3503] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ispp3503] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ispp3503] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ispp3503] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ispp3503] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ispp3503] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ispp3503] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ispp3503] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ispp3503] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ispp3503] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ispp3503] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ispp3503] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ispp3503] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ispp3503] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ispp3503] SET  MULTI_USER 
GO
ALTER DATABASE [ispp3503] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ispp3503] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ispp3503] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ispp3503] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ispp3503] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ispp3503] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ispp3503] SET QUERY_STORE = OFF
GO
USE [ispp3503]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPrice]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetSum]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetTicketCost]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetTotalPoints]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](16, 2) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGamesByCategory]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Duration] [smallint] NOT NULL,
	[ReleaseYear] [smallint] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Poster] [varchar](max) NULL,
	[AgeRating] [varchar](10) NULL,
	[RentalBeginning] [date] NULL,
	[RentalEnd] [date] NULL,
	[GenreId] [int] NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hall](
	[HallId] [tinyint] IDENTITY(1,1) NOT NULL,
	[RowAmount] [tinyint] NULL,
	[SeatsAmount] [tinyint] NULL,
	[Cinema] [nvarchar](50) NULL,
	[HallNumber] [tinyint] NULL,
	[IsVIP] [bit] NULL,
 CONSTRAINT [PK_Hall] PRIMARY KEY CLUSTERED 
(
	[HallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[HallId] [tinyint] NOT NULL,
	[Price] [decimal](4, 0) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Is3D] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTodaySession]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMoviesByGenre]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  View [dbo].[RpgGames]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RpgGames]
AS
SELECT        dbo.Game.GameId, dbo.Game.Name, dbo.Game.Price, dbo.Category.Name AS Category
FROM            dbo.Category INNER JOIN
                         dbo.Game ON dbo.Category.CategoryId = dbo.Game.CategoryId
WHERE        (dbo.Category.Name = N'RPG')
GO
/****** Object:  View [dbo].[Games1000]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Games1000]
WITH SCHEMABINDING , VIEW_METADATA
AS
SELECT        GameId, CategoryId, Name, Price, Description
FROM            dbo.Game
WHERE        (Price < 1000)
WITH CHECK OPTION
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [int] NOT NULL,
	[VisitorId] [int] NOT NULL,
	[Place] [tinyint] NOT NULL,
	[Row] [tinyint] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMoviesByVisitor]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  Table [dbo].[AdminUser]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__AdminUse__1788CC4C7CAA8797] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientUser]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientUser](
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__ClientUs__1788CC4C79AA3AFA] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerUser]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerUser](
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__ManagerU__1788CC4CAF349877] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UsersView]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UsersView]
AS
SELECT *
FROM AdminUser
UNION ALL
SELECT *
FROM ClientUser
UNION ALL
SELECT *
FROM ManagerUser
GO
/****** Object:  View [dbo].[SessionInfo]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW	 [dbo].[SessionInfo] 
AS
SELECT Session.SessionId, Session.MovieId, Title, Session.DateTime, Cinema, HallNumber, Price, 
	   CAST(RowAmount AS int) * CAST(SeatsAmount AS INT) SeatsNumber
FROM Session 
INNER JOIN
Movie ON Session.MovieId = Movie.MovieId 
INNER JOIN
Hall ON Session.HallId = Hall.HallId
GO
/****** Object:  View [dbo].[MovieInfo]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MovieInfo]
AS
SELECT Movie.MovieId, Movie.Title, Movie.ReleaseYear, Movie.Description, Movie.RentalBeginning, 
CONCAT_WS(' ', CAST(Duration / 60 AS varchar(10)), 'h', CAST(Duration % 60 AS varchar(10)), 'm') Duration,
STRING_AGG(Genre, ',') Genre
FROM Movie 
INNER JOIN
Genre ON Movie.GenreId = Genre.GenreId
GROUP BY
MovieId, Title, ReleaseYear, Duration, Description, RentalBeginning
GO
/****** Object:  View [dbo].[FutureRentals]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FutureRentals]
AS
SELECT Movie.MovieId, Movie.Title, Movie.ReleaseYear, Movie.Description, Movie.RentalBeginning, 
CONCAT_WS(' ', CAST(Duration / 60 AS varchar(10)), 'h', CAST(Duration % 60 AS varchar(10)), 'm') Duration,
STRING_AGG(Genre, ',') Genre

FROM Movie 
INNER JOIN
Genre ON Movie.GenreId = Genre.GenreId
WHERE Movie.RentalBeginning BETWEEN GETDATE() AND DATEADD(MONTH, 1 ,GETDATE())
GROUP BY
MovieId, Title, ReleaseYear, Duration, Description, RentalBeginning
GO
/****** Object:  Table [dbo].[GenreMovie]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenreMovie](
	[MovieId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_GenreMovie] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 30.09.2024 11:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor](
	[VisitorId] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [char](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [datetime2](7) NULL,
	[E-mail] [varchar](150) NULL,
 CONSTRAINT [PK_Visitor] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AdminUser] ([UserId], [Name], [Role]) VALUES (1, N'admin', N'Админ')
INSERT [dbo].[AdminUser] ([UserId], [Name], [Role]) VALUES (2, N'Смирнов', N'Админ')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Симулятор')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Шутер')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'RPG')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'arcada')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (5, N'arcada')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (6, N'mmo')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[ClientUser] ([UserId], [Name], [Role]) VALUES (1, N'Иванов', N'Клиент')
INSERT [dbo].[ClientUser] ([UserId], [Name], [Role]) VALUES (2, N'Петров', N'Клиент')
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (1, 1, N'SimCity', CAST(1499.00 AS Decimal(16, 2)), N'Градостроительный симулятор снова с вами! Создайте город своей мечты')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (2, 2, N'TITANFALL', CAST(2299.00 AS Decimal(16, 2)), N'Эта игра перенесет вас во вселенную, где малое противопоставляется большому, природа – индустрии, а человек – машине')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (3, 2, N'Battlefield 4', CAST(899.40 AS Decimal(16, 2)), N'Battlefield 4 – это определяющий для жанра, полный экшена боевик, известный своей разрушаемостью, равных которой нет')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (4, 1, N'The Sims 4', CAST(15.00 AS Decimal(16, 2)), N'В реальности каждому человеку дано прожить лишь одну жизнь. Но с помощью The Sims 4 это ограничение можно снять! 
		Вам решать — где, как и с кем жить, чем заниматься, чем украшать и обустраивать свой дом')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (5, 3, N'Dark Souls 2', CAST(949.00 AS Decimal(16, 2)), N'Продолжение знаменитого ролевого экшена вновь заставит игроков пройти через сложнейшие испытания. Dark Souls II предложит 
		нового героя, новую историю и новый мир. Лишь одно неизменно – выжить в мрачной вселенной Dark Souls очень непросто.')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (6, 3, N'The Elder Scrolls V: Skyrim', CAST(1000.00 AS Decimal(16, 2)), N'После убийства короля Скайрима империя оказалась на грани катастрофы. Вокруг претендентов на престол сплотились новые союзы, 
		и разгорелся конфликт. К тому же, как предсказывали древние свитки, в мир вернулись жестокие и беспощадные драконы. Теперь будущее Скайрима и всей 
		империи зависит от драконорожденного — человека, в жилах которого течет кровь легендарных существ.')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (7, 1, N'FIFA 14', CAST(699.00 AS Decimal(16, 2)), N'Достоверный, красивый, эмоциональный футбол! Проверенный временем геймплей FIFA стал ещё лучше благодаря инновациям, поощряющим творческую игру в
		 центре поля и позволяющим задавать её темп.')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (8, 1, N'Need for Speed Rivals', CAST(1000.00 AS Decimal(16, 2)), N'Забудьте про стандартные режимы игры. Сотрите грань между одиночным и многопользовательским режимом в постоянном соперничестве 
		между гонщиками и полицией. Свободно войдите в мир, в котором ваши друзья уже участвуют в гонках и погонях. ')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (9, 2, N'Crysis 3', CAST(1299.00 AS Decimal(16, 2)), N'Действие игры разворачивается в 2047 году, а вам предстоит выступить в роли Пророка.')
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description]) VALUES (10, 2, N'Dead Space 3', CAST(499.00 AS Decimal(16, 2)), N'В Dead Space 3 Айзек Кларк и суровый солдат Джон Карвер отправляются в космическое путешествие, чтобы узнать о происхождении некроморфов.')
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreId], [Genre]) VALUES (1, N'Ужасы')
INSERT [dbo].[Genre] ([GenreId], [Genre]) VALUES (2, N'Комедия')
INSERT [dbo].[Genre] ([GenreId], [Genre]) VALUES (3, N'Детектив')
INSERT [dbo].[Genre] ([GenreId], [Genre]) VALUES (4, N'Драма')
INSERT [dbo].[Genre] ([GenreId], [Genre]) VALUES (5, N'Мюзикл')
INSERT [dbo].[Genre] ([GenreId], [Genre]) VALUES (6, N'Боевик')
INSERT [dbo].[Genre] ([GenreId], [Genre]) VALUES (7, N'Триллер')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (1, 1)
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (1, 2)
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (1, 3)
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (2, 1)
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (2, 2)
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (3, 2)
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (3, 4)
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (4, 6)
INSERT [dbo].[GenreMovie] ([MovieId], [GenreId]) VALUES (5, 1)
GO
SET IDENTITY_INSERT [dbo].[Hall] ON 

INSERT [dbo].[Hall] ([HallId], [RowAmount], [SeatsAmount], [Cinema], [HallNumber], [IsVIP]) VALUES (1, 15, 17, N'Русь', 1, 0)
INSERT [dbo].[Hall] ([HallId], [RowAmount], [SeatsAmount], [Cinema], [HallNumber], [IsVIP]) VALUES (2, 15, 17, N'Мираж', 2, 1)
INSERT [dbo].[Hall] ([HallId], [RowAmount], [SeatsAmount], [Cinema], [HallNumber], [IsVIP]) VALUES (3, 20, 19, N'Титан-Арена', 3, 0)
INSERT [dbo].[Hall] ([HallId], [RowAmount], [SeatsAmount], [Cinema], [HallNumber], [IsVIP]) VALUES (5, 15, 17, N'Русь', 4, 0)
INSERT [dbo].[Hall] ([HallId], [RowAmount], [SeatsAmount], [Cinema], [HallNumber], [IsVIP]) VALUES (7, 15, 17, N'Мираж', 1, 1)
INSERT [dbo].[Hall] ([HallId], [RowAmount], [SeatsAmount], [Cinema], [HallNumber], [IsVIP]) VALUES (12, 15, 17, N'Титан-Арена', 13, 0)
INSERT [dbo].[Hall] ([HallId], [RowAmount], [SeatsAmount], [Cinema], [HallNumber], [IsVIP]) VALUES (17, 15, 17, N'Титан-Арена', 17, 0)
INSERT [dbo].[Hall] ([HallId], [RowAmount], [SeatsAmount], [Cinema], [HallNumber], [IsVIP]) VALUES (19, 15, 19, N'Титан-Арена', 1, 0)
SET IDENTITY_INSERT [dbo].[Hall] OFF
GO
INSERT [dbo].[ManagerUser] ([UserId], [Name], [Role]) VALUES (1, N'Федоров', N'Менеджер')
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId]) VALUES (1, N'абв', 120, 2022, N'фильм про абв', N'абвабв', N'16+', CAST(N'2022-09-14' AS Date), CAST(N'2023-01-05' AS Date), 7)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId]) VALUES (2, N'фильм', 60, 2023, N'описание фильма', N'постер фильма', N'0+', CAST(N'2021-05-11' AS Date), CAST(N'2021-07-11' AS Date), 1)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId]) VALUES (3, N'зеленый слоник', 105, 2000, N'зеленый слоник', N'слоник в зеленой лужайке', N'0+', CAST(N'2000-09-01' AS Date), CAST(N'2000-10-01' AS Date), 2)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId]) VALUES (4, N'лес', 120, 2005, N'лес, который бежит', N'лесной лес', N'18+', CAST(N'2005-06-09' AS Date), CAST(N'2024-09-23' AS Date), 4)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId]) VALUES (5, N'ручка', 200, 2024, N'ручка пишет', N'ручка на бумаге', N'0+', CAST(N'2024-09-25' AS Date), CAST(N'2024-11-15' AS Date), 3)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId]) VALUES (6, N'фильм 2', 150, 2025, N'фильм о фильме', N'камера', N'6+', CAST(N'2025-02-01' AS Date), CAST(N'2025-05-11' AS Date), 2)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId]) VALUES (7, N'123', 140, 2026, N'ASDS', N'123424', N'6+', CAST(N'2026-03-05' AS Date), CAST(N'2026-04-06' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (1, 2, 1, CAST(200 AS Decimal(4, 0)), CAST(N'2023-04-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (2, 1, 3, CAST(400 AS Decimal(4, 0)), CAST(N'2023-07-06T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (3, 4, 2, CAST(300 AS Decimal(4, 0)), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (5, 3, 2, CAST(150 AS Decimal(4, 0)), CAST(N'2024-10-10T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (6, 2, 2, CAST(140 AS Decimal(4, 0)), CAST(N'2024-09-27T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (7, 1, 3, CAST(400 AS Decimal(4, 0)), CAST(N'2024-09-27T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (1, 5, 1, 10, 7)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (2, 3, 1, 15, 2)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (3, 2, 1, 13, 3)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (4, 2, 2, 12, 5)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (5, 2, 2, 11, 11)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (7, 6, 2, 10, 12)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (8, 7, 2, 13, 14)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (9, 7, 2, 11, 11)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (10, 3, 2, 7, 4)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (11, 3, 2, 1, 2)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (13, 5, 3, 4, 1)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (14, 5, 2, 4, 3)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (15, 3, 1, 4, 7)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (20, 7, 2, 4, 9)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (22, 3, 3, 1, 4)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (23, 3, 5, 1, 7)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (24, 7, 5, 4, 15)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (25, 7, 5, 4, 17)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (26, 7, 5, 9, 17)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[Visitor] ON 

INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [E-mail]) VALUES (1, N'123456789 ', N'ааа', CAST(N'2010-05-13T00:00:00.0000000' AS DateTime2), N'абвабв@mail.ru')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [E-mail]) VALUES (2, N'987654321 ', N'ббб', CAST(N'2000-10-07T00:00:00.0000000' AS DateTime2), N'фывфыв@gmail.com')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [E-mail]) VALUES (3, N'1111111   ', N'ddd', NULL, NULL)
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [E-mail]) VALUES (5, N'77777777  ', N'aaaaaaa', NULL, N'jasdsad')
SET IDENTITY_INSERT [dbo].[Visitor] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Hall_Cinema]    Script Date: 30.09.2024 11:27:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Hall_Cinema] ON [dbo].[Hall]
(
	[Cinema] ASC,
	[HallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Ticket_Place]    Script Date: 30.09.2024 11:27:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Ticket_Place] ON [dbo].[Ticket]
(
	[Place] ASC,
	[Row] ASC,
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visitor_Email]    Script Date: 30.09.2024 11:27:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Visitor_Email] ON [dbo].[Visitor]
(
	[E-mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visitor_Phone]    Script Date: 30.09.2024 11:27:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Visitor_Phone] ON [dbo].[Visitor]
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hall] ADD  CONSTRAINT [DF_Hall_Cimena]  DEFAULT ('Макси') FOR [Cinema]
GO
ALTER TABLE [dbo].[Hall] ADD  CONSTRAINT [DF_Hall_IsVIP]  DEFAULT ((0)) FOR [IsVIP]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_Duration]  DEFAULT ((90)) FOR [Duration]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_ReleaseYear]  DEFAULT (datepart(year,getdate())) FOR [ReleaseYear]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Price]  DEFAULT ((200)) FOR [Price]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Is3D]  DEFAULT ((0)) FOR [Is3D]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Category]
GO
ALTER TABLE [dbo].[GenreMovie]  WITH CHECK ADD  CONSTRAINT [FK_GenreMovie_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([GenreId])
GO
ALTER TABLE [dbo].[GenreMovie] CHECK CONSTRAINT [FK_GenreMovie_Genre]
GO
ALTER TABLE [dbo].[GenreMovie]  WITH CHECK ADD  CONSTRAINT [FK_GenreMovie_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[GenreMovie] CHECK CONSTRAINT [FK_GenreMovie_Movie]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Hall] FOREIGN KEY([HallId])
REFERENCES [dbo].[Hall] ([HallId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Hall]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Movie]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Session]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Visitor] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[Visitor] ([VisitorId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Visitor]
GO
ALTER TABLE [dbo].[AdminUser]  WITH CHECK ADD  CONSTRAINT [CK_AdminUser] CHECK  (([Role]='Админ'))
GO
ALTER TABLE [dbo].[AdminUser] CHECK CONSTRAINT [CK_AdminUser]
GO
ALTER TABLE [dbo].[ClientUser]  WITH CHECK ADD  CONSTRAINT [CK_ClientUser] CHECK  (([Role]='Клиент'))
GO
ALTER TABLE [dbo].[ClientUser] CHECK CONSTRAINT [CK_ClientUser]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [CK_Hall_Cinema] CHECK  (([Cinema]='Русь' OR [Cinema]='Титан-Арена' OR [Cinema]='Мираж'))
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [CK_Hall_Cinema]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [CK_Hall_RowAmount] CHECK  (([RowAmount]>=(5) AND [RowAmount]<=(30)))
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [CK_Hall_RowAmount]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [CK_Hall_SeatsAmount] CHECK  (([SeatsAmount]>=(5) AND [SeatsAmount]<=(30)))
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [CK_Hall_SeatsAmount]
GO
ALTER TABLE [dbo].[ManagerUser]  WITH CHECK ADD  CONSTRAINT [CK_ManagerUser] CHECK  (([Role]='Менеджер'))
GO
ALTER TABLE [dbo].[ManagerUser] CHECK CONSTRAINT [CK_ManagerUser]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [CK_Place] CHECK  (([Place]>=(1)))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [CK_Place]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [CK_Row] CHECK  (([Row]>=(1)))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [CK_Row]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  StoredProcedure [dbo].[AddHall]    Script Date: 30.09.2024 11:27:47 ******/
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
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 30.09.2024 11:27:47 ******/
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Game"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Games1000'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Games1000'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Category"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 138
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Game"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RpgGames'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RpgGames'
GO
USE [master]
GO
ALTER DATABASE [ispp3503] SET  READ_WRITE 
GO
