using PW_Final.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PW_Final.Controladores
{
    public class Budget
    {
        private EntitiesConnection db = new EntitiesConnection();
        public void AdicionaNovo(int indiceServico, double v,int tipo) {
            db.OrcamentoSet.Add(new OrcamentoSet
            {
                Oficina_Id = tipo,
                ServicoSetId = indiceServico,                
                Valor = v,
                Aceite = false


            });
                
            db.ServicoSet.Find(indiceServico).Estado = "Respondido";
            
            db.SaveChanges();
        }

        public void AceitaOrcamento(int indiceServico,int indiceOrcamento) {
            var respostas = db.OrcamentoSet.Where(r => r.ServicoSetId == indiceServico).ToList();
            foreach (var item in respostas)
            {
                if (item.Id == indiceOrcamento)
                {
                    item.Aceite = true;

                }
                else {
                    db.OrcamentoSet.Remove(item);
                }
            }
            db.ServicoSet.Find(indiceServico).Estado = "Aguarda Resolução";
            db.SaveChanges();
        }

        public void ApagaOrcamento(int indiceOrcamento){
            var orc = db.OrcamentoSet.Find(indiceOrcamento);
            db.OrcamentoSet.Remove(orc);
            db.SaveChanges();
        }

        public void EditaValor(double v) { }

        public ArrayList ListaPorOficina(int idOficina) {
            ArrayList myList = new ArrayList();

           // var orc = db.ServicoSet.Find(idServico).OrcamentoSet.ToList();
            var pedidos = (from p in db.OrcamentoSet
                           where p.Oficina_Id == idOficina
                           select new
                           {
                               idPedido = p.ServicoSetId,
                               idOficina = p.Oficina_Id,
                               Descricao = p.ServicoSet.DescricaoAvaria,
                               Aceite = p.Aceite,
                               Valor = p.Valor,
                               Cliente = p.ServicoSet.AspNetUsers.Email


                           }).ToList();
            myList.AddRange(pedidos);
            return myList;
        }

        public void ListaPendentesPorOficina(int idOficina) { }

        public ArrayList ListaPorServico(int idServico) {
            ArrayList myList = new ArrayList();
            var orc = db.ServicoSet.Find(idServico).OrcamentoSet.ToList();
            var pedidos = (from p in db.OrcamentoSet
                           where p.ServicoSetId == idServico
                           select new
                           {
                               idPedido = p.ServicoSetId,
                               idOrcamento = p.Id,
                               Descricao = p.ServicoSet.DescricaoAvaria,                              
                               Tipo = p.ServicoSet.TipoReparacaoSet.Descricao,
                               Valor = p.Valor,
                               Nome = p.OficinaSet.Nome
                               

                           }).ToList();
            myList.AddRange(pedidos);
            return myList;
        }

        public void AlteraEstado() { }

        public void EliminaTodosDoServico(int indiceServico) {
            var cont = db.ServicoSet.Find(indiceServico).OrcamentoSet.Count;
            if (cont > 0)
            {
                var respostas = db.OrcamentoSet.Where(r => r.ServicoSetId == indiceServico).ToList();
                foreach (var item in respostas)
                {

                    db.OrcamentoSet.Remove(item);
                }
                
                db.SaveChanges();
            }
            
        }
    }
}