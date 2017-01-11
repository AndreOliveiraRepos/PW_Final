using PW_Final.Controladores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Oficina
{
    public partial class Pendentes : System.Web.UI.Page
    {
        public RepairShop shop;
        protected void Page_Load(object sender, EventArgs e)
        {
            shop = RepairShop.Instance;
            fillData();
        }

        public void fillData() {
            Service service = new Service();
            pedidosGridView.DataSource = service.ListaPorOficinaPendentes(shop.getID());
            pedidosGridView.DataBind();
        }
        protected void Resolver(object sender, EventArgs e) {
            //indice do pedido
            //indice da oficina
            HiddenField hd = (HiddenField)((LinkButton)sender).FindControl("idPedido");
            int ip = Convert.ToInt32(hd.Value);
            hd = (HiddenField)((LinkButton)sender).FindControl("idOficina");
            int io = Convert.ToInt32(hd.Value);
            NovoRelatorio.oficinaID = io;
            NovoRelatorio.servicoID = ip;

            
            Response.Redirect("~/Oficina/NovoRelatorio");
        }
    }
}