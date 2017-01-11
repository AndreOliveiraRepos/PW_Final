using PW_Final.Controladores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Cliente
{
    public partial class Avaliacao : System.Web.UI.Page
    {
        private Client client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = Client.Instance;
            //Comentario.Text = servicoAval.ToString() + userAval.ToString() + OficinaAval.ToString();
        }

        public void Avalia(object sender, EventArgs e)
        {
            client.Avalia(client.getID(),OficinaAval,servicoAval,Comentario.Text,Int32.Parse(avalicaoDropDownList.SelectedValue));
            Response.Redirect("~/Cliente/ListaAvaliacoes");
        }
        public static int servicoAval { get; set; }
        public static string userAval { get; set; }
        public static int OficinaAval { get; set; }
    }
}