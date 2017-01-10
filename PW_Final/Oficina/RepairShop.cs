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

        public Boolean ResponderPedido(int indice) {
            return true;
        }
    }
}