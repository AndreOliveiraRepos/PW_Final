using PW_Final.Controladores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Oficina
{
    public partial class Relatorios : System.Web.UI.Page
    {
        private RepairShop shop;
        protected void Page_Load(object sender, EventArgs e)
        {
            shop = RepairShop.Instance;
            fillData();
        }
        private void fillData() {
            ServiceReport reports = new ServiceReport();
            pedidosGridView.DataSource = reports.ListarPorOficina(shop.getID());
            pedidosGridView.DataBind();
        }
    }
}