USE [ispp3503]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Table [dbo].[GenreMovie]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Table [dbo].[Hall]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Table [dbo].[Visitor]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Index [UQ_Hall_Cinema]    Script Date: 14.10.2024 11:31:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Hall_Cinema] ON [dbo].[Hall]
(
	[Cinema] ASC,
	[HallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Ticket_Place]    Script Date: 14.10.2024 11:31:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Ticket_Place] ON [dbo].[Ticket]
(
	[Place] ASC,
	[Row] ASC,
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visitor_Email]    Script Date: 14.10.2024 11:31:09 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Visitor_Email] ON [dbo].[Visitor]
(
	[Email] ASC,
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visitor_Phone]    Script Date: 14.10.2024 11:31:09 ******/
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
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF__Movie__IsDeleted__740F363E]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Price]  DEFAULT ((200)) FOR [Price]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Is3D]  DEFAULT ((0)) FOR [Is3D]
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
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [CK_Place] CHECK  (([Place]>=(1)))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [CK_Place]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [CK_Row] CHECK  (([Row]>=(1)))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [CK_Row]
GO
/****** Object:  Trigger [dbo].[trDeleteMovie]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Trigger [dbo].[trChangePrice]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Trigger [dbo].[trDeleteVisitor]    Script Date: 14.10.2024 11:31:09 ******/
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
/****** Object:  Trigger [dbo].[trUpdateEmail]    Script Date: 14.10.2024 11:31:09 ******/
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
