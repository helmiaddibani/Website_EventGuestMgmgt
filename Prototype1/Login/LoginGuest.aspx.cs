﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prototype1.Login
{
    public partial class GuestLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["UserName"] = txtEmail.Text;
            Response.Redirect("~/Guest/GuestMenu.aspx");
        }
    }
}