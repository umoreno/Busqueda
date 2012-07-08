using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using pequenoModel;

/// <summary>
/// Summary description for IExpedienteRepository
/// </summary>
interface IExpedienteRepository
{
    IQueryable<Expediente> GetExpedientes();
    IQueryable<ExpedienteViewModel> GetExpedientesBusqueda(string name);
    IQueryable<JuntaViewModel> GetJuntas();
    IQueryable<DemandadoViewModel> GetDemandados();
}
