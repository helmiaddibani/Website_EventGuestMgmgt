using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prototype1.Admin
{
    public partial class AdminMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Event/EventMaintenance.aspx");
        }
         protected void btnModifyEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Event/EventList.aspx");
        }
        protected void btnGuestList_Click(object sender, EventArgs e)
         {
             Response.Redirect("~/GuestList/AddGuest.aspx");
         }
        protected void btnInvitationList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InvitationList/InvitationSearch.aspx");
        }
    }
}