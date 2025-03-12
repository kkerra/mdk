DECLARE @xml XML = '<Products>
<Product>
<ProductId>1</ProductId>
<Name>Смартфон Samsung Galaxy S21</Name>
<Price>699.99</Price>
<Category>Электроника</Category>
</Product>
<Product>
<ProductId>2</ProductId>
<Name>Ноутбук Apple MacBook Pro</Name>
<Price>1299.99</Price>
<Category>Компьютеры</Category>
</Product>
<Product>
<ProductId>3</ProductId>
<Name>Телевизор LG OLED55CX</Name>
<Price>1499.99</Price>
<Category>Бытовая техника</Category>
</Product>
<Product>
<ProductId>4</ProductId>
<Name>Планшет Microsoft Surface Pro 7</Name>
<Price>799.99</Price>
<Category>Электроника</Category>
</Product>
<Product>
<ProductId>5</ProductId>
<Name>Наушники Sony WH-1000XM4</Name>
<Price>349.99</Price>
<Category>Аудио</Category>
</Product>
<Product>
<ProductId>6</ProductId>
<Name>Кофемашина De''Longhi Magnifica</Name>
<Price>599.99</Price>
<Category>Бытовая техника</Category>
</Product>
<Product>
<ProductId>7</ProductId>
<Name>Фитнес-браслет Xiaomi Mi Band 6</Name>
<Price>49.99</Price>
<Category>Гаджеты</Category>
</Product>
<Product>
<ProductId>8</ProductId>
<Name>Игровая консоль Sony PlayStation 5</Name>
<Price>499.99</Price>
<Category>Игры</Category>
</Product>
<Product>
<ProductId>9</ProductId>
<Name>Электрическая зубная щетка Oral-B</Name>
<Price>89.99</Price>
<Category>Здоровье</Category>
</Product>
<Product>
<ProductId>10</ProductId>
<Name>Камера Canon EOS M50</Name>
<Price>649.99</Price>
<Category>Фотоаппараты</Category>
</Product>
</Products>';

SELECT 
    Product.value('ProductId[1]', 'INT') AS ProductId,
    Product.value('Name[1]', 'NVARCHAR(100)') AS Name,
    --Product.value('Price[1]', 'DECIMAL(10, 2)') AS Price,
    Product.value('Category[1]', 'NVARCHAR(100)') AS Category
FROM @xml.nodes('/Products/Product') AS Products(Product);

--PRINT @xml

SELECT *
FROM Category
FOR XML PATH('Category'), ROOT('Categories')

DECLARE @json NVARCHAR(MAX) ='[
    {
        "ProductId": 1,
        "Name": "Смартфон Samsung Galaxy S21",
        "Price": 699.99,
        "Category": "Электроника"
    },
    {
        "ProductId": 2,
        "Name": "Ноутбук Apple MacBook Pro",
        "Price": 1299.99,
        "Category": "Компьютеры"
    },
    {
        "ProductId": 3,
        "Name": "Телевизор LG OLED55CX",
        "Price": 1499.99,
        "Category": "Бытовая техника"
    },
    {
        "ProductId": 4,
        "Name": "Планшет Microsoft Surface Pro 7",
        "Price": 799.99,
        "Category": "Электроника"
    },
    {
        "ProductId": 5,
        "Name": "Наушники Sony WH-1000XM4",
        "Price": 349.99,
        "Category": "Аудио"
    },
    {
        "ProductId": 6,
        "Name": "Кофемашина De''Longhi Magnifica",
        "Price": 599.99,
        "Category": "Бытовая техника"
    },
    {
        "ProductId": 7,
        "Name": "Фитнес-браслет Xiaomi Mi Band 6",
        "Price": 49.99,
        "Category": "Гаджеты"
    },
    {
        "ProductId": 8,
        "Name": "Игровая консоль Sony PlayStation 5",
        "Price": 499.99,
        "Category": "Игры"
    },
    {
        "ProductId": 9,
        "Name": "Электрическая зубная щетка Oral-B",
        "Price": 89.99,
        "Category": "Здоровье"
    },
    {
        "ProductId": 10,
        "Name": "Камера Canon EOS M50",
        "Price": 649.99,
        "Category": "Фотоаппараты"
    }
]';

