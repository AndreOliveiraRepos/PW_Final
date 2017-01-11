using PW_Final.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PW_Final.Controladores
{
    public class Service
    {
        private EntitiesConnection db = new EntitiesConnection();
       
        private ArrayList listaServico;

        public Service() { }
        public void AdicionaNovo(string r, string desc,string userid) {
            var tipo = (from t in db.TipoReparacaoSet
                        where t.Descricao.Equals(r)
                        select t
                        ).FirstOrDefault();
            var today = DateTime.Now.Date;

            var result = db.ServicoSet.Add(new ServicoSet()
            {
                DescricaoAvaria = desc,
                DataPedido = today,               
                AspNetUsersId = userid,
                TipoReparacaoId = tipo.Id,               
                Estado = "Sem Respostas"
                
                
            });
            db.SaveChanges();
        }
        public void AlteraEstado(int indiceServico,string Estado) {
            db.ServicoSet.Find(indiceServico).Estado = Estado;
            db.SaveChanges();
        }
        public void AdicionaRelatorio(int indiceServico) { }
        public void AdicionaAvalicao(int indiceServico) { }
        public ArrayList ListaPorTipo(int idTipo) {
            listaServico = new ArrayList();
            var pedidos = (from p in db.ServicoSet
                           where p.TipoReparacaoId == idTipo
                           select new
                           {
                               idPedido = p.Id,
                               Descricao = p.DescricaoAvaria,
                               Data = p.DataPedido,
                               Tipo = p.TipoReparacaoSet.Descricao,
                               Orcamentos = p.OrcamentoSet.Count,
                               Estado = p.Estado

                           }).ToList();
            listaServico.AddRange(pedidos);

            return listaServico;
        }
        public ArrayList ListaPorUser(string idUser)
        {
            listaServico = new ArrayList();
            var pedidos = (from p in db.ServicoSet
                           where p.AspNetUsersId == idUser
                           select new
                           {
                               idPedido = p.Id,
                              
                               Descricao = p.DescricaoAvaria,
                               Data = p.DataPedido,
                               Tipo = p.TipoReparacaoSet.Descricao,
                               Orcamentos = p.OrcamentoSet.Count,
                               Estado = p.Estado

                           }).ToList();
            listaServico.AddRange(pedidos);
            return listaServico;
        }
        public ArrayList ListaPorUserCompletos(string idUser) {
            listaServico = new ArrayList();
            var pedidos = (from p in db.ServicoSet
                           where p.AspNetUsersId == idUser
                           select new
                           {
                               idPedido = p.Id,
                               idOficina = p.OrcamentoSet.Select(o=>o.Oficina_Id).FirstOrDefault(),
                               Descricao = p.DescricaoAvaria,
                               Data = p.DataPedido,
                               Tipo = p.TipoReparacaoSet.Descricao,
                               //quanto paga em vez disto
                               Orcamentos = p.OrcamentoSet.Count,
                               Estado = p.Estado

                           }).ToList();
            //valida
            foreach (var item in pedidos)
            {
                if (item.Estado.Equals("Efectuado"))
                {
                    listaServico.Add(item);
                }
                
            }

            return listaServico;
        }
        public ArrayList ListaPorOficinaPendentes(int idShop) {
            listaServico = new ArrayList();
            var pedidos = (from p in db.OrcamentoSet
                           where p.Oficina_Id == idShop
                           select new
                           {
                               idPedido = p.ServicoSet.Id,
                               idOficina = p.Oficina_Id,
                               Descricao = p.ServicoSet.DescricaoAvaria,
                               Data = p.ServicoSet.DataPedido,
                               Estado = p.ServicoSet.Estado
                           }).ToList();
            //valida
            foreach (var item in pedidos)
            {
                if (item.Estado.Equals("Aguarda Resolução"))
                {
                    listaServico.Add(item);
                }

            }

            return listaServico;

        }

        public ArrayList ListarTodosPorTipoSemOrçamento(int idTipo) {
            listaServico = new ArrayList();
            var pedidos = (from p in db.ServicoSet
                           where p.TipoReparacaoId == idTipo
                           select new
                           {
                               idPedido = p.Id,                               
                               Descricao = p.DescricaoAvaria,
                               Data = p.DataPedido,
                               Estado = p.Estado
                           }).ToList();
            //valida
            foreach (var item in pedidos)
            {
                if (item.Estado == "Sem Respostas" || item.Estado == "Com Respostas")
                {
                    listaServico.Add(item);
                }

            }

            return listaServico;
        }
        public void EliminaServico(int indiceServico,string user) {
            Budget budget = new Budget();
            ClientReview reviews = new ClientReview();
            ServiceReport reports = new ServiceReport();

            budget.EliminaTodosDoServico(indiceServico);
            reviews.EliminaTodasPorCliente(user);
            reports.EliminaTodasPorCliente(user);

            ServicoSet pedido = db.ServicoSet.Single(p => p.Id.Equals(indiceServico));
            db.ServicoSet.Remove(pedido);
            db.SaveChanges();
        }
        public void EditaDescricao(int indiceServico, string desc) {
            db.ServicoSet.Find(indiceServico).DescricaoAvaria = desc;
            db.SaveChanges();
        }
        public void TrocarTipoServico(int indiceServico, int idTipo) {
            db.ServicoSet.Find(indiceServico).TipoReparacaoId = idTipo;
            db.SaveChanges();
        }

        
    }
}