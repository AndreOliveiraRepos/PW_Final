using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using PW_Final.Controladores;

namespace PW_Final.Cliente
{
    public partial class Pedidos : System.Web.UI.Page
    {
        private EntitiesConnection db = new EntitiesConnection();
        private Client client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = Client.Instance;
            fillData();
        }

        public void fillData()
        {
            this.pedidosGridView.DataSource = client.MeusPedidos();
           
            pedidosGridView.DataBind();
            

        }
        protected void AddNew(object sender, EventArgs e)
        {
            Response.Redirect("~/Cliente/NovoPedido.aspx");
        }
        protected void Delete(object sender, EventArgs e)
        {
            HiddenField hd = (HiddenField)((LinkButton)sender).FindControl("idPedido");
            int i = Convert.ToInt32(hd.Value);
            client.EliminaPedido(i);
            fillData();
            
        }
        protected void Respostas(object sender, EventArgs e)
        {
            HiddenField hd = (HiddenField)((LinkButton)sender).FindControl("idPedido");
            int i = Convert.ToInt32(hd.Value);
            respostasGridView.DataSource = client.ListarRespostasServico(i);
            respostasGridView.DataBind();
            respostasPanel.Visible = true;
        }
        protected void AceitaResposta(object sender, EventArgs e) {
            HiddenField hd = (HiddenField)((LinkButton)sender).FindControl("idPedido");
            int ip = Convert.ToInt32(hd.Value);
            hd = (HiddenField)((LinkButton)sender).FindControl("idResposta");
            int ir = Convert.ToInt32(hd.Value);
            /*client.AceitaResposta(ip, ir);
            respostasGridView.DataSource = client.myRespostas(ip);*/
            respostasGridView.DataBind();
        }
        
    }
}