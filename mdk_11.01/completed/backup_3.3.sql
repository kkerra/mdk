USE [ispp3503]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[ClientUser]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[DeletedCategory]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[DeletedVisitor]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Game]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[GamePrice]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[GenreMovie]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Hall]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[ManagerUser]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Sale]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[UpdateEmail]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Table [dbo].[Visitor]    Script Date: 14.10.2024 11:35:06 ******/
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
INSERT [dbo].[AdminUser] ([UserId], [Name], [Role]) VALUES (1, N'admin', N'Админ')
INSERT [dbo].[AdminUser] ([UserId], [Name], [Role]) VALUES (2, N'Смирнов', N'Админ')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Симулятор')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Шутер')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'RPG')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'arcada')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (6, N'mmo')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[ClientUser] ([UserId], [Name], [Role]) VALUES (1, N'Иванов', N'Клиент')
INSERT [dbo].[ClientUser] ([UserId], [Name], [Role]) VALUES (2, N'Петров', N'Клиент')
GO
INSERT [dbo].[DeletedCategory] ([CategoryId], [Name], [DeletedDate], [Login]) VALUES (5, N'arcada', CAST(N'2024-09-30T12:39:51.2333333' AS DateTime2), N'ispp3503')
GO
INSERT [dbo].[DeletedVisitor] ([VisitorId], [E-mail], [Name], [Birthday], [DeletionDate], [Login]) VALUES (7, N'asdadad', N'asdas', CAST(N'2005-09-07T00:00:00.000' AS DateTime), CAST(N'2024-10-01T09:42:40.853' AS DateTime), N'ispp3503')
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (1, 1, N'SimCity', CAST(1500.00 AS Decimal(16, 2)), N'Градостроительный симулятор снова с вами! Создайте город своей мечты', 0, 91)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (2, 2, N'TITANFALL', CAST(2300.00 AS Decimal(16, 2)), N'Эта игра перенесет вас во вселенную, где малое противопоставляется большому, природа – индустрии, а человек – машине', 0, 95)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (3, 2, N'Battlefield 4', CAST(900.40 AS Decimal(16, 2)), N'Battlefield 4 – это определяющий для жанра, полный экшена боевик, известный своей разрушаемостью, равных которой нет', 0, 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (4, 1, N'The Sims 4', CAST(1000.00 AS Decimal(16, 2)), N'В реальности каждому человеку дано прожить лишь одну жизнь. Но с помощью The Sims 4 это ограничение можно снять! 
		Вам решать — где, как и с кем жить, чем заниматься, чем украшать и обустраивать свой дом', 0, 100)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (5, 3, N'Dark Souls 2', CAST(950.00 AS Decimal(16, 2)), N'Продолжение знаменитого ролевого экшена вновь заставит игроков пройти через сложнейшие испытания. Dark Souls II предложит 
		нового героя, новую историю и новый мир. Лишь одно неизменно – выжить в мрачной вселенной Dark Souls очень непросто.', 0, 100)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (6, 3, N'The Elder Scrolls V: Skyrim', CAST(1500.00 AS Decimal(16, 2)), N'После убийства короля Скайрима империя оказалась на грани катастрофы. Вокруг претендентов на престол сплотились новые союзы, 
		и разгорелся конфликт. К тому же, как предсказывали древние свитки, в мир вернулись жестокие и беспощадные драконы. Теперь будущее Скайрима и всей 
		империи зависит от драконорожденного — человека, в жилах которого течет кровь легендарных существ.', 0, 100)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (7, 1, N'FIFA 14', CAST(1000.00 AS Decimal(16, 2)), N'Достоверный, красивый, эмоциональный футбол! Проверенный временем геймплей FIFA стал ещё лучше благодаря инновациям, поощряющим творческую игру в
		 центре поля и позволяющим задавать её темп.', 1, 100)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (8, 1, N'Need for Speed Rivals', CAST(1001.00 AS Decimal(16, 2)), N'Забудьте про стандартные режимы игры. Сотрите грань между одиночным и многопользовательским режимом в постоянном соперничестве 
		между гонщиками и полицией. Свободно войдите в мир, в котором ваши друзья уже участвуют в гонках и погонях. ', 0, 100)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (9, 2, N'Crysis 3', CAST(1300.00 AS Decimal(16, 2)), N'Действие игры разворачивается в 2047 году, а вам предстоит выступить в роли Пророка.', 0, 100)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted], [TotalKeys]) VALUES (10, 2, N'Dead Space 3', CAST(500.00 AS Decimal(16, 2)), N'В Dead Space 3 Айзек Кларк и суровый солдат Джон Карвер отправляются в космическое путешествие, чтобы узнать о происхождении некроморфов.', 0, 100)
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
INSERT [dbo].[GamePrice] ([GameId], [Price], [ChangingDate]) VALUES (4, CAST(16.00 AS Decimal(16, 2)), CAST(N'2024-09-30T12:30:16.7666667' AS DateTime2))
INSERT [dbo].[GamePrice] ([GameId], [Price], [ChangingDate]) VALUES (6, CAST(1001.00 AS Decimal(16, 2)), CAST(N'2024-09-30T12:30:21.7300000' AS DateTime2))
INSERT [dbo].[GamePrice] ([GameId], [Price], [ChangingDate]) VALUES (7, CAST(700.00 AS Decimal(16, 2)), CAST(N'2024-10-01T09:24:53.0766667' AS DateTime2))
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

INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId], [IsDeleted]) VALUES (1, N'абв', 120, 2022, N'фильм про абв', N'абвабв', N'16+', CAST(N'2022-09-14' AS Date), CAST(N'2023-01-05' AS Date), 7, 0)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId], [IsDeleted]) VALUES (2, N'фильм', 60, 2023, N'описание фильма', N'постер фильма', N'0+', CAST(N'2021-05-11' AS Date), CAST(N'2021-07-11' AS Date), 1, 0)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId], [IsDeleted]) VALUES (3, N'зеленый слоник', 105, 2000, N'зеленый слоник', N'слоник в зеленой лужайке', N'0+', CAST(N'2000-09-01' AS Date), CAST(N'2000-10-01' AS Date), 2, 0)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId], [IsDeleted]) VALUES (4, N'лес', 120, 2005, N'лес, который бежит', N'лесной лес', N'18+', CAST(N'2005-06-09' AS Date), CAST(N'2024-09-23' AS Date), 4, 0)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId], [IsDeleted]) VALUES (5, N'ручка', 200, 2024, N'ручка пишет', N'ручка на бумаге', N'0+', CAST(N'2024-09-25' AS Date), CAST(N'2024-11-15' AS Date), 3, 0)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId], [IsDeleted]) VALUES (6, N'фильм 2', 150, 2025, N'фильм о фильме', N'камера', N'6+', CAST(N'2025-02-01' AS Date), CAST(N'2025-05-11' AS Date), 2, 1)
INSERT [dbo].[Movie] ([MovieId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalBeginning], [RentalEnd], [GenreId], [IsDeleted]) VALUES (7, N'123', 140, 2026, N'ASDS', N'123424', N'6+', CAST(N'2026-03-05' AS Date), CAST(N'2026-04-06' AS Date), 3, 0)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([SaleId], [GameId], [SaledKeys]) VALUES (1, 1, 3)
INSERT [dbo].[Sale] ([SaleId], [GameId], [SaledKeys]) VALUES (2, 1, 3)
INSERT [dbo].[Sale] ([SaleId], [GameId], [SaledKeys]) VALUES (3, 1, 3)
INSERT [dbo].[Sale] ([SaleId], [GameId], [SaledKeys]) VALUES (4, 1, 3)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (1, 2, 1, CAST(200 AS Decimal(4, 0)), CAST(N'2023-04-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (2, 1, 3, CAST(400 AS Decimal(4, 0)), CAST(N'2023-07-06T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (3, 4, 2, CAST(300 AS Decimal(4, 0)), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (5, 3, 2, CAST(150 AS Decimal(4, 0)), CAST(N'2024-10-10T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (6, 2, 2, CAST(140 AS Decimal(4, 0)), CAST(N'2024-09-27T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (7, 1, 3, CAST(400 AS Decimal(4, 0)), CAST(N'2024-09-27T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (8, 1, 3, CAST(400 AS Decimal(4, 0)), CAST(N'2024-10-01T10:03:23.9666667' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (9, 1, 3, CAST(400 AS Decimal(4, 0)), CAST(N'2024-10-01T10:04:26.8000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (10, 1, 2, CAST(400 AS Decimal(4, 0)), CAST(N'2024-10-01T10:05:18.8200000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (11, 2, 2, CAST(222 AS Decimal(4, 0)), CAST(N'2024-10-01T10:06:29.8933333' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (12, 2, 2, CAST(100 AS Decimal(4, 0)), CAST(N'2024-10-01T10:06:40.2333333' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (13, 2, 2, CAST(100 AS Decimal(4, 0)), CAST(N'2024-10-01T10:10:48.0200000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [MovieId], [HallId], [Price], [DateTime], [Is3D]) VALUES (14, 2, 2, CAST(150 AS Decimal(4, 0)), CAST(N'2024-10-01T10:11:02.3800000' AS DateTime2), 0)
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
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (28, 2, 1, 15, 11)
INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Place], [Row]) VALUES (29, 2, 1, 16, 11)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
INSERT [dbo].[UpdateEmail] ([VisitorId], [E-mail], [ChangeDate]) VALUES (1, N'абвабв@mail.ru', CAST(N'2024-10-01T09:12:04.323' AS DateTime))
INSERT [dbo].[UpdateEmail] ([VisitorId], [E-mail], [ChangeDate]) VALUES (2, N'assdasda', CAST(N'2024-10-01T09:12:04.323' AS DateTime))
INSERT [dbo].[UpdateEmail] ([VisitorId], [E-mail], [ChangeDate]) VALUES (3, N'asdasda', CAST(N'2024-10-01T09:23:15.947' AS DateTime))
INSERT [dbo].[UpdateEmail] ([VisitorId], [E-mail], [ChangeDate]) VALUES (5, N'aaaaaaaaaa', CAST(N'2024-10-01T09:29:57.057' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Visitor] ON 

INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (1, N'123456789 ', N'ааа', CAST(N'2010-05-13T00:00:00.0000000' AS DateTime2), N'абвабв@mail.ru')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (2, N'987654321 ', N'ббб', CAST(N'2000-10-07T00:00:00.0000000' AS DateTime2), N'assdasda')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (3, N'1111111   ', N'ddd', CAST(N'2000-11-11T00:00:00.0000000' AS DateTime2), N'bbbbbbbbbbb')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (5, N'77777777  ', N'aaaaaaa', CAST(N'2000-01-14T00:00:00.0000000' AS DateTime2), N'иииииииииииииииииии')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (6, N'12321312  ', N'ASDASDA', CAST(N'1999-04-15T00:00:00.0000000' AS DateTime2), N'asdasda')
SET IDENTITY_INSERT [dbo].[Visitor] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Hall_Cinema]    Script Date: 14.10.2024 11:35:06 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Hall_Cinema] ON [dbo].[Hall]
(
	[Cinema] ASC,
	[HallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Ticket_Place]    Script Date: 14.10.2024 11:35:06 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Ticket_Place] ON [dbo].[Ticket]
(
	[Place] ASC,
	[Row] ASC,
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visitor_Email]    Script Date: 14.10.2024 11:35:06 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Visitor_Email] ON [dbo].[Visitor]
(
	[Email] ASC,
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visitor_Phone]    Script Date: 14.10.2024 11:35:06 ******/
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
/****** Object:  Trigger [dbo].[trSaveCategory]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trSaveCategory] --учет изменения цен
ON [dbo].[Category]
AFTER DELETE
AS
BEGIN 
	INSERT INTO DeletedCategory(CategoryId, Name, DeletedDate, Login)
	SELECT CategoryId, Name, GetDate(), ORIGINAL_LOGIN()
	FROM deleted;
END
GO
ALTER TABLE [dbo].[Category] ENABLE TRIGGER [trSaveCategory]
GO
/****** Object:  Trigger [dbo].[trChangedGamesCount]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trChangedGamesCount]
ON [dbo].[Game]
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
    PRINT CONCAT_WS(' ','Изменено строк: ', @@ROWCOUNT)
END
GO
ALTER TABLE [dbo].[Game] ENABLE TRIGGER [trChangedGamesCount]
GO
/****** Object:  Trigger [dbo].[trDeleteGame]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trDeleteGame]
ON [dbo].[Game]
INSTEAD OF DELETE
AS
BEGIN 
	UPDATE Game 
	SET IsDeleted = 1
	WHERE GameId IN (SELECT GameId 
					 FROM deleted)
END
GO
ALTER TABLE [dbo].[Game] ENABLE TRIGGER [trDeleteGame]
GO
/****** Object:  Trigger [dbo].[trSavePrice]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[trSavePrice]
ON [dbo].[Game]
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Price) 
		INSERT INTO GamePrice(GameId, Price)
		SELECT GameId, Price
		FROM deleted
END
GO
ALTER TABLE [dbo].[Game] ENABLE TRIGGER [trSavePrice]
GO
/****** Object:  Trigger [dbo].[trDeleteMovie]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trDeleteMovie]
ON [dbo].[Movie]
INSTEAD OF DELETE
AS
BEGIN
	UPDATE Movie
	SET IsDeleted = 1
	WHERE MovieId IN (SELECT MovieId
					  FROM deleted)
END;
GO
ALTER TABLE [dbo].[Movie] ENABLE TRIGGER [trDeleteMovie]
GO
/****** Object:  Trigger [dbo].[TrChangeKeysCount]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TrChangeKeysCount]
ON [dbo].[Sale]
AFTER INSERT
AS 
	UPDATE Game
	SET TotalKeys -= SaledKeys
	FROM Game JOIN inserted ON Game.GameId = inserted.GameId
GO
ALTER TABLE [dbo].[Sale] ENABLE TRIGGER [TrChangeKeysCount]
GO
/****** Object:  Trigger [dbo].[TrChangeKeysCountWithCheck]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TrChangeKeysCountWithCheck]
ON [dbo].[Sale]
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
GO
ALTER TABLE [dbo].[Sale] ENABLE TRIGGER [TrChangeKeysCountWithCheck]
GO
/****** Object:  Trigger [dbo].[trChangePrice]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trChangePrice]
ON [dbo].[Session]
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO Session(MovieId, HallId, Price)
	SELECT MovieId, HallId, CASE WHEN Price < 100 THEN 100
							ELSE Price END
	FROM inserted
end;
GO
ALTER TABLE [dbo].[Session] ENABLE TRIGGER [trChangePrice]
GO
/****** Object:  Trigger [dbo].[trDeleteVisitor]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trDeleteVisitor]
ON [dbo].[Visitor]
AFTER DELETE
AS
BEGIN
	INSERT INTO DeletedVisitor(VisitorId, [E-mail], Name, Birthday, DeletionDate, Login)
	SELECT VisitorId, [E-mail], Name, Birthday, GETDATE(), ORIGINAL_LOGIN()
	FROM deleted
END;
GO
ALTER TABLE [dbo].[Visitor] ENABLE TRIGGER [trDeleteVisitor]
GO
/****** Object:  Trigger [dbo].[trUpdateEmail]    Script Date: 14.10.2024 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trUpdateEmail]
ON [dbo].[Visitor]
AFTER UPDATE
AS
BEGIN
	IF UPDATE([E-mail])
		BEGIN
			INSERT INTO UpdateEmail(VisitorId, [E-mail])
			SELECT VisitorId, [E-mail]
			FROM deleted
		END
END
GO
ALTER TABLE [dbo].[Visitor] ENABLE TRIGGER [trUpdateEmail]
GO
