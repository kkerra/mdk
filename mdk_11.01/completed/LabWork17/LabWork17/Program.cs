using DatabaseLibrary.Helpes;
using DatabaseLibrary.Services;


var genreService = new GenreService();
Paginator paginator = new() { PageNumber = 1, PageSize = 3 };
//Sorter sorter = new() { OrderColumn = "Name" };
GenreFilter filter = new();
var genres = await genreService.GetGenresAsync(paginator/*, sorter*/);
foreach (var genre in genres)
    Console.WriteLine($"{genre.GenreId} {genre.Name}");

/*var genre = await genreService.GetGenreByIdAsync(1);
Console.WriteLine($"{genre.GenreId} {genre.Name}");

var movieService = new MovieService();

var movies = await movieService.GetMoviesAsync(5,1);
/*foreach (var movie in movies)
    Console.WriteLine($"{movie.MovieId} {movie.Title}");

var movie = await movieService.GetMovieByIdAsync(1);
Console.WriteLine($"{movie.MovieId} {movie.Title}");*/

var ticketService = new TicketService();

var tickets = await ticketService.GetTicketsAsync();
foreach (var ticket in tickets)
    Console.WriteLine($"{ticket.TicketId} {ticket.Place}");

//var ticket = await ticketService.GetTicketByIdAsync(1);
//Console.WriteLine($"{ticket.TicketId} {ticket.Place}");

//var visitorService = new VisitorService();
//var visitors = await visitorService.GetVisitorsAsync(5,2);
//foreach (var visitor in visitors)
//    Console.WriteLine($"{visitor.VisitorId} {visitor.Name}");