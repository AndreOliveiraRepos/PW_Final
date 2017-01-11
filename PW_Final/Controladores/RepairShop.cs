using Microsoft.AspNet.Identity;
using PW_Final.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PW_Final.Controladores
{
    public class RepairShop
    {
        private ArrayList myList;
        
        private string id;
        private static RepairShop instance;
        private EntitiesConnection db = new EntitiesConnection();
        private int idShop;
        private int idTipo;
        private RepairShop()
        {
            id = HttpContext.Current.User.Identity.GetUserId();
            OficinaSet myTipo = (from o in db.OficinaSet
                                 where o.AspNetUsers_Id == id
                                 select o).FirstOrDefault();
            idTipo = myTipo.TipoReparacaoId;
            idShop = myTipo.Id;
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
        public ArrayList TodosOsPedidos()
        {
            myList = new ArrayList();
            Service service = new Service();
            myList = service.ListaPorTipo(idTipo);
            return myList;
        }
        public void ResponderPedido(int indice, double v) {
            Budget budget = new Budget();
            budget.AdicionaNovo(indice, v, idTipo);
            
            //necessary fields


        }    
        public ArrayList ListaReviews() {
            myList = new ArrayList();
            ClientReview cr = new ClientReview();
            myList = cr.ListarPorOficina(idShop);
            return myList;
        }
        public Boolean RemoverResposta(int indice) {
            return true;
        }
        public int getID() { return idShop; }
        public OficinaSet ShopData(int id) {
            OficinaSet oficina = db.OficinaSet.Find(id);

            return oficina;
        }
        public ArrayList ListarPendentes() {
            myList = new ArrayList();
            return myList;
        }
        public int getMyType() { return idTipo; }
    }
}