--SELECT *
--FROM OPENJSON(@json)
--	WITH
--	(
--		ProductId INT '$.ProductId',
--		Name NVARCHAR(100) '$.Name',
--		Price DECIMAL(10,2) '$.Price',
--		Category NVARCHAR(50) '$.ProductId'

--	);


SELECT *
FROM Category
FOR JSON PATH, INCLUDE_NULL_VALUES

--SELECT 
--	JSON_VALUE(value, '$.ProductId') AS ProductId,
--	JSON_VALUE(value, '$.Name') AS Name
--FROM OPENJSON(@json)


/*SET @json = N'
[
    {
        "ProductId": 1,
        "Name": "Смартфон Samsung Galaxy S21",
        "Price": 699.99,
        "Category": "Электроника",
		"dimensions": {
			"width": 27.3,
			"height": 27.48,
			"depth": 15.08
		}
    },
    {
        "ProductId": 2,
        "Name": "Ноутбук Apple MacBook Pro",
        "Price": 1299.99,
        "Category": "Компьютеры",
		"dimensions": {
			"width": 17.3,
			"height": 17.48,
			"depth": 15.08
		}
    },
    {
        "ProductId": 4,
        "Name": "Планшет Microsoft Surface Pro 7",
        "Price": 799.99,
        "Category": "Электроника",
		"dimensions": {
			"width": 7.3,
			"height": 7.48,
			"depth": 15.08
		}
    }
]'

SELECT 
	JSON_VALUE(value, '$.ProductId') AS ProductId,
	JSON_VALUE(value, '$.Name') AS Name,
	JSON_VALUE(value, '$.dimensions.width') AS width,
	JSON_VALUE(value, '$.dimensions.height') AS height,
	JSON_QUERY(value, '$.dimensions') AS Dimensions
FROM OPENJSON(@json)*/

SET @json = N'
[
    {
		"CategoryName": "Электроника",
		"Products": 
		[
			{
				"ProductId": 1,
				"Name": "Смартфон Samsung Galaxy S21",
				"Price": 699.99
			},
			{
				"ProductId": 4,
				"Name": "Планшет Microsoft Surface Pro 7",
				"Price": 799.99
			}
		]
	},
	{
		"CategoryName": "Компьютеры",
		"Products": 
		[
			{
				"ProductId": 2,
				"Name": "Ноутбук Apple MacBook Pro",
				"Price": 1299.99
			}
		]
	}
]'


/*SELECT *
FROM OPENJSON(@json)
	WITH
	(
		CategoryName NVARCHAR(100) '$.CategoryName',
		jsonArray NVARCHAR(MAX) '$.Products' AS JSON
	)
CROSS APPLY
OPENJSON(jsonArray)
	WITH
	(
		ProductId INT '$.ProductId',
		Name NVARCHAR(50) '$.Name'
	);*/


SELECT 
	JSON_VALUE(category.value, '$.CategoryName') AS CategoryName,
	JSON_VALUE(product.value, '$.ProductId') AS ProductId,
	JSON_VALUE(product.value, '$.Name') AS Name
FROM OPENJSON(@json) AS category
CROSS APPLY
OPENJSON(category.value, '$.Products') AS product



SELECT [idPhoto], path, NULLIF(TRIM(VALUE), '') AS tag
FROM photoTags
CROSS APPLY string_split(tags, ',')

INSERT INTO Tag
SELECT DISTINCT TRIM(value) AS tag
FROM photoTags
CROSS APPLY string_split(tags, ',')
WHERE TRIM(value) <> ''


SELECT idPhoto, path
--INTO Photo
FROM photoTags


SELECT [idPhoto], path, NULLIF(TRIM(VALUE), '') AS tag
FROM photoTags
CROSS APPLY string_split(tags, ',')

SELECT idPhoto, TagId, Tag.Name
--INTO PhotoTag
FROM Tag INNER JOIN
(
	SELECT [idPhoto], path, NULLIF(TRIM(VALUE), '') AS tag
	FROM photoTags
	CROSS APPLY string_split(tags, ',')
) AS photoWithTags ON Tag.Name = photoWithTags.Tag
