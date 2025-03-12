--task1
SELECT bookId, title, name, surname, price
FROM Author 
	JOIN Book ON Author.authorId = Book.authorId

--task2
SELECT Content.orderId, Book.bookId, title, [name], surname
	, price, amount, amount * price cost
FROM Author 
	INNER JOIN Book ON Author.authorId = Book.authorId 
	INNER JOIN Content ON Book.bookId = Content.bookId
    INNER JOIN [Order] ON Content.orderId = [Order].orderId

--task3
SELECT [Order].orderId, [Order].orderDatetime, SUM(Book.price * amount) orderCost
FROM [Order] 
	INNER JOIN Content ON [Order].orderId = Content.orderId 
	INNER JOIN Book ON Content.bookId = Book.bookId
GROUP BY [Order].orderId, orderDatetime
ORDER BY orderDatetime DESC

SELECT *
FROM Content

--task4
SELECT Customer.customerId, [login], COUNT(*) totalOrder
FROM Customer
	LEFT JOIN [Order] ON Customer.customerId = [Order].customerId
GROUP BY Customer.customerId, [login]

--task5
SELECT *
FROM [Order]
WHERE orderId NOT IN (SELECT DISTINCT orderId
					  FROM Content)

--task6
SELECT *
FROM Customer
WHERE customerId IN (SELECT DISTINCT customerId 
					 FROM [Order])

--task7
SELECT surname, name, 'Author' Type
FROM Author
UNION 
SELECT surname, name, 'Customer'
FROM Customer
ORDER BY surname, name