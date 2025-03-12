using DBLibrary;

await DAL.UpdatePriceAsync(250, 1);

Console.WriteLine(await DAL.GetTitleByIdAsync(1));

var titles = await DAL.GetTitlesAsync();
foreach (var title in titles)
    Console.WriteLine(title);

var games = await DAL.GetGamesAsync();
foreach (var game in games)
    Console.WriteLine($"{game.Id} {game.Name} {game.Price}");
