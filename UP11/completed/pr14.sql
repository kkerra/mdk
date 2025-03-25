#task1
DELIMITER //
CREATE PROCEDURE add_customer(IN customer_login VARCHAR(20),
							  IN customer_surname VARCHAR(50),
                              IN customer_name VARCHAR(50),
                              IN customer_address VARCHAR(100),
                              IN customer_telephone VARCHAR(20))
BEGIN 
	INSERT INTO customer(login, surname, name, address, telephone)
    VALUES(customer_login, customer_surname, customer_name, customer_address, customer_telephone);
    SELECT LAST_INSERT_ID() AS customer_id;
END;    
//
DELIMITER ;

CALL add_customer('asdsf', 'qweqwe1', 'weqewe', 'sddssfsafs', 'wqeqweqwe')

#task2
DELIMITER //
CREATE PROCEDURE search_book(IN search_part VARCHAR(100))
BEGIN
	SELECT *
    FROM book
    WHERE title LIKE CONCAT('%', search_part, '%');
END;
//
DELIMITER ;
CALL search_book('linux')

#task3
DELIMITER //
CREATE PROCEDURE add_author(IN author_surname VARCHAR(50),
							IN author_name VARCHAR(50),
                            IN author_country VARCHAR(30),
                            OUT author_id INT
							)
BEGIN
	INSERT INTO author(surname, name, country)
    VALUES(author_surname, author_name, author_country);
    SET author_id = LAST_INSERT_ID();
END;
//
DELIMITER ;
CALL add_author('sadsafEdWRsdfds', 'sadasdQgWEsadsa', 'asdsadsa', @author_id);
SELECT @author_id;

#task4
DELIMITER //
CREATE PROCEDURE change_price(IN percent INT)
BEGIN
	UPDATE book
    SET price = price * (1 + percent / 100);
END;
//
DELIMITER ;
CALL change_price(10);

#task5
DELIMITER //
CREATE PROCEDURE delete_authors()
BEGIN 
	DELETE FROM author 
    WHERE author_id NOT IN(
		SELECT author_id
        FROM book
    );
END;
//
DELIMITER ;
	