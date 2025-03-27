-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 27 2025 г., 11:23
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `add_author` (IN `author_surname` VARCHAR(50), IN `author_name` VARCHAR(50), IN `author_country` VARCHAR(30), OUT `author_id` INT)  BEGIN
	INSERT INTO author(surname, name, country)
    VALUES(author_surname, author_name, author_country);
    SET author_id = LAST_INSERT_ID();
END$$

CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `add_customer` (IN `customer_login` VARCHAR(20), IN `customer_surname` VARCHAR(50), IN `customer_name` VARCHAR(50), IN `customer_address` VARCHAR(100), IN `customer_telephone` VARCHAR(20))  BEGIN 
	INSERT INTO customer(login, surname, name, address, telephone)
    VALUES(customer_login, customer_surname, customer_name, customer_address, customer_telephone);
    SELECT LAST_INSERT_ID() AS customer_id;
END$$

CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `change_price` (IN `percent` INT)  BEGIN
	UPDATE book
    SET price = price * (1 + percent / 100);
END$$

CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `search_book` (IN `search_part` VARCHAR(100))  BEGIN
	SELECT *
    FROM book
    WHERE title LIKE CONCAT('%', search_part, '%');
END$$

--
-- Функции
--
CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `get_authors_by_country` (`country` VARCHAR(200)) RETURNS INT BEGIN
	DECLARE quantity_author INT;
    SELECT 
    COUNT(*)  INTO quantity_author
    FROM author
    WHERE author.country = country;
    RETURN quantity_author;
END$$

CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `get_books_title_by_author_id` (`author_id` INT) RETURNS VARCHAR(200) CHARSET utf8 BEGIN
	DECLARE list_book VARCHAR(200);
    SELECT GROUP_CONCAT(DISTINCT title)  INTO list_book
    FROM book
    WHERE book.author_id = author_id;
    RETURN list_book;
END$$

CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `get_customer_full_name` (`login` VARCHAR(20)) RETURNS VARCHAR(100) CHARSET utf8 BEGIN
	DECLARE full_name VARCHAR(100);
	SELECT CONCAT_WS(' ',UPPER(surname), UPPER(name)) INTO full_name
    FROM customer
    WHERE customer.login = login;
    RETURN full_name;
END$$

CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `get_price` (`order_id` INT) RETURNS DECIMAL(6,2) BEGIN
	DECLARE result DECIMAL(6,2);
    SELECT SUM(price * quantity) INTO result
    FROM book
		JOIN compound ON book.book_id = compound.book_id
	WHERE compound.order_id = order_id;
    RETURN result;
END$$

CREATE DEFINER=`root`@`127.0.0.1` FUNCTION `get_profit_by_year` (`year_order` INT) RETURNS DECIMAL(6,2) BEGIN
	DECLARE profit_year DECIMAL(6,2);
	SELECT SUM(price * quantity) INTO profit_year
    FROM book
		JOIN compound ON book.book_id = compound.book_id
		JOIN `order` ON compound.order_id =  `order`.order_id
        WHERE YEAR(date_time_order) = year_order;
         RETURN profit_year;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `author_id` int UNSIGNED NOT NULL,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL DEFAULT 'Россия'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `author_books`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `author_books` (
`book_list` text
,`name` varchar(50)
,`surname` varchar(50)
);

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `book_id` int UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `genre` enum('проза','поэзия','другое') NOT NULL DEFAULT 'проза',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(4,3) NOT NULL DEFAULT '0.000',
  `pages` smallint NOT NULL DEFAULT '0',
  `issue_year` year DEFAULT NULL,
  `author_id` int UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Триггеры `book`
