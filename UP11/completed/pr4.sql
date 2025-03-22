#Task1
SELECT author.surname, author.name, book.name, book.price
FROM author 
INNER JOIN book book ON author.author_id = book.author_id
WHERE country = 'Россия';

#Task2
SELECT a.surname, 
		a.name, 
        COUNT(b.book_id) AS book_count
FROM author a
 JOIN book b ON a.author_id = b.author_id
GROUP BY a.surname, a.name, a.author_id;

#Task3
SELECT surname, name
FROM author
WHERE author_id NOT IN(
	SELECT author_id
    FROM book
    WHERE name LIKE '%linux%' OR name LIKE '%windows%'
);

#Task4
SELECT login,
		COUNT(o.order_id) AS order_count,
        SUM(quantity) AS total_books_purchased,
        SUM(quantity * price) AS total_price
FROM customer c
JOIN `order` o ON c.customer_id = o.customer_id
JOIN compound comp ON comp.order_id = o.order_id
JOIN book b ON comp.book_id = b.book_id
GROUP BY login;

#Task5
SELECT login, COUNT(o.order_id) AS order_count, SUM(quantity) AS total_books
FROM customer c
JOIN `order` o ON c.customer_id = o.customer_id
JOIN compound comp ON comp.order_id = o.order_id
GROUP BY login
HAVING SUM(quantity) > 10