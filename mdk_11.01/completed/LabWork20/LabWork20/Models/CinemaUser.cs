using System;
using System.Collections.Generic;

namespace LabWork20.Models;

public partial class CinemaUser
{
    public int UserId { get; set; }

    public string? Login { get; set; }

    public string? Password { get; set; }

    public int? RoleId { get; set; }

    public virtual CinemaUserRole? Role { get; set; }
}
