
using Microsoft.AspNet.Identity;
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
    public partial class ProcurarPedidos : System.Web.UI.Page
    {
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
            service = new Service();
            pedidosGridView.DataSource = service.ListarTodosPorTipoSemOrçamento(shop.getMyType());

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