CREATE USER 'userTask1'@'localhost';
GRANT SHOW DATABASES ON *.* TO 'userTask1'@'localhost';

CREATE USER 'userTask2'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON *.* TO 'userTask2'@'localhost';

CREATE USER 'userTask3'@'localhost' IDENTIFIED BY 'qwerty';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.* TO 'userTask3'@'localhost';

CREATE USER 'userTask4'@'localhost';
GRANT SELECT ON mydb.book TO 'userTask4'@'localhost';

CREATE USER 'userTask5'@'localhost';
GRANT SELECT (book_id, title, price), UPDATE (price) ON mydb.book TO 'userTask5'@'localhost';