--
DELIMITER $$
CREATE TRIGGER `tr_before_insert_book` BEFORE INSERT ON `book` FOR EACH ROW BEGIN
	IF NEW.price > 5000 THEN 
		SET NEW.price = 5000;
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_delete_book` AFTER DELETE ON `book` FOR EACH ROW BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('book', 'delete', NOW(), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_insert_into_book` AFTER INSERT ON `book` FOR EACH ROW BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('book', 'insert', NOW(), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_update_book` AFTER UPDATE ON `book` FOR EACH ROW BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('book', 'update', NOW(), USER());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `book_info`
--

CREATE TABLE `book_info` (
  `book_id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `release_year` int DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `book_information`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `book_information` (
`book_id` int unsigned
,`name` varchar(50)
,`price` decimal(6,2)
,`surname` varchar(50)
,`title` varchar(50)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `book_info_fairy_tales`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `book_info_fairy_tales` (
`book_id` int unsigned
,`is_tale` varchar(3)
,`name` varchar(50)
,`price` decimal(6,2)
,`surname` varchar(50)
,`title` varchar(50)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `book_info_price_category`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `book_info_price_category` (
`book_id` int unsigned
,`name` varchar(50)
,`price` decimal(6,2)
,`price_category` varchar(7)
,`surname` varchar(50)
,`title` varchar(50)
);

-- --------------------------------------------------------

--
-- Структура таблицы `compound`
--

CREATE TABLE `compound` (
  `book_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `quantity` tinyint NOT NULL DEFAULT '1'
) ;

--
-- Триггеры `compound`
--
DELIMITER $$
CREATE TRIGGER `tr_change_quantity_book` BEFORE INSERT ON `compound` FOR EACH ROW BEGIN
	UPDATE book
    SET amount = amount - NEW.quantity
	WHERE book_id = NEW.book_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_insert_compound` AFTER INSERT ON `compound` FOR EACH ROW BEGIN
	SET @order_cost = (
		SELECT SUM(price * quantity)
        FROM compound
        JOIN book ON compound.book_id = book.book_id
        WHERE compound.order_id = NEW.order_id
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `current_years_orders`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `current_years_orders` (
`customer_id` int unsigned
,`date_time_order` datetime
,`login` varchar(20)
,`name` varchar(50)
,`order_id` int unsigned
,`surname` varchar(50)
);

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `customer_id` int UNSIGNED NOT NULL,
  `login` varchar(20) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Триггеры `customer`
--
DELIMITER $$
CREATE TRIGGER `tr_before_delete_customer` BEFORE DELETE ON `customer` FOR EACH ROW BEGIN
    DELETE FROM compound
    WHERE order_id IN (
        SELECT order_id
        FROM `order`
        WHERE customer_id = OLD.customer_id
    );

    DELETE FROM `order`
    WHERE customer_id = OLD.customer_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_delete_customer` AFTER DELETE ON `customer` FOR EACH ROW BEGIN 
	INSERT INTO deleted_customer(customer_id, login, surname, name, address, telephone)
    VALUES(OLD.customer_id, OLD.login, OLD.surname, OLD.name, OLD.address, OLD.telephone);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `deleted_customer`
--

CREATE TABLE `deleted_customer` (
  `customer_id` int UNSIGNED NOT NULL,
  `login` varchar(20) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

CREATE TABLE `games` (
  `idGame` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

CREATE TABLE `log` (
  `log_id` int NOT NULL,
  `table` varchar(45) DEFAULT NULL,
  `operation` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `my_event_table`
--

CREATE TABLE `my_event_table` (
  `my_event_table_id` int NOT NULL,
  `event_time` datetime DEFAULT NULL,
  `event_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `order_id` int UNSIGNED NOT NULL,
  `date_time_order` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Триггеры `order`
--
DELIMITER $$
CREATE TRIGGER `tr_before_insert_order` BEFORE INSERT ON `order` FOR EACH ROW BEGIN
	SET NEW.date_time_order = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_delete_order` AFTER DELETE ON `order` FOR EACH ROW BEGIN 
	DELETE FROM customer 
    WHERE customer_id NOT IN(
		SELECT customer_id
        FROM `order`
	);
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('order', 'delete', NOW(), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_insert_into_order` AFTER INSERT ON `order` FOR EACH ROW BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('order', 'insert', NOW(), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_update_order` AFTER UPDATE ON `order` FOR EACH ROW BEGIN 
	INSERT INTO `log`(`table`, operation, `datetime`, `user`)
    VALUES('order', 'update', NOW(), USER());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `supply`
--

CREATE TABLE `supply` (
  `supply_id` int NOT NULL,
  `quantity` int NOT NULL,
  `date_supple` date NOT NULL,
  `book_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `temp_book`
--

CREATE TABLE `temp_book` (
  `temp_book_id` int NOT NULL,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `video_games`
--

CREATE TABLE `video_games` (
  `Title` varchar(200) DEFAULT NULL,
  `MaxPlayers` tinyint DEFAULT NULL,
  `Genres` varchar(100) DEFAULT NULL,
  `Release Console` varchar(100) DEFAULT NULL,
  `ReleaseYear` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура для представления `author_books`
--
DROP TABLE IF EXISTS `author_books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `author_books`  AS SELECT `author`.`surname` AS `surname`, `author`.`name` AS `name`, group_concat(distinct `book`.`title` separator ';') AS `book_list` FROM (`author` join `book` on((`author`.`author_id` = `book`.`author_id`))) GROUP BY `author`.`author_id`, `author`.`surname`, `author`.`name` ;

-- --------------------------------------------------------

--
-- Структура для представления `book_information`
--
DROP TABLE IF EXISTS `book_information`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `book_information`  AS SELECT `b`.`book_id` AS `book_id`, `a`.`surname` AS `surname`, `a`.`name` AS `name`, `b`.`title` AS `title`, `b`.`price` AS `price` FROM (`book` `b` join `author` `a` on((`b`.`author_id` = `a`.`author_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `book_info_fairy_tales`
--
DROP TABLE IF EXISTS `book_info_fairy_tales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `book_info_fairy_tales`  AS SELECT `b`.`book_id` AS `book_id`, `a`.`surname` AS `surname`, `a`.`name` AS `name`, `b`.`title` AS `title`, `b`.`price` AS `price`, (case when (`b`.`title` like '%сказки%') then 'Да' else 'Нет' end) AS `is_tale` FROM (`book` `b` join `author` `a` on((`b`.`author_id` = `a`.`author_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `book_info_price_category`
--
DROP TABLE IF EXISTS `book_info_price_category`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `book_info_price_category`  AS SELECT `b`.`book_id` AS `book_id`, `a`.`surname` AS `surname`, `a`.`name` AS `name`, `b`.`title` AS `title`, (case when (`b`.`price` < 1000) then 'до 1000' when (`b`.`price` < 5000) then 'до 5000' else 'от 5000' end) AS `price_category`, `b`.`price` AS `price` FROM (`book` `b` join `author` `a` on((`b`.`author_id` = `a`.`author_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `current_years_orders`
--
DROP TABLE IF EXISTS `current_years_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `current_years_orders`  AS SELECT `order`.`order_id` AS `order_id`, `order`.`date_time_order` AS `date_time_order`, `customer`.`customer_id` AS `customer_id`, `customer`.`login` AS `login`, `customer`.`surname` AS `surname`, `customer`.`name` AS `name` FROM (`customer` join `order` on((`customer`.`customer_id` = `order`.`customer_id`))) WHERE (year(`order`.`date_time_order`) = year(curdate())) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`),
  ADD UNIQUE KEY `surname_name_author_UNIQUE` (`surname`,`name`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_book_author_idx` (`author_id`);

--
-- Индексы таблицы `book_info`
--
ALTER TABLE `book_info`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `unique_title_author` (`title`,`surname`,`name`);

--
-- Индексы таблицы `compound`
--
ALTER TABLE `compound`
  ADD PRIMARY KEY (`book_id`,`order_id`),
  ADD KEY `fk_book_has_order_order1_idx` (`order_id`),
  ADD KEY `fk_book_has_order_book1_idx` (`book_id`);

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD KEY `surname_name_customer_UNIQUE` (`surname`,`name`);

--
-- Индексы таблицы `deleted_customer`
--
ALTER TABLE `deleted_customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD KEY `surname_name_customer_UNIQUE` (`surname`,`name`);

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`idGame`);
ALTER TABLE `games` ADD FULLTEXT KEY `description` (`description`);
ALTER TABLE `games` ADD FULLTEXT KEY `description_2` (`description`,`name`);

--
-- Индексы таблицы `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Индексы таблицы `my_event_table`
--
ALTER TABLE `my_event_table`
  ADD PRIMARY KEY (`my_event_table_id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_order_customer1_idx` (`customer_id`);

--
-- Индексы таблицы `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`supply_id`),
  ADD KEY `fk_supply_book1_idx` (`book_id`);

--
-- Индексы таблицы `temp_book`
--
ALTER TABLE `temp_book`
  ADD PRIMARY KEY (`temp_book_id`);

--
-- Индексы таблицы `video_games`
--
ALTER TABLE `video_games` ADD FULLTEXT KEY `Genres` (`Genres`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `book_info`
--
ALTER TABLE `book_info`
  MODIFY `book_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
  MODIFY `idGame` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `my_event_table`
--
ALTER TABLE `my_event_table`
  MODIFY `my_event_table_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `supply`
--
ALTER TABLE `supply`
  MODIFY `supply_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `temp_book`
--
ALTER TABLE `temp_book`
  MODIFY `temp_book_id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `compound`
--
ALTER TABLE `compound`
  ADD CONSTRAINT `fk_book_has_order_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_book_has_order_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `supply`
--
ALTER TABLE `supply`
  ADD CONSTRAINT `fk_supply_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);

DELIMITER $$
--
-- События
--
CREATE DEFINER=`root`@`127.0.0.1` EVENT `event2` ON SCHEDULE EVERY 150 SECOND STARTS '2025-03-22 11:08:30' ENDS '2025-03-23 11:08:30' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    INSERT INTO my_event_table (event_time, event_name)
    VALUES (NOW(), 'event2');
END$$

CREATE DEFINER=`root`@`127.0.0.1` EVENT `event_author` ON SCHEDULE EVERY 1 DAY STARTS '2025-03-22 15:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    INSERT INTO my_event_table (event_time, event_name)
    VALUES (NOW(), 'eventAuthor');
    
    DELETE FROM author 
    WHERE author_id NOT IN(
		SELECT author_id
        FROM book
    );
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
