#task1
CREATE VIEW current_years_orders
AS 
SELECT order_id, date_time_order, customer.customer_id, login, surname, name
FROM customer
JOIN `order` ON customer.customer_id = `order`.customer_id
WHERE YEAR(date_time_order) = YEAR(CURRENT_DATE());

#task2
CREATE VIEW book_information
AS 
SELECT b.book_id, surname, a.name, b.title, b.price
FROM book b
JOIN author a ON b.author_id = a.author_id;

#task3
CREATE VIEW author_books
AS
SELECT surname, name, GROUP_CONCAT(DISTINCT title SEPARATOR ';') AS book_list
FROM author
JOIN book ON author.author_id = book.author_id
GROUP BY author.author_id, surname, name;

#task4
CREATE VIEW book_info_fairy_tales
AS
SELECT b.book_id, surname, a.name, b.title, b.price,
		CASE
			WHEN title LIKE '%сказки%' THEN 'Да' ELSE 'Нет' 
		END AS is_tale
FROM book b
JOIN author a ON b.author_id = a.author_id;

#task5
CREATE VIEW book_info_price_category
AS
SELECT b.book_id, surname, a.name, b.title,
		CASE
			WHEN price < 1000 THEN 'до 1000'
            WHEN price < 5000 THEN 'до 5000'
            ELSE 'от 5000'
		END AS price_category,
		 b.price
FROM book b
JOIN author a ON b.author_id = a.author_id;

SELECT *
FROM current_years_orders;
SELECT *
FROM book_information;
SELECT *
FROM author_books;
SELECT *
FROM book_info_fairy_tales;
SELECT *
FROM book_info_price_category;