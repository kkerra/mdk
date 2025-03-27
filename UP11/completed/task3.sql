-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 27 2025 г., 11:21
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
