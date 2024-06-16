using System;
using System.Collections.Generic;

namespace AccessData.EF;

public partial class factura
{
    public string facnumero { get; set; } = null!;

    public string clicodigo { get; set; } = null!;

    public DateOnly facfecha { get; set; }

    public decimal facsubtotal { get; set; }

    public decimal? facdescuento { get; set; }

    public decimal? faciva { get; set; }

    public decimal? facice { get; set; }

    public string facformapago { get; set; } = null!;

    public string facstatus { get; set; } = null!;

    public virtual ICollection<pxf> pxfs { get; set; } = new List<pxf>();
}
