using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Reparacao
{

    public partial class Reparacoes : System.Web.UI.Page
    {
        private Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack){
                fillData();
            }
        }

        private void fillData()
        {
            this.pendingGridView.DataSource = db.PedidoReparacaoSet.Select(pedido => new
            {
                Tipo = pedido.TipoReparacao,
                DataPedido = pedido.DataPedido
                

            }).ToList();
            this.pendingGridView.DataBind();
        }
    }
}