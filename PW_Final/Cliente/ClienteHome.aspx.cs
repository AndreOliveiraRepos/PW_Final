﻿using PW_Final.Controladores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_Final.Cliente
{
    public partial class ClientHome : System.Web.UI.Page
    {
        private Client client;
        protected void Page_Load(object sender, EventArgs e)
        {
            client = Client.Instance;
        }
    }
}