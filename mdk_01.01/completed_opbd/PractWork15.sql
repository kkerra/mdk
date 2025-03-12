--task1
UPDATE Book 
SET price = ROUND(price, -1)

--task2
SELECT YEAR(orderDatetime) orderYear, MONTH(orderDatetime) orderMonth, COUNT(*) orderCount
FROM [Order]
GROUP BY YEAR(orderDatetime), MONTH(orderDatetime)
ORDER BY orderYear DESC, orderMonth DESC

--task3
UPDATE Book
SET price = price * 0.9
WHERE bookId NOT IN(
	SELECT DISTINCT bookId
	FROM Content 
		INNER JOIN [Order] ON [Content].orderId = [Order].orderId
	WHERE YEAR(orderDatetime) = YEAR(GETDATE())
	)

--task4
SELECT customerId, UPPER(CONCAT_WS(' ', surname,  LEFT([name], 1)))
FROM Customer

--task6
SELECT customerId, surname, [name], ISNULL(phone, '-') phone, NULLIF([address], '') [address]
FROM Customer

--task7
SELECT surname, [name], STRING_AGG(title, ', ') WITHIN GROUP ( ORDER BY title)    Books
FROM Author 
	INNER JOIN Book ON Author.authorId = Book.authorId
GROUP BY surname, [name]

--task9
SELECT ROW_NUMBER() OVER (ORDER BY title) bookNumber, *
FROM Book

--task10
SELECT genre, ROW_NUMBER() OVER (PARTITION BY genre ORDER BY title) bookNumber, title
FROM Book
                         

