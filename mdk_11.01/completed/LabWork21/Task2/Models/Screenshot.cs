using System;
using System.Collections.Generic;

namespace Task2.Models;

public partial class Screenshot
{
    public int ScreenshotId { get; set; }

    public int? GameId { get; set; }

    public string? FileName { get; set; }

    public byte[]? Photo { get; set; }
}
