using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using pequenoModel;

/// <summary>
/// Summary description for ExpedienteRepository
/// </summary>
public class ExpedienteRepository : IExpedienteRepository
{
	
        /// <summary>
        /// IQueryable of all Expedientes
        /// </summary>
        /// <returns></returns>
        public IQueryable<Expediente> GetExpedientes()
        {
            var dataContext = new pequenoEntities6();
            var expedientes = from p in dataContext.Expedientes
                           select p;
            return expedientes;
        }

        /// <summary>
        /// IQueryable of Projects projected 
        /// into the ProductViewModel class
        /// </summary>
        /// <returns></returns>
        public IQueryable<ExpedienteViewModel> GetExpedientesBusqueda(string name)
        {
            var busquedaExpediente = from e in GetExpedientes()
                                    select new ExpedienteViewModel
                                    {
                                        id_expediente = (int)e.id_expediente,
                                        Num_expediente = e.Num_expediente,
                                        año = (int)e.año,
                                        fcve_junta = (int)e.fcve_junta,
                                        nom_actor = e.nom_actor,
                                        fcve_demandado = (int)e.fcve_demandado,
                                    };
            // Filter on nom_actor 
            if (name.Length !=0)
            {
                busquedaExpediente = busquedaExpediente.Where(e => String.Compare(e.nom_actor, name.ToString(), true) != 0);
            }

            return busquedaExpediente;
        }

        
        public IQueryable<JuntaViewModel> GetJuntas()
        {
            var dataContext = new pequenoEntities6();
            var juntas = from s in dataContext.Juntas
                            select new JuntaViewModel
                            {
                                cve_junta = (int)s.cve_junta,
                                Desc_junta = s.Desc_junta
                            };
            return juntas;
        }

        public IQueryable<DemandadoViewModel> GetDemandados()
        {
            var dataContext = new pequenoEntities6();
            var categories = from c in dataContext.Demandadoes
                             select new DemandadoViewModel
                             {
                                 cve_demandado = (int)c.cve_demandado,
                                 Desc_demandado = c.Desc_demandado
                             };
            return categories;
        }
        public ExpedienteRepository()
        {	
        }
}