using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ExpedienteViewModel
/// </summary>
public class ExpedienteViewModel
{
    public int id_expediente { get; set; }
    public string Num_expediente { get; set; }
    public int año { get; set; }
    public int fcve_junta { get; set; }
    public string nom_actor { get; set; }
    public int fcve_demandado { get; set; }
	public ExpedienteViewModel()
	{

	}
}