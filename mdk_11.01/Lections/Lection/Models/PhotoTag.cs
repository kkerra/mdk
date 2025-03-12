using System;
using System.Collections.Generic;

namespace Lection.Models;

public partial class PhotoTag
{
    public string IdPhoto { get; set; } = null!;

    public int TagId { get; set; }

    public string Name { get; set; } = null!;
}
