using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;
using Lection1204ApiControllers.Data;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OpenApi;
using Microsoft.EntityFrameworkCore;

namespace Lection1204ApiControllers.Models;

public partial class Category
{
    public int CategoryId { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Game> Games { get; set; } = new List<Game>();
}