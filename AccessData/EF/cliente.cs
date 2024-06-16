using System;
using System.Collections.Generic;

namespace AccessData.EF;

public partial class cliente
{
    public string clicodigo { get; set; } = null!;

    public string clinombre { get; set; } = null!;

    public string cliidentificacion { get; set; } = null!;

    public string clidireccion { get; set; } = null!;

    public string clitelefono { get; set; } = null!;

    public string clicelular { get; set; } = null!;

    public string? cliemail { get; set; }

    public string clitipo { get; set; } = null!;

    public string clistatus { get; set; } = null!;

    public string? cliimage { get; set; }
}
