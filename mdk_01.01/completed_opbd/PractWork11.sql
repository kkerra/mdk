--task1
INSERT INTO Book(title, authorId, publicationYear)
VALUES('�����2', 3, 2005)

SELECT *
FROM Book

--task2
DELETE 
FROM Customer
WHERE phone IS NULL

SELECT *
FROM Customer

--task3
UPDATE Book
SET price = price -100
WHERE title LIKE '%������%'

SELECT *
FROM Book

--task4
SELECT surname, name, title, price, publicationYear
INTO Prose
FROM Author 
	INNER JOIN Book ON Author.authorId = Book.authorId
                         
WHERE genre = '�����'

SELECT *
FROM Prose

--task5
DELETE 
FROM [Order]
WHERE orderId IN (SELECT orderId
				  FROM Content
				  WHERE amount IS NULL)

--task6
UPDATE Book
SET price = price + 100
FROM  Author 
	INNER JOIN Book ON Author.authorId = Book.authorId
                         
WHERE country = '������'

SELECT *
FROM Book

--task7
UPDATE Book
SET price =
	CASE 
	WHEN genre = '�����' THEN price * 0.9
	WHEN GENRE = '������' THEN price + 100
	ELSE price
	END

SELECT *
FROM Book