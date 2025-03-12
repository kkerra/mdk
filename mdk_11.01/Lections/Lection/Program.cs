using Lection.Data;
using Lection.Models;
using Microsoft.EntityFrameworkCore;

Console.WriteLine("Relation");
AppDbContext context = new AppDbContext();

//1:M
string filePath = @"Y:\МДК.11.01\Import\games.txt";
string[] lines = File.ReadAllLines(filePath);
/*foreach (string line in lines)
{
    string[] fields = line.Split(';');
    
    //чтение записи родительской(категория)
    var category = context.Categories.SingleOrDefault(c => c.Name == fields[2]);
    if (category == null)
    {
        category = new() { Name = fields[2] };
        context.Categories.Add(category);
    }

    //чтение записи дочерней(игра)
    Game game = new()
    {
        Name = fields[0],
        Price = Convert.ToDecimal(fields[1]),
        Category = category
    };
    context.Games.Add(game);

    context.SaveChanges();

}*/


//M:M
filePath = @"Y:\МДК.11.01\Import\photos.txt";
lines = File.ReadAllLines(filePath);
foreach (string line in lines)
{
    string[] fields = line.Split(';');

    // чтение записи родительской (тэги)
    var tag = context.Tags.SingleOrDefault(t => t.Name == fields[1]);
    if (tag == null)
    {
        tag = new() { Name = fields[1] };
        context.Tags.Add(tag);
    }

    // чтение записи родительской (фото)
    var photo = context.Photos.SingleOrDefault(p => p.Path == fields[0]);
    if (photo == null)
    {
        photo = new() { Path = fields[0] };
        context.Photos.Add(photo);
    }

    //чтение записи дочерней(tags-photo)
    if (!photo.Tags.Contains(tag))
        photo.Tags.Add(tag);

    context.SaveChanges();

}
