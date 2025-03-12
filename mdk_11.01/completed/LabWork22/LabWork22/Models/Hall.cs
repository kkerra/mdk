using System;
using System.Collections.Generic;

namespace LabWork22.Models;

public partial class Hall
{
    public byte HallId { get; set; }

    public byte? RowAmount { get; set; }

    public byte? SeatsAmount { get; set; }

    public string? Cinema { get; set; }

    public byte? HallNumber { get; set; }

    public bool? IsVip { get; set; }

    public virtual ICollection<Session> Sessions { get; set; } = new List<Session>();
}
