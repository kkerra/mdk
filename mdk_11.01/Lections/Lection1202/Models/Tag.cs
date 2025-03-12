using System;
using System.Collections.Generic;

namespace Lection1202.Models;

public partial class Tag
{
    public int TagId { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Photo> Photos { get; set; } = new List<Photo>();
}
