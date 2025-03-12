using LabWork15;

DatabaseContext context = new("PRSERVER\\SQLEXPRESS", "ispp3503", "ispp3503", "3503");
//CategoryRepository repository = new(context);
//await repository.AddAsync(new Category { Name = "test1" });

//Category category = await repository.GetByIdAsync(1);
//Console.WriteLine(category.Name);

VisitorRepository visitorRepository = new(context);
//Console.WriteLine(await visitorRepository.AddAsync(new Visitor { Phone = "1237845" }));

Visitor visitor = await visitorRepository.GetByIdAsync(2);
//Console.WriteLine(visitor.Name);

//var visitors = await visitorRepository.GetAllAsync();
//foreach(var visitor in visitors)
//    Console.WriteLine(visitor.Name);


//await repository.DeleteAsync(8);

GenreRepository genreRepository = new(context);
Console.WriteLine(await genreRepository.AddAsync(new Genre { Name="test"}));
//var genres = await genreRepository.GetAllAsync();
//foreach (var genre in genres)
//    Console.WriteLine(genre.Name);

Genre genre = await genreRepository.GetByIdAsync(2);
Console.WriteLine(genre.Name);
//await genreRepository.DeleteAsync(8);

await genreRepository.UpdateAsync(new Genre { GenreId = 6, Name = "test" });