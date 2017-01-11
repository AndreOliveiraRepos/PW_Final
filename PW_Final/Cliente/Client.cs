using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;
using Microsoft.AspNet.Identity;
using System.ComponentModel;
using System.Collections;

namespace PW_Final.Cliente
{
    public class Client
    {
        //private BindingList<PedidoReparacaoSet> myList;
        private ArrayList myList;
        private ArrayList myAnswers;
        private string id;
        private static Client instance;
        private EntitiesConnection db = new EntitiesConnection();
        private Client() {
            id = HttpContext.Current.User.Identity.GetUserId();

        }

        public static Client Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new Client();
                }
                return instance;
            }
        }


        

        public ArrayList myPedidos() {
            myList = new ArrayList();
            var pedidos = (from p in db.PedidoReparacaoSet
                      where p.AspNetUsersId == id
                      select new
                      {
                          idPedido = p.Id,
                          Descricao = p.DescricaoAvaria,
                          Data = p.DataPedido,
                          Avaliacao = p.Avaliacao,
                          Tipo = p.TipoReparacaoSet.Descricao,
                          Respostas = p.RespostaPedidoSet.Count,
                          Estado = p.Estado

                      }).ToList();
            myList.AddRange(pedidos);           
            return myList;
        }

        //actions
        public Boolean EliminaPedido(Int32 indice) {
            var cont = db.PedidoReparacaoSet.Single(p => p.Id.Equals(indice)).RespostaPedidoSet.Count;
            if (cont > 0)
            {
                var respostas = db.RespostaPedidoSet.Where(r => r.PedidoReparacaoId == indice).ToList();
                foreach (var item in respostas)
                {

                    db.RespostaPedidoSet.Remove(item);
                }
                PedidoReparacaoSet pedido = db.PedidoReparacaoSet.Single(p => p.Id.Equals(indice));
                db.PedidoReparacaoSet.Remove(pedido);
                db.SaveChanges();
            }
            else {
                PedidoReparacaoSet pedido = db.PedidoReparacaoSet.Single(p => p.Id.Equals(indice));
                db.PedidoReparacaoSet.Remove(pedido);
                db.SaveChanges();
            }
            return true;
        }

        public Boolean NovoPedido(string r,string desc) {
            var tipo = (from t in db.TipoReparacaoSet
                        where t.Descricao.Equals(r)
                        select t
                        ).FirstOrDefault();
            var today = DateTime.Now.Date;

            var result = db.PedidoReparacaoSet.Add(new PedidoReparacaoSet()
            {
                DescricaoAvaria = desc,
                DataPedido = today,
                Avaliacao = 0,
                AspNetUsersId = id,
                TipoReparacaoId = tipo.Id,
                Estado = "Sem Respostas"
                
            });
            db.SaveChanges();
            return true;
        }

        public Boolean AceitaResposta(int indicePedido, int indiceResposta) {
            var respostas = db.RespostaPedidoSet.Where(r => r.PedidoReparacaoId == indicePedido).ToList();
            foreach (var item in respostas)
            {
                if (item.Id == indiceResposta)
                {
                    item.Aceite = true;

                }
                else {
                    db.RespostaPedidoSet.Remove(item);
                }
            }
            db.PedidoReparacaoSet.Find(indicePedido).Estado = "Aguarda Resolução";
            db.SaveChanges();
            return true;
        }

        public Boolean AvaliaReparacao(int indice,int avalia)
        {

            return true;
        }

        public ArrayList myRespostas(int indice) {
            myAnswers  = new ArrayList();
            var respostas = (from r in db.RespostaPedidoSet
                           where r.PedidoReparacaoId == indice
                           select new
                           {
                               idPedido = r.PedidoReparacaoId,
                               idResposta = r.Id,
                               Valor = r.Valor,
                               Nome = r.OficinaSet.Nome,
                               Tipo = r.PedidoReparacaoSet.TipoReparacaoSet.Descricao,
                               Descricao = r.PedidoReparacaoSet.DescricaoAvaria

                           }).ToList();
            myAnswers.AddRange(respostas);
           
            return myAnswers;
        }
    }
}