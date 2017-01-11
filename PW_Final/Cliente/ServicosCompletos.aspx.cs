using PW_Final.Controladores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Cliente
{
    public partial class ServicosCompletos : System.Web.UI.Page
    {
        private Client client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = Client.Instance;
            fillData();
        }
        public void fillData()
        {
            this.pedidosGridView.DataSource = client.ServicosCompletos();

            pedidosGridView.DataBind();


        }

        public void Avaliar(object sender, EventArgs e) {
            //Avaliacao.servicoAval = idPedido;
            HiddenField hd = (HiddenField)((LinkButton)sender).FindControl("idPedido");
            int ip = Convert.ToInt32(hd.Value);
            hd = (HiddenField)((LinkButton)sender).FindControl("idOficina");
            int io = Convert.ToInt32(hd.Value);
            Avaliacao.servicoAval = ip;
            Avaliacao.userAval = client.getID();
            Avaliacao.OficinaAval = io;
            Response.Redirect("~/Cliente/Avaliacao");

        }
    }
}