#TASK1
SELECT DATABASE(), USER(), CURTIME(), CURDATE(), NOW();

#TASK2
SELECT order_id, DAY(date_time_order),DATE(date_time_order),  MONTHNAME(date_time_order)
FROM `order`
WHERE YEAR(date_time_order) = 2025;

#TASK3
UPDATE book
SET name = REPLACE(name, '  ', ' '), 
	price = ROUND(price, -1);

#TASK4
SELECT CONCAT(LEFT(a.name, 1), surname), CONCAT('$',price,book.name)
FROM author a 
JOIN book book ON a.author_id = book.author_id;

#TASK5
SELECT a.author_id,a.name,a.surname,GROUP_CONCAT(DISTINCT book.name ORDER BY book.name)
FROM author a 
JOIN book book ON a.author_id = book.author_id
GROUP BY a.author_id;

#TASK6
SELECT login, surname, name,
	CASE  
		WHEN telephone IS NULL OR telephone = '' THEN '-' ELSE telephone
	END as telephone,
    CASE 
		WHEN address = '-' THEN NULL ELSE address
	END as address
FROM customer;

#Task7
SELECT ROW_NUMBER() OVER (ORDER BY name) AS row_num,
	book_id,
    name,
    price
FROM book;

#Task8
SELECT genre, name,price 
FROM(
		SELECT
			genre,
            name,
            price,
			DENSE_RANK() OVER (PARTITION BY genre ORDER BY  price DESC) AS `rank`
		FROM
			book
	) AS ranked_book
WHERE `rank` < 3;