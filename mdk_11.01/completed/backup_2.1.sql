USE [master]
GO
/****** Object:  Database [ispp3503]    Script Date: 14.10.2024 11:18:43 ******/
CREATE DATABASE [ispp3503]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ispp3503', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ispp3503.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ispp3503_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ispp3503_log.ldf' , SIZE = 7616KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [user4]    Script Date: 14.10.2024 11:18:43 ******/
CREATE USER [user4] FOR LOGIN [login4] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [user3]    Script Date: 14.10.2024 11:18:43 ******/
CREATE USER [user3] FOR LOGIN [login3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [user2]    Script Date: 14.10.2024 11:18:43 ******/
CREATE USER [user2] FOR LOGIN [login2] WITH DEFAULT_SCHEMA=[user2]
GO
/****** Object:  User [user1]    Script Date: 14.10.2024 11:18:43 ******/
CREATE USER [user1] FOR LOGIN [login1] WITH DEFAULT_SCHEMA=[user1]
GO
/****** Object:  User [reader4]    Script Date: 14.10.2024 11:18:43 ******/
CREATE USER [reader4] FOR LOGIN [reader4] WITH DEFAULT_SCHEMA=[reader4]
GO
/****** Object:  User [reader3]    Script Date: 14.10.2024 11:18:43 ******/
CREATE USER [reader3] FOR LOGIN [reader3] WITH DEFAULT_SCHEMA=[reader3]
GO
/****** Object:  User [reader2]    Script Date: 14.10.2024 11:18:43 ******/
CREATE USER [reader2] FOR LOGIN [reader2] WITH DEFAULT_SCHEMA=[reader2]
GO
/****** Object:  User [reader1]    Script Date: 14.10.2024 11:18:43 ******/
CREATE USER [reader1] FOR LOGIN [reader1] WITH DEFAULT_SCHEMA=[reader1]
GO
/****** Object:  Schema [reader1]    Script Date: 14.10.2024 11:18:44 ******/
CREATE SCHEMA [reader1]
GO
/****** Object:  Schema [reader2]    Script Date: 14.10.2024 11:18:44 ******/
CREATE SCHEMA [reader2]
GO
/****** Object:  Schema [reader3]    Script Date: 14.10.2024 11:18:44 ******/
CREATE SCHEMA [reader3]
GO
/****** Object:  Schema [reader4]    Script Date: 14.10.2024 11:18:44 ******/
CREATE SCHEMA [reader4]
GO
/****** Object:  Schema [user1]    Script Date: 14.10.2024 11:18:44 ******/
CREATE SCHEMA [user1]
GO
/****** Object:  Schema [user2]    Script Date: 14.10.2024 11:18:44 ******/
CREATE SCHEMA [user2]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPrice]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetSum]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetTicketCost]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetTotalPoints]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[Game]    Script Date: 14.10.2024 11:18:44 ******/
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
	[IsDeleted] [bit] NULL,
	[TotalKeys] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetGamesByCategory]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[Hall]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 14.10.2024 11:18:44 ******/
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
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTodaySession]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetMoviesByGenre]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  View [dbo].[RpgGames]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  View [dbo].[Games1000]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GetMoviesByVisitor]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[AdminUser]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[ClientUser]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[ManagerUser]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  View [dbo].[UsersView]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  View [dbo].[SessionInfo]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  View [dbo].[MovieInfo]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  View [dbo].[FutureRentals]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[DeletedCategory]    Script Date: 14.10.2024 11:18:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeletedCategory](
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DeletedDate] [datetime2](7) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeletedVisitor]    Script Date: 14.10.2024 11:18:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeletedVisitor](
	[VisitorId] [int] NOT NULL,
	[E-mail] [varchar](150) NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[DeletionDate] [datetime] NULL,
	[Login] [nvarchar](100) NULL,
 CONSTRAINT [PK_DeletedVisitor] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GamePrice]    Script Date: 14.10.2024 11:18:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePrice](
	[GameId] [int] NOT NULL,
	[Price] [decimal](16, 2) NOT NULL,
	[ChangingDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_GamePrice] PRIMARY KEY CLUSTERED 
(
	[GameId] ASC,
	[ChangingDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenreMovie]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  Table [dbo].[Sale]    Script Date: 14.10.2024 11:18:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[SaledKeys] [int] NOT NULL,
 CONSTRAINT [PK__Sale__1EE3C3FFB8526AD1] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdateEmail]    Script Date: 14.10.2024 11:18:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateEmail](
	[VisitorId] [int] NOT NULL,
	[E-mail] [varchar](150) NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UpdateEmail] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC,
	[ChangeDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 14.10.2024 11:18:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor](
	[VisitorId] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [char](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [datetime2](7) NULL,
	[Email] [varchar](150) NULL,
 CONSTRAINT [PK_Visitor] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Hall_Cinema]    Script Date: 14.10.2024 11:18:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Hall_Cinema] ON [dbo].[Hall]
(
	[Cinema] ASC,
	[HallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Ticket_Place]    Script Date: 14.10.2024 11:18:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Ticket_Place] ON [dbo].[Ticket]
(
	[Place] ASC,
	[Row] ASC,
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visitor_Email]    Script Date: 14.10.2024 11:18:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Visitor_Email] ON [dbo].[Visitor]
(
	[Email] ASC,
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visitor_Phone]    Script Date: 14.10.2024 11:18:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Visitor_Phone] ON [dbo].[Visitor]
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeletedVisitor] ADD  DEFAULT (getdate()) FOR [DeletionDate]
GO
ALTER TABLE [dbo].[Game] ADD  CONSTRAINT [DF_Game_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Game] ADD  CONSTRAINT [DF_Game_TotalKeys]  DEFAULT ((100)) FOR [TotalKeys]
GO
ALTER TABLE [dbo].[GamePrice] ADD  DEFAULT (getdate()) FOR [ChangingDate]
GO
ALTER TABLE [dbo].[Hall] ADD  CONSTRAINT [DF_Hall_Cimena]  DEFAULT ('Макси') FOR [Cinema]
GO
ALTER TABLE [dbo].[Hall] ADD  CONSTRAINT [DF_Hall_IsVIP]  DEFAULT ((0)) FOR [IsVIP]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_Duration]  DEFAULT ((90)) FOR [Duration]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_ReleaseYear]  DEFAULT (datepart(year,getdate())) FOR [ReleaseYear]
GO
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF__Movie__IsDeleted__740F363E]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Price]  DEFAULT ((200)) FOR [Price]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Is3D]  DEFAULT ((0)) FOR [Is3D]
GO
ALTER TABLE [dbo].[UpdateEmail] ADD  CONSTRAINT [DF__UpdateEma__Chang__6E565CE8]  DEFAULT (getdate()) FOR [ChangeDate]
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
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  StoredProcedure [dbo].[AddHall]    Script Date: 14.10.2024 11:18:44 ******/
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
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 14.10.2024 11:18:44 ******/
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
