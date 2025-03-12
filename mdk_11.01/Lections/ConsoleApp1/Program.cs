using Scaffold.DatabaseContext;

Console.WriteLine("Hello, World!");

var context = new AppDbContext();
var games = context.Games.ToList();
foreach (var game in games)
    Console.WriteLine($"{game.GameId} {game.Name}");

