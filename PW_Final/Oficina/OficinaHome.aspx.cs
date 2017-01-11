using PW_Final.Controladores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Oficina
{
    public partial class OficinaHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepairType tipos = new RepairType();
                
                tipoDropDownList.DataSource = tipos.ListaTodos();
                tipoDropDownList.DataBind();
                fillData();
            }
        }
        private void fillData()
        {
            /*RepairShop shop;
            shop = RepairShop.Instance;*/
            pedidosGridView.DataSource = RepairShop.ListarTodasPorTipo(tipoDropDownList.Text);
            pedidosGridView.DataBind();
        }

        protected void tipoDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillData();
        }
    }
}