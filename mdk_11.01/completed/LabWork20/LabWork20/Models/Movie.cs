using System;
using System.Collections.Generic;

namespace LabWork20.Models;

public partial class Movie
{
    public int MovieId { get; set; }

    public string Title { get; set; } = null!;

    public short Duration { get; set; }

    public short ReleaseYear { get; set; }

    public string? Description { get; set; }

    public byte[]? Poster { get; set; }

    public string? AgeRating { get; set; }

    public DateOnly? RentalBeginning { get; set; }

    public DateOnly? RentalEnd { get; set; }

    public int? GenreId { get; set; }

    public bool IsDeleted { get; set; }

    public virtual ICollection<Session> Sessions { get; set; } = new List<Session>();
}
