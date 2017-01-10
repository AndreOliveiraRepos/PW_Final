using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using PW_Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Admin
{
    public partial class AdicionaRoles : System.Web.UI.Page
    {
        private ApplicationDbContext context = new ApplicationDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddNew(object sender, EventArgs e) {
            var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            string roleName = Nome.Text;
            IdentityResult roleResult;
            if (!RoleManager.RoleExists(roleName))
            {
                roleResult = RoleManager.Create(new IdentityRole(roleName));
                successPanel.Visible = true;
            }
            else {
                FailureText.Text = "Role já existe.";
                ErrorMessage.Visible = true;


            }
        }
    }
}