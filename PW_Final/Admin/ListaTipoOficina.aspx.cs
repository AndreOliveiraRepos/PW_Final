using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Admin
{
    public partial class ListaTipoOficina : System.Web.UI.Page
    {
        private EntitiesConnection db = new EntitiesConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            
                fillData();
           
        }


        private void fillData()
        {
            this.tiposGridView.DataSource = db.TipoReparacaoSet.Select(tipo => new
            {
                
                Descricao = tipo.Descricao

            }).ToList();
            this.tiposGridView.DataBind();
        }
    }
}