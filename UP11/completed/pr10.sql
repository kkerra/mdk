#task1
CREATE TABLE book_info(
	book_id INT PRIMARY KEY,
    title VARCHAR(50),
    surname VARCHAR(50),
    `name` VARCHAR(50), 
    release_year INT, 
    price DECIMAL(6, 2), 
    pages_count SMALLINT
);

#task2
ALTER TABLE book_info
MODIFY book_id INT AUTO_INCREMENT;

#task3
ALTER TABLE book_info
ADD CONSTRAINT unique_title_author UNIQUE (title, surname, `name`);

#task4
ALTER TABLE book_info
ADD arrival_date DATE;

#task5
ALTER TABLE book_info
DROP COLUMN pages_count;