--task1
SELECT *
FROM Book

--task2
SELECT surname+' '+ name fullname
FROM Author

--task3
SELECT DISTINCT country Страна 
FROM Author
ORDER BY country

--task4
SELECT bookId, title, price * 0.95 price
FROM Book
ORDER BY price DESC, title

--task6
SELECT 
	COUNT(bookId) AS amount,
	MIN(price) AS minPrice,
	MAX(price) AS maxPrice,
	AVG(price) AS averagePrice
FROM Book

--task7
SELECT
	genre,
	MIN(price) AS minPrice,
	MAX(price) AS maxPrice,
	COUNT(bookId) AS amount
FROM Book
GROUP BY genre
