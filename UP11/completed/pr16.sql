#task1
DELIMITER //
CREATE TRIGGER tr_before_delete_customer
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    DELETE FROM compound
    WHERE order_id IN (
        SELECT order_id
        FROM `order`
        WHERE customer_id = OLD.customer_id
    );

    DELETE FROM `order`
    WHERE customer_id = OLD.customer_id;
END;
//
DELIMITER ;

#task2
DELIMITER //
CREATE TRIGGER tr_before_insert_book
BEFORE INSERT ON book
FOR EACH ROW
BEGIN
	IF NEW.price > 5000 THEN 
		SET NEW.price = 5000;
	END IF;
END;
//
DELIMITER ;

#task3
DELIMITER //
CREATE TRIGGER tr_before_insert_order
BEFORE INSERT ON `order`
FOR EACH ROW
BEGIN
	SET NEW.date_time_order = NOW();
END;
//
DELIMITER ;

#task4
DELIMITER //
CREATE TRIGGER tr_change_quantity_book
BEFORE INSERT ON compound
FOR EACH ROW
BEGIN
	UPDATE book
    SET amount = amount - NEW.quantity
	WHERE book_id = NEW.book_id;
END;
//
DELIMITER ;