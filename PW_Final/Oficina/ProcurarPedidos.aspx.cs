
using Microsoft.AspNet.Identity;
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
        private EntitiesConnection db = new EntitiesConnection();
        private static Int32 aux;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillData();
        }
        public void fillData()
        {
            var currentUser = User.Identity.GetUserId();
            OficinaSet myTipo = (from o in db.OficinaSet
                          where o.AspNetUsers_Id == currentUser
                          select o).FirstOrDefault();

            this.pedidosGridView.DataSource = (from p in db.PedidoReparacaoSet
                                               where p.TipoReparacaoId == myTipo.TipoReparacaoId
                                               select new
                                               {
                                                   idPedido = p.Id,
                                                   Descricao = p.DescricaoAvaria,
                                                   Data = p.DataPedido,
                                                   Avaliacao = p.Avaliacao,
                                                   Tipo = p.TipoReparacaoSet.Descricao,
                                                   Respostas = p.RespostaPedidoSet.Count

                                               }).ToList();


            pedidosGridView.DataBind();

        }

        protected void NovaResposta(object sender, EventArgs e)
        {
            HiddenField hd = (HiddenField)((LinkButton)sender).FindControl("idPedido");
            aux = Convert.ToInt32(hd.Value);
            respostaPanel.Visible = true;
        }
        protected void AddNew(object sender, EventArgs e) {

            int i = aux;
            double v = Convert.ToDouble(Valor.Text);

            //necessary fields
            var currentUser = User.Identity.GetUserId();
            OficinaSet myTipo = (from o in db.OficinaSet
                                 where o.AspNetUsers_Id == currentUser
                                 select o).FirstOrDefault();
            //adding
            db.RespostaPedidoSet.Add(new RespostaPedidoSet {
                Oficina_Id = myTipo.Id,
                PedidoReparacaoId = i,
                Valor = v
                
            });    
            db.SaveChanges();
            //refresh
            respostaPanel.Visible = false;
            aux = 0;
            fillData();
        }
    }
}