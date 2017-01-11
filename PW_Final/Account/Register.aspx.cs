using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using PW_Final.Models;

namespace PW_Final.Account
{
    public partial class Register : Page
    {
        //private ApplicationDbContext db = new ApplicationDbContext();
        private EntitiesConnection db = new EntitiesConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                RoleDropDownList.Items.Add("Escolha o seu tipo de conta");
                foreach (var t in db.AspNetRoles)
                {
                    RoleDropDownList.Items.Add(t.Name);
                }
                tipoDropDownList.Items.Add("Escolha o tipo de Reparações");
                foreach (var t in db.TipoReparacaoSet)
                {
                    tipoDropDownList.Items.Add(t.Descricao);
                }
            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
                var currentUser = manager.FindByName(user.UserName);

                var roleresult = manager.AddToRole(currentUser.Id, RoleDropDownList.SelectedItem.Text);
                if (RoleDropDownList.SelectedItem.Text == "Oficina") {
                    var tipo = (from t in db.TipoReparacaoSet
                                where t.Descricao.Equals(tipoDropDownList.Text)
                                select t
                        ).FirstOrDefault();
                    db.OficinaSet.Add(new Models.OficinaSet
                    {
                        Nome = NomeOficina.Text,
                        Morada = MoradaOficina.Text,
                        Telefone = TelefoneOficina.Text,
                        TipoReparacaoId = tipo.Id,
                        Avaliacao = 0,
                        AspNetUsers_Id = currentUser.Id,
                        TotalAvaliacao = 0
                        
                    });
                    db.SaveChanges();
                }
                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        
        protected void ChangeForm(object sender, EventArgs e)  {
            if (RoleDropDownList.SelectedItem.Text != "Oficina" && RoleDropDownList.SelectedIndex > 0) {
                commonPanel.Visible = true;
                if (oficinaPanel.Visible) {
                    oficinaPanel.Visible = false;
                }
            } else if (RoleDropDownList.SelectedItem.Text == "Oficina") {
                commonPanel.Visible = true;
                oficinaPanel.Visible = true;
                
            }
        }
    }
}