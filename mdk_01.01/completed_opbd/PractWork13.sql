--task1
SELECT *
FROM Book
WHERE genre = 'проза' AND price BETWEEN 500 AND 1000

--task2
SELECT name, surname, phone
FROM Customer
WHERE phone IS NOT NULL

--task3
SELECT *
FROM Book
WHERE title LIKE '%книга%'

--task4
SELECT title
FROM Book
WHERE title LIKE 'с%'

--task5
SELECT country, COUNT(*) authorAmount
FROM Author
GROUP BY country
HAVING COUNT(*) > 1

--task6
SELECT orderId, SUM(amount) totalBooks
FROM Content
GROUP BY orderId
HAVING SUM(amount) > 5
