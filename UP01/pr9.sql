-- show processlist;

#Task1
DELIMITER //

CREATE EVENT event1
ON SCHEDULE EVERY 10 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 5 MINUTE
DO
BEGIN
    INSERT INTO my_event_table (event_time, event_name)
    VALUES (NOW(), 'event1');
END //

DELIMITER ;


#Task2
DELIMITER //

CREATE EVENT event2
ON SCHEDULE EVERY 150 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    INSERT INTO my_event_table (event_time, event_name)
    VALUES (NOW(), 'event2');
END //

DELIMITER ;

#Task3
DELIMITER //

CREATE EVENT event3
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO
BEGIN
    INSERT INTO my_event_table (event_time, event_name)
    VALUES (NOW(), 'event3');
END //

DELIMITER ;

#Task4
DELIMITER //

CREATE EVENT event_author
ON SCHEDULE EVERY 1 DAY
STARTS '2025-03-22 15:00:00'
DO
BEGIN
    INSERT INTO my_event_table (event_time, event_name)
    VALUES (NOW(), 'eventAuthor');
    
    DELETE FROM author 
    WHERE author_id NOT IN(
		SELECT author_id
        FROM book
    );
END //

DELIMITER ;

#Task5
SELECT * 
FROM information_schema.EVENTS;
