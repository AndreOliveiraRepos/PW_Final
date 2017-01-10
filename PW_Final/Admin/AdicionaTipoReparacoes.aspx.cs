using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Admin
{
    public partial class AdicionaReparacoes : System.Web.UI.Page
    {
        private Entities db = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void AddNew(object sender, EventArgs e)
        {
            
            string tipo = Nome.Text;
            var val = db.TipoReparacaoSet.Where(t=> t.Descricao == tipo);
            if (val.Count() == 0)
            {
                db.TipoReparacaoSet.Add(new TipoReparacao()
                {
                    Descricao = tipo
                });
                db.SaveChanges();
                if (ErrorMessage.Visible)
                    ErrorMessage.Visible = false;
                successPanel.Visible = true;
            }
            else {
                FailureText.Text = "Tipo de oficina já existe.";
                ErrorMessage.Visible = true;
            }
           
            
            /*if (!RoleManager.RoleExists(roleName))
            {
                roleResult = RoleManager.Create(new IdentityRole(roleName));
                successPanel.Visible = true;
            }
            else {
                FailureText.Text = "Role já existe.";
                ErrorMessage.Visible = true;


            }*/
        }
    }
}