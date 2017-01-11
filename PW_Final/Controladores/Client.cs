using PW_Final.Models;
using System;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using System.Collections;


namespace PW_Final.Controladores
{
    public class Client
    {
        //private BindingList<PedidoReparacaoSet> myList;
        private ArrayList myList;
        private ArrayList myAnswers;
        private string id;
        private static Client instance;
        private EntitiesConnection db = new EntitiesConnection();
        private Service service;
        
        private Client() {
            id = HttpContext.Current.User.Identity.GetUserId();
            service = new Service();
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


        

       public ArrayList MeusPedidos() {
            myList = new ArrayList();
            myList = service.ListaPorUser(id);     
            return myList;
        }
        public void NovoPedido(string r, string desc) {
            service.AdicionaNovo(r, desc, id);
        }
        //actions

        public void EliminaPedido(Int32 indice) {
            service.EliminaServico(indice);
        }
        public void ListarRespostasServico(int indiceServico) {
            myAnswers = new ArrayList();
            Budget budget = new Budget();
            myAnswers = budget.ListaPorServico(indiceServico);

        }
        /* public Boolean NovoPedido(string r,string desc) {
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
         }*/
    }
}