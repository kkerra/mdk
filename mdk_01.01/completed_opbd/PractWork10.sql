--task1
CREATE TABLE Promotions(
	promotionId int IDENTITY NOT NULL,
	name varchar(50) NOT NULL,
	description varchar(200) NULL,
	discountAmount int NOT NULL,
	startDate date DEFAULT GetDate() NOT NULL,
	endDate date NULL

	CONSTRAINT PK_Promotions
	PRIMARY KEY(promotionId)
)

--task2
CREATE TABLE PromotionalGoods(
	promotionId int NOT NULL,
	bookId int NOT NULL

	CONSTRAINT PK_PromotionalGoods
	PRIMARY KEY(promotionId, bookId)

	CONSTRAINT FK_Promotions_PromotionalGoods
	FOREIGN KEY(promotionId) 
	REFERENCES Promotions(promotionId) 
	ON DELETE CASCADE
	ON UPDATE CASCADE,

	CONSTRAINT FK_Book_PromotionalGoods
	FOREIGN KEY(bookId) 
	REFERENCES Book(bookId) 
	ON DELETE NO ACTION
	ON UPDATE CASCADE	
)

--task3
ALTER TABLE Promotions
ADD discountType varchar(5) NULL 

--task4
ALTER TABLE Promotions
ADD CONSTRAINT DF_PromotionsDiscountType
	DEFAULT '%' FOR discountType

--task5
ALTER TABLE Promotions
ADD CONSTRAINT CK_PromotionsDiscountType 
	CHECK(discountType IN ('%', 'руб.')),
CONSTRAINT CK_PromotionsDiscountAmount
	CHECK(discountAmount > 0)

--task6
ALTER TABLE Promotions
ADD CONSTRAINT UQ_PromotionsStartPromotion
	UNIQUE(name, startDate)

--task7
ALTER TABLE PromotionalGoods
DROP CONSTRAINT FK_Promotions_PromotionalGoods

DROP TABLE Promotions