#task1
DELIMITER //
CREATE TRIGGER tr_delete_customer
AFTER DELETE ON customer
FOR EACH ROW
BEGIN 
	INSERT INTO deleted_customer(customer_id, login, surname, name, address, telephone)
    VALUES(OLD.customer_id, OLD.login, OLD.surname, OLD.name, OLD.address, OLD.telephone);
END;
//
DELIMITER ;

#task2
DELIMITER //
CREATE TRIGGER tr_insert_into_book
AFTER INSERT ON book
FOR EACH ROW
BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('book', 'insert', NOW(), USER());
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER tr_update_book
AFTER UPDATE ON book
FOR EACH ROW
BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('book', 'update', NOW(), USER());
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER tr_delete_book
AFTER DELETE ON book
FOR EACH ROW
BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('book', 'delete', NOW(), USER());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_insert_into_order
AFTER INSERT ON `order`
FOR EACH ROW
BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('order', 'insert', NOW(), USER());
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER tr_update_order
AFTER UPDATE ON `order`
FOR EACH ROW
BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('order', 'update', NOW(), USER());
END;
//
DELIMITER ;
#task3
DELIMITER //
CREATE TRIGGER tr_delete_order
AFTER DELETE ON `order`
FOR EACH ROW
BEGIN 
	DELETE FROM customer 
    WHERE customer_id NOT IN(
		SELECT customer_id
        FROM `order`
	);
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('order', 'delete', NOW(), USER());
END;
//
DELIMITER ;

#task4
DELIMITER //
CREATE TRIGGER tr_insert_compound
AFTER INSERT ON compound
FOR EACH ROW
BEGIN
	SET @order_cost = (
		SELECT SUM(price * quantity)
        FROM compound
        JOIN book ON compound.book_id = book.book_id
        WHERE compound.order_id = NEW.order_id
    );
END;
//
DELIMITER ;