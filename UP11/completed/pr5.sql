use mydb;

#Task1
INSERT INTO temp_book (surname, name, title, price)
SELECT a.surname, a.name, book.name, book.price
FROM author a
JOIN book book ON a.author_id = book.author_id;

#Task2
DELETE FROM temp_book 
WHERE title LIKE('%компьютер%');

#Task3
UPDATE temp_book
SET price = CASE
				WHEN surname = 'Пушкин' THEN price * 2
                WHEN surname = 'Иванов' THEN price - 50
                ELSE price
			END;

#Task4
DELETE FROM temp_book;

#Task5
UPDATE temp_book
SET price = price + 100
WHERE surname IN (
	SELECT surname FROM author WHERE country = 'Россия'
);

#Task6
DELETE FROM customer
WHERE customer_id NOT IN (
	SELECT DISTINCT customer_id
    FROM `order`
);

#Task7
REPLACE INTO author(author_id, surname, name)
VALUES (1, 'ава1', 'qwer');

#Task8
INSERT INTO author(surname, name, country)
VALUES ('123', '123', 'Страна')
ON DUPLICATE KEY UPDATE country = VALUES(country);