#task1
DELIMITER //
CREATE FUNCTION get_price(order_id INT) RETURNS DECIMAL(6,2)
BEGIN
	DECLARE result DECIMAL(6,2);
    SELECT SUM(price * quantity) INTO result
    FROM book
		JOIN compound ON book.book_id = compound.book_id
	WHERE compound.order_id = get_price.order_id;
    RETURN result;
END;
//
DELIMITER ;

select get_price(7);

#task2
DELIMITER //
CREATE FUNCTION get_customer_full_name(login VARCHAR(20)) RETURNS VARCHAR(100)
BEGIN
	DECLARE full_name VARCHAR(100);
	SELECT CONCAT_WS(' ',UPPER(surname), UPPER(name)) INTO full_name
    FROM customer
    WHERE customer.login = login;
    RETURN full_name;
END;
//
DELIMITER ;

SELECT get_customer_full_name('login')

#task3
DELIMITER //
CREATE FUNCTION get_books_title_by_author_id(author_id INT) RETURNS VARCHAR(200)
BEGIN
	DECLARE list_book VARCHAR(200);
    SELECT GROUP_CONCAT(DISTINCT title)  INTO list_book
    FROM book
    WHERE book.author_id = author_id;
    RETURN list_book;
END;
//
DELIMITER ;

SELECT get_books_title_by_author_id(1)

#task4
DELIMITER //
CREATE FUNCTION get_authors_by_country(country VARCHAR(200)) RETURNS INT
BEGIN
	DECLARE quantity_author INT;
    SELECT 
		COUNT(*)  INTO quantity_author
    FROM author
    WHERE author.country = country;
    RETURN quantity_author;
END;
 //
DELIMITER ;   

SELECT get_authors_by_country('США')

#task5
DELIMITER //
CREATE FUNCTION get_profit_by_year(year_order INT) RETURNS DECIMAL(6,2)
BEGIN
	DECLARE profit_year DECIMAL(6,2);
	SELECT SUM(price * quantity) INTO profit_year
    FROM book
		JOIN compound ON book.book_id = compound.book_id
		JOIN `order` ON compound.order_id =  `order`.order_id
        WHERE YEAR(date_time_order) = year_order;
         RETURN profit_year;
END;
//
DELIMITER ;   

SELECT get_profit_by_year(2025)