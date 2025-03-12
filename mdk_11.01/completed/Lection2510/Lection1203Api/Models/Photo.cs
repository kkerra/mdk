using System;
using System.Collections.Generic;

namespace Lection1203Api.Models;

public partial class Photo
{
    public int PhotoId { get; set; }

    public string Path { get; set; } = null!;

    public virtual ICollection<Tag> Tags { get; set; } = new List<Tag>();
}
