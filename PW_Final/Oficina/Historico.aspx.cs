using PW_Final.Controladores;
using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Oficina
{
    public partial class Historico : System.Web.UI.Page
    {
        private EntitiesConnection db = new EntitiesConnection();
        private RepairShop shop;
        private Service service;
        private Budget budget;
        private static Int32 aux;
        protected void Page_Load(object sender, EventArgs e)
        {
            shop = RepairShop.Instance;
            fillData();
        }
        public void fillData()
        {

            pedidosGridView.DataSource = shop.TodosOsPedidos();

            pedidosGridView.DataBind();

        }

        protected void NovaResposta(object sender, EventArgs e)
        {
            HiddenField hd = (HiddenField)((LinkButton)sender).FindControl("idPedido");
            aux = Convert.ToInt32(hd.Value);
            respostaPanel.Visible = true;
        }
        protected void AddNew(object sender, EventArgs e)
        {

            int i = aux;
            double v = Convert.ToDouble(Valor.Text);



            shop.ResponderPedido(i, v);
            //refresh
            respostaPanel.Visible = false;
            aux = 0;
            fillData();
        }
    }

}