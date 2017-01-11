using Microsoft.AspNet.Identity;
using PW_Final.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PW_Final.Oficina
{
    public class RepairShop
    {
        private ArrayList myList;
        private ArrayList myAnswers;
        private string id;
        private static RepairShop instance;
        private EntitiesConnection db = new EntitiesConnection();

        private RepairShop()
        {
            id = HttpContext.Current.User.Identity.GetUserId();

        }

        public static RepairShop Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new RepairShop();
                }
                return instance;
            }
        }

        public Boolean ResponderPedido(int indice, double v) {
            //necessary fields
            
            OficinaSet myTipo = (from o in db.OficinaSet
                                 where o.AspNetUsers_Id == id
                                 select o).FirstOrDefault();
            //adding
            db.RespostaPedidoSet.Add(new RespostaPedidoSet
            {
                Oficina_Id = myTipo.Id,
                PedidoReparacaoId = indice,
                Valor = v,
                Aceite = false
                

            });
            db.PedidoReparacaoSet.Find(indice).Estado = "Com respostas";
            db.SaveChanges();
            //refresh
            
            return true;
        }

        public ArrayList myPedidos() {
            myList = new ArrayList();
            OficinaSet myTipo = (from o in db.OficinaSet
                                 where o.AspNetUsers_Id == id
                                 select o).FirstOrDefault();

            var pedidos = (from p in db.PedidoReparacaoSet
                            where p.TipoReparacaoId == myTipo.TipoReparacaoId
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

        public ArrayList myRespostas(int indice) {
            return myAnswers;
        }

        public Boolean RemoverResposta(int indice) {
            return true;
        }
    }
}