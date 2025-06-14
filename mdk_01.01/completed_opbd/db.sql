USE [master]
GO
/****** Object:  Database [ispp3503]    Script Date: 07.06.2024 14:07:38 ******/
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
/****** Object:  User [teacher]    Script Date: 07.06.2024 14:07:38 ******/
CREATE USER [teacher] FOR LOGIN [ispp3515] WITH DEFAULT_SCHEMA=[teacher]
GO
/****** Object:  Schema [teacher]    Script Date: 07.06.2024 14:07:38 ******/
CREATE SCHEMA [teacher]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[authorId] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[country] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[authorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[bookId] [int] IDENTITY(1,1) NOT NULL,
	[authorId] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[genre] [nvarchar](10) NOT NULL,
	[price] [decimal](6, 2) NOT NULL,
	[weight] [decimal](4, 3) NOT NULL,
	[pagesCount] [smallint] NOT NULL,
	[publicationYear] [smallint] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content1]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content1](
	[orderId] [int] NOT NULL,
	[bookId] [int] NOT NULL,
	[amount] [tinyint] NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](20) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [varchar](20) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpensiveGames]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpensiveGames](
	[name] [varchar](100) NOT NULL,
	[price] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[idGame] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](500) NULL,
	[category] [varchar](50) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idGame] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order1]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order1](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[orderDatetime] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionalGoods]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionalGoods](
	[promotionId] [int] NOT NULL,
	[bookId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[promotionId] ASC,
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[promotionId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[discountAmount] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NULL,
	[discountType] [varchar](5) NULL,
 CONSTRAINT [PK__Promotio__5AC8420A87D3E8FE] PRIMARY KEY CLUSTERED 
(
	[promotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prose]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prose](
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[price] [decimal](6, 2) NOT NULL,
	[publicationYear] [smallint] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (1, N'Пушкин', N'Александр', N'Россия')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (2, N'Тилье', N'Франк', N'Фрация')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (3, N'Достоевский', N'Федор', N'Россия')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (4, N'Стивен', N'Кинг', N'США')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (5, N'Гоголь', N'Николай', N'Россия')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (6, N'abc', N'abc', N'Франция')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (7, N'aaa', N'sads', N'Италия')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (8, N'aaa1', N'sads1', N'Италия')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (9, N'abcde', N'abcde', N'Беларусь')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (10, N'abcdef', N'abcdef', N'Беларусь')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (12, N'abcd', N'abcd', N'Беларусь')
INSERT [dbo].[Author] ([authorId], [surname], [name], [country]) VALUES (14, N'aaa1', N'sads12', N'Италия')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (1, 1, N'стихи', N'проза', CAST(162.00 AS Decimal(6, 2)), CAST(0.000 AS Decimal(4, 3)), 0, NULL)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (4, 1, N'Стихи', N'поэзия', CAST(720.00 AS Decimal(6, 2)), CAST(0.300 AS Decimal(4, 3)), 300, 2000)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (5, 2, N'рассказы', N'другое', CAST(300.00 AS Decimal(6, 2)), CAST(0.500 AS Decimal(4, 3)), 500, 2000)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (6, 3, N'поэмы', N'поэзия', CAST(607.50 AS Decimal(6, 2)), CAST(0.200 AS Decimal(4, 3)), 100, 1234)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (7, 2, N'истории', N'другое', CAST(560.00 AS Decimal(6, 2)), CAST(0.400 AS Decimal(4, 3)), 200, 456)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (8, 3, N'загадки', N'проза', CAST(2280.00 AS Decimal(6, 2)), CAST(1.500 AS Decimal(4, 3)), 1000, 2024)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (9, 2, N'анекдоты', N'поэзия', CAST(1530.00 AS Decimal(6, 2)), CAST(0.100 AS Decimal(4, 3)), 200, 2000)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (10, 3, N'книга', N'проза', CAST(469.80 AS Decimal(6, 2)), CAST(0.000 AS Decimal(4, 3)), 0, 2015)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (11, 2, N'wqew', N'проза', CAST(97.20 AS Decimal(6, 2)), CAST(0.000 AS Decimal(4, 3)), 0, 2020)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (12, 2, N'книга', N'проза', CAST(97.20 AS Decimal(6, 2)), CAST(0.000 AS Decimal(4, 3)), 0, 2015)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (13, 1, N'книга1', N'проза', CAST(307.80 AS Decimal(6, 2)), CAST(0.000 AS Decimal(4, 3)), 0, 2005)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (14, 3, N'книга2', N'проза', CAST(307.80 AS Decimal(6, 2)), CAST(0.000 AS Decimal(4, 3)), 0, 2005)
INSERT [dbo].[Book] ([bookId], [authorId], [title], [genre], [price], [weight], [pagesCount], [publicationYear]) VALUES (15, 3, N'книга2', N'проза', CAST(372.60 AS Decimal(6, 2)), CAST(0.000 AS Decimal(4, 3)), 0, 2005)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
INSERT [dbo].[Content1] ([orderId], [bookId], [amount]) VALUES (1, 4, 2)
INSERT [dbo].[Content1] ([orderId], [bookId], [amount]) VALUES (1, 9, 1)
INSERT [dbo].[Content1] ([orderId], [bookId], [amount]) VALUES (2, 5, 6)
INSERT [dbo].[Content1] ([orderId], [bookId], [amount]) VALUES (3, 7, 16)
INSERT [dbo].[Content1] ([orderId], [bookId], [amount]) VALUES (3, 9, 6)
INSERT [dbo].[Content1] ([orderId], [bookId], [amount]) VALUES (6, 8, 1)
INSERT [dbo].[Content1] ([orderId], [bookId], [amount]) VALUES (8, 15, 5)
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerId], [login], [surname], [name], [address], [phone]) VALUES (1, N'123', N'абв', N'где', N'ленина, 1', N'+79000000000')
INSERT [dbo].[Customer] ([customerId], [login], [surname], [name], [address], [phone]) VALUES (2, N'456', N'ывдалы', N'ывдвлы', N'московский, 3', N'+79123456789')
INSERT [dbo].[Customer] ([customerId], [login], [surname], [name], [address], [phone]) VALUES (3, N'789', N'заказчик', N'заказ', N'никитова, 10', N'+79987654321')
INSERT [dbo].[Customer] ([customerId], [login], [surname], [name], [address], [phone]) VALUES (5, N'3424', N'sdfdsf', N'ghgfh', N'werewr', NULL)
INSERT [dbo].[Customer] ([customerId], [login], [surname], [name], [address], [phone]) VALUES (6, N'34212', N'sdfsdf', N'qweqr', N'erwerw', NULL)
INSERT [dbo].[Customer] ([customerId], [login], [surname], [name], [address], [phone]) VALUES (8, N'1234', N'1234', N'234242', N'21323', NULL)
INSERT [dbo].[Customer] ([customerId], [login], [surname], [name], [address], [phone]) VALUES (9, N'23432', N'234234', N'453543', N'    ', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (1, N'SimCity', N'Градостроительный симулятор снова с вами! Создайте город своей мечты', N'Симулятор', CAST(1499.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (2, N'TITANFALL', N'Эта игра перенесет вас во вселенную, где малое противопоставляется большому, природа – индустрии, а человек – машине', N'Шутер', CAST(2299.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (3, N'Battlefield 4', N'Battlefield 4 – это определяющий для жанра, полный экшена боевик, известный своей разрушаемостью, равных которой нет', N'Шутер', CAST(899.40 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (4, N'The Sims 4', N'В реальности каждому человеку дано прожить лишь одну жизнь. Но с помощью The Sims 4 это ограничение можно снять! Вам решать — где, как и с кем жить, чем заниматься, чем украшать и обустраивать свой дом', N'Симулятор', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (5, N'Dark Souls 2', N'Продолжение знаменитого ролевого экшена вновь заставит игроков пройти через сложнейшие испытания. Dark Souls II предложит нового героя, новую историю и новый мир. Лишь одно неизменно – выжить в мрачной вселенной Dark Souls очень непросто', N'RPG', CAST(949.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (6, N'The Elder Scrolls V: Skyrim', N'После убийства короля Скайрима империя оказалась на грани катастрофы. Вокруг претендентов на престол сплотились новые союзы, и разгорелся конфликт', N'RPG', CAST(1399.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (7, N'FIFA 14', N'Достоверный, красивый, эмоциональный футбол! Проверенный временем геймплей FIFA стал ещё лучше благодаря инновациям, поощряющим творческую игру в центре поля и позволяющим задавать её темп', N'Симулятор', CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (8, N'Need for Speed Rivals', N'Забудьте про стандартные режимы игры. Сотрите грань между одиночным и многопользовательским режимом в постоянном соперничестве между гонщиками и полицией', N'Симулятор', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (9, N'Crysis 3', N'Действие игры разворачивается в 2047 году, а вам предстоит выступить в роли Пророка', N'Шутер', CAST(1299.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (10, N'Dead Space 3', N'В Dead Space 3 Айзек Кларк и суровый солдат Джон Карвер отправляются в космическое путешествие, чтобы узнать о происхождении некроморфов', N'Шутер', CAST(499.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (11, N'Minecraft', NULL, N'RPG', CAST(123.45 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (12, N'Minecraft', NULL, N'RPG', CAST(123.45 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (13, N'Dota 2', NULL, N'RPG', CAST(1.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (14, N'tetris', N'asdasjkd', N'RPG', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (15, N'tetris123', NULL, N'RPG', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (16, N'asd', NULL, N'survival', CAST(777.00 AS Decimal(10, 2)))
INSERT [dbo].[Games] ([idGame], [name], [description], [category], [price]) VALUES (17, N'asd', NULL, N'survival', CAST(777.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Order1] ON 

INSERT [dbo].[Order1] ([orderId], [customerId], [orderDatetime]) VALUES (1, 1, CAST(N'2024-05-11T10:46:05.223' AS DateTime))
INSERT [dbo].[Order1] ([orderId], [customerId], [orderDatetime]) VALUES (2, 2, CAST(N'2024-05-11T10:46:07.183' AS DateTime))
INSERT [dbo].[Order1] ([orderId], [customerId], [orderDatetime]) VALUES (3, 3, CAST(N'2024-05-11T10:46:07.920' AS DateTime))
INSERT [dbo].[Order1] ([orderId], [customerId], [orderDatetime]) VALUES (6, 2, CAST(N'2024-05-11T10:46:45.627' AS DateTime))
INSERT [dbo].[Order1] ([orderId], [customerId], [orderDatetime]) VALUES (7, 2, CAST(N'2024-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Order1] ([orderId], [customerId], [orderDatetime]) VALUES (8, 2, CAST(N'2023-11-11T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order1] OFF
GO
INSERT [dbo].[Prose] ([surname], [name], [title], [price], [publicationYear]) VALUES (N'Пушкин', N'Александр', N'Сказки', CAST(19.00 AS Decimal(6, 2)), NULL)
INSERT [dbo].[Prose] ([surname], [name], [title], [price], [publicationYear]) VALUES (N'Достоевский', N'Федор', N'загадки', CAST(2080.45 AS Decimal(6, 2)), 2024)
INSERT [dbo].[Prose] ([surname], [name], [title], [price], [publicationYear]) VALUES (N'Достоевский', N'Федор', N'книга', CAST(181.00 AS Decimal(6, 2)), 2015)
INSERT [dbo].[Prose] ([surname], [name], [title], [price], [publicationYear]) VALUES (N'Тилье', N'Франк', N'wqew', CAST(-81.00 AS Decimal(6, 2)), 2020)
INSERT [dbo].[Prose] ([surname], [name], [title], [price], [publicationYear]) VALUES (N'Тилье', N'Франк', N'книга', CAST(-81.00 AS Decimal(6, 2)), 2015)
INSERT [dbo].[Prose] ([surname], [name], [title], [price], [publicationYear]) VALUES (N'Пушкин', N'Александр', N'книга1', CAST(181.00 AS Decimal(6, 2)), 2005)
INSERT [dbo].[Prose] ([surname], [name], [title], [price], [publicationYear]) VALUES (N'Достоевский', N'Федор', N'книга2', CAST(181.00 AS Decimal(6, 2)), 2005)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_AuthorName]    Script Date: 07.06.2024 14:07:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_AuthorName] ON [dbo].[Author]
(
	[name] ASC,
	[surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Login]    Script Date: 07.06.2024 14:07:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Login] ON [dbo].[Customer]
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Author] ADD  CONSTRAINT [DF_Author_country]  DEFAULT (N'Россия') FOR [country]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_genre]  DEFAULT (N'проза') FOR [genre]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_weight]  DEFAULT ((0)) FOR [weight]
GO
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_pagesCount]  DEFAULT ((0)) FOR [pagesCount]
GO
ALTER TABLE [dbo].[Content1] ADD  CONSTRAINT [DF_Content_amount]  DEFAULT ((1)) FOR [amount]
GO
ALTER TABLE [dbo].[Games] ADD  CONSTRAINT [DF_Games_category]  DEFAULT ('RPG') FOR [category]
GO
ALTER TABLE [dbo].[Games] ADD  CONSTRAINT [DF_Games_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Order1] ADD  CONSTRAINT [DF_Order_orderDatetime]  DEFAULT (getdate()) FOR [orderDatetime]
GO
ALTER TABLE [dbo].[Promotions] ADD  CONSTRAINT [DF__Promotion__start__2B0A656D]  DEFAULT (getdate()) FOR [startDate]
GO
ALTER TABLE [dbo].[Promotions] ADD  CONSTRAINT [DF_Promotions_discountType]  DEFAULT ('%') FOR [discountType]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([authorId])
REFERENCES [dbo].[Author] ([authorId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Content1]  WITH CHECK ADD  CONSTRAINT [FK_Content_Book] FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([bookId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Content1] CHECK CONSTRAINT [FK_Content_Book]
GO
ALTER TABLE [dbo].[Content1]  WITH CHECK ADD  CONSTRAINT [FK_Content_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order1] ([orderId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Content1] CHECK CONSTRAINT [FK_Content_Order]
GO
ALTER TABLE [dbo].[Order1]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([customerId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order1] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[PromotionalGoods]  WITH CHECK ADD  CONSTRAINT [FK_Book_PromotionalGoods] FOREIGN KEY([bookId])
REFERENCES [dbo].[Book] ([bookId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PromotionalGoods] CHECK CONSTRAINT [FK_Book_PromotionalGoods]
GO
ALTER TABLE [dbo].[PromotionalGoods]  WITH CHECK ADD  CONSTRAINT [FK_Promotions_PromotionalGoods] FOREIGN KEY([promotionId])
REFERENCES [dbo].[Promotions] ([promotionId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PromotionalGoods] CHECK CONSTRAINT [FK_Promotions_PromotionalGoods]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [CK_BookGenre] CHECK  (([genre]='проза' OR [genre]='поэзия' OR [genre]='другое'))
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [CK_BookGenre]
GO
ALTER TABLE [dbo].[Content1]  WITH CHECK ADD  CONSTRAINT [CK_ContentAmount] CHECK  (([amount]>(0) AND [amount]<=(100)))
GO
ALTER TABLE [dbo].[Content1] CHECK CONSTRAINT [CK_ContentAmount]
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD  CONSTRAINT [CK_Promotions_discountAmount] CHECK  (([discountAmount]>(0)))
GO
ALTER TABLE [dbo].[Promotions] CHECK CONSTRAINT [CK_Promotions_discountAmount]
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD  CONSTRAINT [CK_Promotions_discountType] CHECK  (([discountType]='руб.' OR [discountType]='%'))
GO
ALTER TABLE [dbo].[Promotions] CHECK CONSTRAINT [CK_Promotions_discountType]
GO
/****** Object:  StoredProcedure [dbo].[GetBooks]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooks]
	@startPrice DECIMAL(6,2),
	@endPrice DECIMAL(6,2)
AS
	SELECT *
	FROM Book
	WHERE price BETWEEN @startPrice AND @endPrice
GO
/****** Object:  StoredProcedure [dbo].[GetId]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetId]
	@surname VARCHAR(50),
    @name VARCHAR(50), 
	@country VARCHAR(30)
AS
    INSERT INTO Author(surname, name, country)
	VALUES(@surname, @name, @country)
	SELECT SCOPE_IDENTITY() AS LastInsertedId
GO
/****** Object:  StoredProcedure [dbo].[GetNewAuthorId]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNewAuthorId]
	@surname VARCHAR(50),
    @name VARCHAR(50), 
	@country VARCHAR(30)
AS
    INSERT INTO Author(surname, name, country)
	VALUES(@surname, @name, @country)
	SELECT SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[InsertAuthor]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAuthor]
    @surname VARCHAR(50),
    @name VARCHAR(50), 
	@country VARCHAR(30)
AS
    INSERT INTO Author(surname, name, country)
	VALUES(@surname, @name, @country)
GO
/****** Object:  StoredProcedure [dbo].[Proc1]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc1] 
    @param1 int = 0,
    @param2 int  
AS
    SELECT @param1+@param2
GO
/****** Object:  StoredProcedure [dbo].[Proc2]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc2] 
    @name VARCHAR(100),
    @category VARCHAR(50),
	@price DECIMAL(10,2)
AS
    INSERT INTO Games(name, category, price)
	VALUES(@name, @category, @price)
GO
/****** Object:  StoredProcedure [dbo].[Proc3]    Script Date: 07.06.2024 14:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proc3] 
    @category VARCHAR(50)
AS
    SELECT *
	FROM Games
	WHERE category=@category
GO
USE [master]
GO
ALTER DATABASE [ispp3503] SET  READ_WRITE 
GO
