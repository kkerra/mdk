using Lection3110;
using Microsoft.EntityFrameworkCore;

var service = new CategoryService();


//select
var categories = await service.GetCategoriesAsync();
foreach (var category in categories)
    Console.WriteLine($"{category.CategoryId} {category.Name}");

//await service.DeleteCategoryAsync(12);

var context = new AppDbContext();
var allCategories = await context.Categories.ToListAsync();
var games = await context.Games.ToListAsync();

foreach (var game in games)
    Console.WriteLine($"{game.GameId} {game.Name} {game.CategoryId} {game.Category.Name}");

