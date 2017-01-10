using Microsoft.AspNet.Identity;
using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Cliente
{
    public partial class NovoPedido : System.Web.UI.Page
    {
        private Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (var t in db.TipoReparacaoSet)
            {
                tipoDropDownList.Items.Add(t.Descricao);
            }
        }


        protected void AddNew(object sender, EventArgs e)
        {
            var tipo = (from t in db.TipoReparacaoSet
                        where t.Descricao.Equals(tipoDropDownList.Text)
                        select t
                        ).FirstOrDefault();
            var today = DateTime.Now.Date;

            var result = db.PedidoReparacaoSet.Add(new PedidoReparacao()
            {
                DescricaoAvaria = Descricao.Text,
                DataPedido = today,
                Avaliacao = 0,
                AspNetUsersId = User.Identity.GetUserId(),
                TipoReparacaoId = tipo.Id

            });
            db.SaveChanges();
            successPanel.Visible = true;
            if (ErrorMessage.Visible)
                ErrorMessage.Visible = false;
            //Response.Redirect("YourPage.aspx");
        }
    }
}