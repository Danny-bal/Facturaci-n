using System;
using System.Collections.Generic;

namespace AccessData.EF;

public partial class producto
{
    public string procodigo { get; set; } = null!;

    public string prodescripcion { get; set; } = null!;

    public string prounidadmedida { get; set; } = null!;

    public decimal prosaldoinicial { get; set; }

    public decimal proingresos { get; set; }

    public decimal proegresos { get; set; }

    public decimal proajustes { get; set; }

    public decimal prosaldofinal { get; set; }

    public decimal procostoum { get; set; }

    public decimal proprecioum { get; set; }

    public string prostatus { get; set; } = null!;

    public virtual ICollection<pxf> pxfs { get; set; } = new List<pxf>();
}
