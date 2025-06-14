USE [ispp3503]
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
SET IDENTITY_INSERT [dbo].[Visitor] ON 

INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (1, N'123456789 ', N'ааа', CAST(N'2010-05-13T00:00:00.0000000' AS DateTime2), N'абвабв@mail.ru')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (2, N'987654321 ', N'ббб', CAST(N'2000-10-07T00:00:00.0000000' AS DateTime2), N'assdasda')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (3, N'1111111   ', N'ddd', CAST(N'2000-11-11T00:00:00.0000000' AS DateTime2), N'bbbbbbbbbbb')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (5, N'77777777  ', N'aaaaaaa', CAST(N'2000-01-14T00:00:00.0000000' AS DateTime2), N'иииииииииииииииииии')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (6, N'12321312  ', N'ASDASDA', CAST(N'1999-04-15T00:00:00.0000000' AS DateTime2), N'asdasda')
SET IDENTITY_INSERT [dbo].[Visitor] OFF
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
