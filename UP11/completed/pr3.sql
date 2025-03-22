use mydb;

#Task1
SELECT *
FROM author;

#Task2
SELECT surname, name
FROM author
LIMIT 3;

#Task3
SELECT DISTINCT country
FROM author
ORDER BY country;

#Task4
SELECT book_id, 
		name,
        '5%' as discount,
        price * 0.95 as discounted_price
FROM book;

#Task5
SELECT book_id,
		name,
        price,
        CASE
			WHEN price < 100 THEN 'дешевые'
            WHEN price < 1000 THEN 'средние'
            ELSE 'дорогие'
		END AS price_category
FROM book
ORDER BY price DESC;

#Task6
SELECT login,surname,name,telephone
FROM customer
WHERE telephone is not null;  

#Task7
 SELECT book_id, name
 FROM book
 WHERE name LIKE '%компьютер%';
 
 #Task8
 SELECT MAX(price) AS max_price,
	MIN(price) AS min_price,
    AVG(price) AS avg_price
FROM book;

 #Task9
 SELECT  author_id, name, COUNT(*) AS book_count
 FROM book
 GROUP BY author_id, name;

#Task10
 SELECT country,COUNT(*) AS count_country
 FROM author
 GROUP BY country
 HAVING COUNT(*) > 1;