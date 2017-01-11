using PW_Final.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PW_Final.Controladores
{
    public class RepairType
    {
        private EntitiesConnection db = new EntitiesConnection();
        public ArrayList ListaTodos()
        {
            ArrayList list = new ArrayList();
            var lista = db.TipoReparacaoSet;
            foreach (var item in lista)
            {
                list.Add(item.Descricao);
            }
            return list;
        }
    }
}