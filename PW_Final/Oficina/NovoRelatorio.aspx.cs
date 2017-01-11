using PW_Final.Controladores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Oficina
{
    public partial class NovoRelatorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Enviar(object sender, EventArgs e) {
            ServiceReport report = new ServiceReport();
            report.AdicionaNovo(servicoID, oficinaID, Descritivo.Text);
            Response.Redirect("~/Oficina/Relatorios");
        }

        public static int oficinaID { get; set; }
        public static int servicoID { get; set; }
        
    }
}