using Lection0511EFCore.Data;
using Lection0511EFCore.Models;
using Microsoft.EntityFrameworkCore;

Console.WriteLine("Hello, World!");

GameStoreContext context = new();

var price = 1000;
var games = context.Games
    .FromSql($"SELECT * FROM Game WHERE Price <= {price}");
//.AsQueryable()
foreach (var game in games)
    Console.WriteLine($"{game.Name} {game.Price}");

//games = context.Games
//    .FromSqlRaw($"SELECT * FROM Game WHERE Price <= {0}", price)
//    .ToList();

//var titles = context.Database.SqlQuery<string>($"SELECT Name FROM Game").ToList();

//var count = context.Database.ExecuteSql($"UPDATE Game SET Price+=1");

var category = "1111111";
//context.Database.ExecuteSql($"EXECUTE AddCategory2 {category}");
//context.Database.ExecuteSql($"AddCategory2 @name={category}");


//SqlParameter id = new()
//{
//    ParameterName = "id",
//    SqlDbType = System.Data.SqlDbType.Int,
//    Direction = System.Data.ParameterDirection.Output
//};
//context.Database.ExecuteSql($"AddCategory @name={category}, @id={id} OUTPUT");
//Console.WriteLine(id.Value);

//var games = context.Games
//    .FromSql($"GetGamesByPrice {500}");

//games = context.Games
//    .Where(g => EF.Functions.Like(g.Name, "[m-z]%"));



//var avgPrice = context.Games
//    .Average(g => g.Price);

//var countByPrice = context.Games.Count(g => g.Price < 1000);

//avgPrice = context.Database.SqlQuery<decimal>($"SELECT dbo.GetAvgPrice(1) AS value").FirstOrDefault();

//var categoryName = "РПГ";
//games = context.Games
//    .FromSql($"SELECT * FROM dbo.GetGamesByCategory({categoryName})");
//foreach (var game in games.ToList())
//    Console.WriteLine($"{game.Name} {game.Price}");

//context.Categories.Add(new Category { Name = "1234" });

Console.WriteLine(GameStoreContext.GetAvgPrice(1));


#region EF Query
/*//получение связанных данных
var games = context.Games.Include(g => g.Category).AsQueryable();
foreach (var game in games.ToList())
    Console.WriteLine($"{game.GameId} {game.Name} {game.Category.Name}");

//Console.WriteLine(games.ToQueryString()); - sql-запрос

var categories = context.Categories.Include(g => g.Games).AsQueryable();
foreach (var category in categories.ToList())
{
    Console.WriteLine($"{category.CategoryId} {category.Name} {category.Games.Count}");
    foreach (var game in category.Games)
        Console.WriteLine($" - {game.Name}");
}

//Console.WriteLine(categories.ToQueryString());

//фильтрация
GameFilter filter = new();// { Category = "РПГ" };
if (!String.IsNullOrEmpty(filter.Category))
    games = games.Where(g => g.Category.Name == filter.Category);

if (filter.MaxPrice.HasValue)
    games = games.Where(g => g.Price < 100000);



//сортировка 
//games = games.OrderBy(g => g.Category);
//games = games.OrderBy(g => g.Name).ThenByDescending(g => g.Price);

/*string orderColumn = "Price";
bool isSortAsc = false;
games = (isSortAsc)
    ? games.OrderBy(g => EF.Property<object>(g, orderColumn))
    : games.OrderByDescending(g => EF.Property<object>(g, orderColumn));



// пагинация
// skip - пропуск строк
// take - вернуть колво строк
int pageSize = 3;
int pageIndex = 1;
games = games.Skip(pageSize * (pageIndex - 1)).Take(pageSize);
foreach (var game in games.ToList())
    Console.WriteLine($"{game.GameId} {game.Name} {game.Price} {game.Category.Name}");



//проекция
var gamesData = games.Select(g => new { GameName = g.Name });

var gamesDto = games.Select(g => new GameDto
{
    Id = g.GameId,
    Name = g.Name,
    Price = g.Price,
    CategoryName = g.Category.Name
});


// join
var joinExample = context.Games
    .Join(context.Categories,
    g => g.CategoryId,
    c => c.CategoryId,
    (g, c) => new
    {
        Name = g.Name,
        CategoryName = c.Name
    }
    );



// group by
var groupByExample = context.Games
    .GroupBy(g => g.CategoryId)
    .Select(gr => new
    {
        Id = gr.Key,
        GamesCount = gr.Count(),
        AvgPrice = gr.Average(g => g.Price),
    });


//отслеживание изменений 
//categories = context.Categories.AsNoTracking();

/*var addingCategory = new Category { Name = "qwerty3" };
context.Categories.Add(addingCategory);

var deleteCategory = context.Categories.Find(13);
context.Categories.Remove(deleteCategory);

var updatingCategory = new Category { CategoryId = 10, Name = "qwerty6" };
context.Categories.Update(updatingCategory);
context.Entry(updatingCategory).State = EntityState.Modified; //состояние записи

context.SaveChanges();

//context.ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;

//context.Categories.Where(c => c.CategoryId > 9).ExecuteDelete();

context.Games.ExecuteUpdate(g => g
    .SetProperty(g => g.Price, g => g.Price + 1)
    .SetProperty(g => g.IsDeleted, g => false));*/
#endregion