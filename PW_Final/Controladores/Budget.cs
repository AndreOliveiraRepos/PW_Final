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
            if (db.ServicoSet.Find(indiceServico).Estado.Equals("Sem respostas")) {
                
                db.ServicoSet.Find(indiceServico).Estado = "Respondido";
            }
            db.SaveChanges();
        }

        public void AceitaOrcamento(int indiceOrcamento) { }

        public void ApagaOrcamento(int indiceOrcamento){
            var orc = db.OrcamentoSet.Find(indiceOrcamento);
            db.OrcamentoSet.Remove(orc);
            db.SaveChanges();
        }

        public void EditaValor(double v) { }

        public void ListaPorOficina(int idOficina) { }

        public ArrayList ListaPorServico(int idServico) {
            ArrayList myList = new ArrayList();
            //var orc = db.ServicoSet.Find(idServico).OrcamentoSet.ToList();
            //myAnswers =
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