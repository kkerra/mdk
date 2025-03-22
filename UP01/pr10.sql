CREATE TABLE book_info(
  `book_info_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `publication_year` year DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `page` smallint DEFAULT NULL,
  PRIMARY KEY (`my_event_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;