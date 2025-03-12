using Lection1203Api.Data;
using Lection1203Api.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<GameStoreContext>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapGet("/categories", (GameStoreContext context)
    => context.Categories.ToList());
app.MapGet("/categories/{id:int}", (int id, GameStoreContext context)
    => context.Categories.Find(id) is Category category ? Results.Ok(category) : Results.NotFound());

app.MapGet("/categories/filter", async (string? name, string? sortBy, GameStoreContext context, int page = 1, int pageSize = 5) =>
{
    var query = context.Categories.AsQueryable();
    //filter
    if (!String.IsNullOrEmpty(name))
        query = query.Where(x => x.Name.Contains(name));
    //sort
    query = sortBy?.ToLower() switch
    {
        "id" => query.OrderBy(c => c.CategoryId),
        "name" => query.OrderBy(c => c.Name),
        _ => query
    };
    //pagination
    var items = await query.Skip(pageSize * (page - 1)).Take(pageSize).ToListAsync();
    return items;
});

app.MapPost("/categories", (Category category, GameStoreContext context)
    =>
{
    try
    {
        context.Categories.Add(category);
        context.SaveChanges();
        return Results.Created();
    }
    catch
    {
        return Results.BadRequest();
    }
});

app.MapDelete("/categories/{id:int}", (int id, GameStoreContext context)
    =>
{
    var category = context.Categories.Find(id);
    if (category == null)
        return Results.NotFound();
    try
    {
        context.Categories.Remove(category);
        context.SaveChanges();
        return Results.NoContent();
    }
    catch
    {
        return Results.BadRequest();
    }
});

app.MapPut("/categories/{id:int}", (int id, Category category, GameStoreContext context)
    =>
{
    if (category.CategoryId != id)
        return Results.BadRequest();

    /*var currentCategory = context.Categories.Find(id);
    if (context.Categories.Find(id) == null)
        return Results.NotFound();*/
    try
    {
        //currentCategory = category;
        context.Categories.Update(category); //  context.Entry(category).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
        context.SaveChanges();
        return Results.Ok();
    }
    catch
    {
        return Results.BadRequest();
    }
});

var summaries = new[]
{
    "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
};

app.MapGet("/weatherforecast", () =>
{
    var forecast = Enumerable.Range(1, 5).Select(index =>
        new WeatherForecast
        (
            DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
            Random.Shared.Next(-20, 55),
            summaries[Random.Shared.Next(summaries.Length)]
        ))
        .ToArray();
    return forecast;
})
.WithName("GetWeatherForecast")
.WithOpenApi();

app.Run();

internal record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}
