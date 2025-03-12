using System;
using System.Collections.Generic;

namespace DatabaseLibrary.Models;

public partial class Genre
{
    public int GenreId { get; set; }

    public string Name { get; set; } = null!;

    public List<Movie> Movies { get; set; } = new();
}
