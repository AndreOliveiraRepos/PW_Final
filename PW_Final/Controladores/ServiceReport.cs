using PW_Final.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PW_Final.Controladores
{
    public class ServiceReport
    {
        private EntitiesConnection db = new EntitiesConnection();
        public void AdicionaNovo(int indiceServico,int indiceOficina, string desc)
        {
            db.RelatorioServicoSet.Add(new RelatorioServicoSet
            {
                OficinaSetId = indiceOficina,
                ServicoSet_Id = indiceServico,
                DescricaoServico = desc

            });
            db.ServicoSet.Find(indiceServico).Estado = "Efectuado";
            db.SaveChanges();
        }
        public void EditaDescricao(int indiceServico, double v, int tipo) { }
        public void ListarPorCliente(int indiceServico, double v, int tipo) { }
        public ArrayList ListarPorOficina(int indiceShop) {
            ArrayList myList = new ArrayList();
            var reports = (from p in db.RelatorioServicoSet
                           where p.OficinaSetId == indiceShop
                           select new
                           {
                               Descricao = p.DescricaoServico,
                               Cliente = p.ServicoSet.AspNetUsers.Email


                           }).ToList();
            myList.AddRange(reports);
            return myList;
        }
        public void EliminaRelatorio(int indiceServico, double v, int tipo) { }
        public void EliminaTodasPorCliente(int indiceServico, double v, int tipo) { }
        public void EliminaTodasPorOficina(int indiceServico, double v, int tipo) { }
        public void EliminaTodasPorServico(int indiceServico, double v, int tipo) { }
    }
}