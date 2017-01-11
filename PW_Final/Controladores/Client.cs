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
        public ArrayList ListarRespostasServico(int indiceServico) {
            myAnswers = new ArrayList();
            Budget budget = new Budget();
            myAnswers = budget.ListaPorServico(indiceServico);
            return myAnswers;
        }
        public void AceitaResposta(int indicePedido, int indiceResposta) {
            Budget budget = new Budget();
            budget.AceitaOrcamento(indicePedido, indiceResposta);
        }
        public void ApagaOrcamento(int indiceOrcamento) {
            Budget budget = new Budget();
            budget.ApagaOrcamento(indiceOrcamento);
         
        }
        public ArrayList ServicosCompletos() {
            myList = new ArrayList();
            myList = service.ListaPorUserCompletos(id);
            return myList;
        }
        public void Avalia(string userId, int indiceOficina, int indiceServico, string desc, int a) {
            ClientReview review = new ClientReview();
            review.AdicionaNova(userId, indiceOficina, indiceServico, desc, a);
        }

        public ArrayList ListaAvaliacoes() {
            myList = new ArrayList();
            ClientReview review = new ClientReview();
            myList = review.ListarPorCliente(id);
            return myList;
        }
        public string getID() { return id; }
    }
}