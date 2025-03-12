CREATE PROCEDURE InsertAuthor
    @surname VARCHAR(50),
    @name VARCHAR(50), 
	@country VARCHAR(30)
AS
    INSERT INTO Author(surname, name, country)
	VALUES(@surname, @name, @country)

InsertAuthor 'aaa', 'sads', 'Италия'

CREATE PROCEDURE GetNewAuthorId
	@surname VARCHAR(50),
    @name VARCHAR(50), 
	@country VARCHAR(30)
AS
    INSERT INTO Author(surname, name, country)
	VALUES(@surname, @name, @country)
	SELECT SCOPE_IDENTITY()

GetNewAuthorId 'aaa1', 'sads12', 'Италия'

CREATE PROCEDURE GetBooks
	@startPrice DECIMAL(6,2),
	@endPrice DECIMAL(6,2)
AS
	SELECT *
	FROM Book
	WHERE price BETWEEN @startPrice AND @endPrice

GetBooks 600, 5000