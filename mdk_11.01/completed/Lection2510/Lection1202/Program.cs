using Lection1202.Data;
using Lection1202.Models;
using System.Text.Json;
using System.Xml.Serialization;


Console.WriteLine("связи");

var filePath = @"Y:\МДК.11.01\Import\todos.json";
var json = File.ReadAllText(filePath);

var options = new JsonSerializerOptions
{
    PropertyNameCaseInsensitive = true, // игнор регистра
};

var todos = JsonSerializer.Deserialize<List<Todo>>(json, options);
var context = new GameStoreContext();
/*context.Todos.AddRange(todos);
context.SaveChanges();*/

//serialization
options = new JsonSerializerOptions
{
    WriteIndented = true, // форматирование данных
    PropertyNamingPolicy = JsonNamingPolicy.CamelCase, //1 маленькая 
};
json = JsonSerializer.Serialize<List<Todo>>(todos, options);


var fileName = "todos.xml";
XmlSerializer serializer = new XmlSerializer(typeof(List<Todo>));
using (FileStream stream = new(fileName, FileMode.OpenOrCreate))
{
    serializer.Serialize(stream, todos);
}

using (FileStream stream = new(fileName, FileMode.OpenOrCreate))
{
    var todos2 = serializer.Deserialize(stream) as List<Todo>;
}


//csv
filePath = @"Y:\МДК.11.01\Import\photos.txt";
var lines = File.ReadAllLines(filePath);


foreach (var line in lines)
{
    var cells = line.Split(';'); // чтение из ячеек
    //....

    var tags = cells[1].Split(",", StringSplitOptions.RemoveEmptyEntries);
}

Game game = new() { Name = "mario" };
var logo = File.ReadAllBytes(filePath);
if (logo.Length <= 5 << 20) //<= 5mb / 5 * 1024 * 1024
{
    game.Logo = logo;
}
context.Games.Add(game);
context.SaveChanges();

Photo photo = new();
photo.Path = Path.GetFullPath(filePath); //получили имя файла
var file = new FileInfo(filePath);
if(file.Length <= 5 << 20)
    File.Copy(fileName, $@"\\logos\{fileName}", true);



Console.WriteLine();


/*var lines = File.ReadAllLines(filePath);


foreach (var line in lines)
{
    var cells = line.Split(';'); // 1.png;winter

    // родительская запись
    var photo = context.Photos
        .Include(photo => photo.Tags) // для составного PK в PhotoTag
        .FirstOrDefault(p => p.Path == cells[0]) ??
        new Photo { Path = cells[0] };

    if (photo.Tags.FirstOrDefault(t => t.Name == cells[1]) == null)
    {
        var tag = context.Tags.FirstOrDefault(t => t.Name == cells[1]) ??
            new Tag { Name = cells[1] };
        photo.Tags.Add(tag);
    }

    context.Photos.Update(photo);
    context.SaveChanges();
}

filePath = @"Y:\МДК.11.01\Import\games.txt";
lines = File.ReadAllLines(filePath);
foreach (var line in lines)
{
    var cells = line.Split(';'); // 1.png;winter

    var game = new Game
    {
        Name = cells[0],
        Price = Convert.ToDecimal(cells[1]),
        Category = context.Categories.FirstOrDefault(c => c.Name == cells[2]) ?? new Category { Name = cells[2] }
    };
    context.Games.Add(game);


}    
context.SaveChanges();*/