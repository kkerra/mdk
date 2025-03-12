--task1
CREATE TABLE [dbo].[UpdateEmail](
	[VisitorId] [int] NOT NULL,
	[E-mail] [varchar](150) NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UpdateEmail] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC,
	[ChangeDate] ASC
));

ALTER TRIGGER trUpdateEmail
ON Visitor
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

SELECT *
FROM UpdateEmail

--task2
ALTER TABLE Movie
ADD IsDeleted BIT DEFAULT 0

CREATE TRIGGER trDeleteMovie
ON Movie
INSTEAD OF DELETE
AS
BEGIN
	UPDATE Movie
	SET IsDeleted = 1
	WHERE MovieId IN (SELECT MovieId
					  FROM deleted)
END;

--task3
CREATE TABLE DeletedVisitor(
	VisitorId INT NOT NULL,
	[E-mail] VARCHAR(150),
	Name NVARCHAR(50),
	Birthday DATETIME,
	DeletionDate DATETIME DEFAULT GetDate(),
	Login nvarchar(100)
CONSTRAINT [PK_DeletedVisitor] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
));

CREATE TRIGGER trDeleteVisitor
ON Visitor
AFTER DELETE
AS
BEGIN
	INSERT INTO DeletedVisitor(VisitorId, [E-mail], Name, Birthday, DeletionDate, Login)
	SELECT VisitorId, [E-mail], Name, Birthday, GETDATE(), ORIGINAL_LOGIN()
	FROM deleted
END;

--task4
ALTER TRIGGER trChangePrice
ON Session
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO Session(MovieId, HallId, Price)
	SELECT MovieId, HallId, CASE WHEN Price < 100 THEN 100
							ELSE Price END
	FROM inserted
end;

--task5
