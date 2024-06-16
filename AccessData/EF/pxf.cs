using System;
using System.Collections.Generic;

namespace AccessData.EF;

public partial class pxf
{
    public string facnumero { get; set; } = null!;

    public string procodigo { get; set; } = null!;

    public decimal pxfcantidad { get; set; }

    public decimal pxfvalor { get; set; }

    public decimal pxfsubtotal { get; set; }

    public string pxfstatus { get; set; } = null!;

    public virtual factura facnumeroNavigation { get; set; } = null!;

    public virtual producto procodigoNavigation { get; set; } = null!;
}
