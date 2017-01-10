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
        private EntitiesConnection db = new EntitiesConnection();
        private Client client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = Client.Instance;
            foreach (var t in db.TipoReparacaoSet)
            {
                tipoDropDownList.Items.Add(t.Descricao);
            }
        }


        protected void AddNew(object sender, EventArgs e)
        {
            
            client.NovoPedido(tipoDropDownList.Text, Descricao.Text);
            successPanel.Visible = true;
            if (ErrorMessage.Visible)
                ErrorMessage.Visible = false;
            //Response.Redirect("YourPage.aspx");
        }
    }
}