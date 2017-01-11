using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated) {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var currentUser = manager.FindById(User.Identity.GetUserId());

                var role = manager.GetRoles(currentUser.Id);

                if (role[0] == "Admin")
                {
                    Response.Redirect("/Admin/AdminHome");
                }
                else if (role[0] == "Cliente")
                {
                    Response.Redirect("/Cliente/ClienteHome");
                }
                else {
                    Response.Redirect("/Oficina/OficinaHome");
                }
                
            }
        }
    }
}