using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace PW_Final.Cliente
{
    public partial class Pedidos : System.Web.UI.Page
    {
        private Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            fillData();
        }

        public void fillData()
        {
            var currentUser = User.Identity.GetUserId();

           

            this.pedidosGridView.DataSource = (from p in db.PedidoReparacaoSet
                                          where p.AspNetUsersId == currentUser
                                          select new
                                          {
                                              idPedido = p.Id,
                                              Descricao = p.DescricaoAvaria,
                                              Data = p.DataPedido,
                                              Avaliacao = p.Avaliacao,
                                              Tipo = p.TipoReparacao.Descricao,
                                              Respostas = p.RespostaPedido.Count

                                          }).ToList();
           
            
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
            PedidoReparacao pedido = db.PedidoReparacaoSet.Single(p => p.Id.Equals(i));
            db.PedidoReparacaoSet.Remove(pedido);
            db.SaveChanges();
            fillData();
            
        }
        protected void Respostas(object sender, EventArgs e)
        {
        }
    }
}