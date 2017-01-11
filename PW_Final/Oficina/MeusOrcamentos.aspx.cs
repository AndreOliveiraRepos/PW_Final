using PW_Final.Controladores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Oficina
{
    public partial class MeusOrcamentos : System.Web.UI.Page
    {
        private RepairShop shop;
        protected void Page_Load(object sender, EventArgs e)
        {
            shop = RepairShop.Instance;
            fillData();
        }
        public void fillData() {
            Budget budget = new Budget();
            pedidosGridView.DataSource = budget.ListaPorOficina(shop.getID());
            pedidosGridView.DataBind();
        }
    }
}