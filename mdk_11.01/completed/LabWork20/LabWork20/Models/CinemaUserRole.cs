using System;
using System.Collections.Generic;

namespace LabWork20.Models;

public partial class CinemaUserRole
{
    public int RoleId { get; set; }

    public string? Role { get; set; }

    public virtual ICollection<CinemaUser> CinemaUsers { get; set; } = new List<CinemaUser>();
}
