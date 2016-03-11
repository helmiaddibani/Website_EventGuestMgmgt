using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prototype1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login/LoginAdmin.aspx");
        }
        protected void btnEmailRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login/LoginGuest.aspx");
        }
    }
}