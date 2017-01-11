using PW_Final.Controladores;
using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Oficina
{
    public partial class OficinaPerfil : System.Web.UI.Page
    {
        private RepairShop shop;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (profileToShow == 0)
            {

                shop = RepairShop.Instance;
                profileToShow = shop.getID();

            }
            
            fillProfile(profileToShow);
        }
        private void fillProfile(int profile) {
            OficinaSet of = shop.ShopData(profile);
            ClientReview reviews = new ClientReview();
            lblAvaliacao.Text = of.Avaliacao.ToString();
            lblMorada.Text = of.Morada.ToString();
            lblNAvaliacoes.Text = of.TotalAvaliacao.ToString();
            lblNome.Text = of.Nome.ToString();
            lblTelefone.Text = of.Telefone.ToString();
            lblTipo.Text = of.TipoReparacaoSet.Descricao.ToString();
            reviewsGridView.DataSource = reviews.ListarPorOficina(profile);
            reviewsGridView.DataBind();
        }
        public static int profileToShow { get; set; }
    }

    
}