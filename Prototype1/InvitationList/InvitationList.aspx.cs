using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Prototype1.InvitationList
{
    public partial class InvitationList : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                string userID = Session["UserID"].ToString();
                if (!string.IsNullOrWhiteSpace(userID))
                {
                    dsInvitation.SelectParameters.Clear();
                    dsInvitation.SelectParameters.Add("UserID", userID);
                }
            }

        }
    }
}