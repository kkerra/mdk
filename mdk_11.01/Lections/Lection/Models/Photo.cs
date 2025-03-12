using System;
using System.Collections.Generic;

namespace Lection.Models;

public partial class Photo
{
    public int IdPhoto { get; set; }

    public string Path { get; set; } = null!;

    public ICollection<Tag> Tags { get; set; } = new List<Tag>();
}
