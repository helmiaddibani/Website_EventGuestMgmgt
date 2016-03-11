using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prototype1.Event
{
    public partial class EventList : System.Web.UI.Page
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
                    dsEventList.SelectParameters.Clear();
                    dsEventList.SelectParameters.Add("UserID", userID);
                }
            }

        }
        protected void btnGoToMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminMenu.aspx");
        }

        protected void btnGoToAddEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Event/EventMaintenance.aspx");
        }

        protected void dsEventList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}