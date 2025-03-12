using DomainLayer;
using System.Net.Http.Json;
using System.Text.Json;

Console.WriteLine("Hello, World!");
CategoryService service = new();

var categories = await service.GetCategoriesAsync();
foreach (var category in categories)
    Console.WriteLine($"{category.CategoryId} {category.Name}");

Console.WriteLine();

await service.DeleteCategoryAsync(24);
categories = await service.GetCategoriesAsync();
foreach (var category in categories)
    Console.WriteLine($"{category.CategoryId} {category.Name}");
//HttpClient client = new()
//{
//    BaseAddress =
//    new Uri("http://localhost:5299/api/v1/")
//};

//var response = await client.GetAsync("categories");

//if (response.IsSuccessStatusCode)
//{
//    var content = await response.Content.ReadAsStringAsync();

//    var options = new JsonSerializerOptions
//    {
//        PropertyNameCaseInsensitive = true,
//    };
//    var categories = JsonSerializer.Deserialize<List<Category>>(content, options);
//    /*foreach (var category in categories)
//     * Console.WriteLine($"{category.CategoryId} {category.Name}");
//    */
//    Console.WriteLine(content);
//}
//else
//{
//    var error = response.StatusCode;
//    Console.WriteLine($"Http error {error}");
//}

//int id = 23;
//var category = await client.GetFromJsonAsync<Category>($"categories/{id}");
//category.Name = "changed name 123";
//try
//{
//    response = await client.PutAsJsonAsync($"categories/{id}", category);
//    response.EnsureSuccessStatusCode(); // exception: 2xx
//}
//catch (HttpRequestException ex)
//{
//    Console.WriteLine(ex.Message);
//}

//try
//{
//    response = await client.GetAsync("categories");
//    response.EnsureSuccessStatusCode();
//    var categories2 = await response.Content.ReadFromJsonAsync<List<Category>>();
//    foreach (var category1 in categories2)
//        Console.WriteLine($"{category1.CategoryId} {category1.Name}");

//}
//catch (HttpRequestException ex)
//{
//    Console.WriteLine(ex.Message);
//}

//Console.WriteLine();

/*var categories = await client.GetFromJsonAsync<List<Category>>("categories");
foreach (var category in categories)
    Console.WriteLine($"{category.CategoryId} {category.Name}");

int id = 10;
var category1 = await client.GetFromJsonAsync<Category>($"categories/{id}");
Console.WriteLine($"{category1.CategoryId} {category1.Name}");

id = 22;
await client.DeleteAsync($"categories/{id}");

Category category2 = new() { Name = "test category" };
await client.PostAsJsonAsync("categories", category2);

id = 23;
category2 = await client.GetFromJsonAsync<Category>($"categories/{id}");
category2.Name = "changed name";
await client.PutAsJsonAsync($"categories/{category2.CategoryId}", category2);*/