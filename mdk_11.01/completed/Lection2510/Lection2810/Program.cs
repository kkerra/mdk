using Dapper;
using DBLibrary;
using Microsoft.Data.SqlClient;
using System.Data;


Console.WriteLine("Dapper");
using IDbConnection connection = new SqlConnection(DAL.ConnectionString);

//var query = "SELECT * FROM Category";
//var categories = connection.Query<Category>(query);
//foreach (var category in categories)
//    Console.WriteLine($"{category.CategoryId} {category.Name}");


//var query = "SELECT COUNT(*) FROM Category";
//var count = connection.Query<int>(query).FirstOrDefault(); // 1 знач
//Console.WriteLine(count);


//var query = "UPDATE Category SET Name='РПГ' WHERE Name='RPG'";
//var rowCount = connection.Execute(query); //возвращает количество измененных строк
//Console.WriteLine(rowCount);


//var query = "INSERT INTO Category(Name) VALUES(@name)";
//var rowCount = connection.Execute(query,
//    new { name = "arcade" }
//    );
//Console.WriteLine(rowCount);


//передача объекта существующего типа
//var query = "UPDATE Category SET Name=@name WHERE CategoryId=@CategoryId";
//Category category = new() { Name = "аркада", CategoryId = 8 };
//var rowCount = connection.Execute(query,category);
//Console.WriteLine(rowCount);


//можно передать несколько запросов через ;
//var query = "INSERT INTO Category(Name) VALUES('рогалик'); SELECT SCOPE_IDENTITY()";
//int id = connection.Query<int>(query).FirstOrDefault();
//Console.WriteLine(id);

//connection.QueryFirst;