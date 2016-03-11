using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Prototype1
{
    public partial class InvitationSearch : System.Web.UI.Page
    {
        public static SqlDataSource dsInvitationStat;
        private string connString = "";
        private string query;
        private SqlConnection myConnection;
        private SqlDataReader myDataReader;

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
                    dsEventList.ConnectionString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
                    dsEventList.SelectParameters.Clear();
                    dsEventList.SelectParameters.Add("UserID", userID);
                    dsEventList.SelectCommand = "SELECT * FROM [tbl_event]  WHERE admin_id = @UserID ORDER BY [name]";
                }
            }

            if (dsInvitationStat != null)
            {
                dsInvitation.SelectCommand = dsInvitationStat.SelectCommand;
                dsInvitationStat = null;
            }

            dsInvitation.SelectParameters.Clear();
            string query = "SELECT [id], [first_nm], [last_nm], [address], [city], [email], [mobile_no], [is_attend] FROM [tbl_invitation]";
            bool haveCondition = false;
            if (!string.IsNullOrWhiteSpace(txtSearchFName.Text) || !string.IsNullOrWhiteSpace(txtSearchLName.Text) || !string.IsNullOrWhiteSpace(txtSearchEmail.Text)
                 || !string.IsNullOrWhiteSpace(txtSearchPhone.Text))
            {
                query += " WHERE";
                query += " first_nm LIKE '%" + txtSearchFName.Text + "%'";
                query += " AND last_nm LIKE '%" + txtSearchLName.Text + "%'";
                query += " AND email LIKE '%" + txtSearchEmail.Text + "%'";
                query += " AND mobile_no LIKE '%" + txtSearchPhone.Text + "%'";
                haveCondition = true;
            }
            if (!string.IsNullOrWhiteSpace(eventDropDown.SelectedValue))
            {
                if (!haveCondition)
                {
                    dsInvitation.SelectCommand = query += " WHERE event_id = '" + eventDropDown.SelectedValue + "' ORDER BY [first_nm]";
                }
                else
                {
                    dsInvitation.SelectCommand = query += " AND event_id = '" + eventDropDown.SelectedValue + "' ORDER BY [first_nm]";
                }
                GridView1.DataBind();
            }
        }

        protected void dsEventList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        protected void btnMainMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminMenu.aspx");
        }
        //protected void btnSubmitSearch_Click(object sender, EventArgs e)
        //{
        //    dsInvitationStat = new SqlDataSource();
        //    dsInvitationStat.SelectCommand = "SELECT [first_nm], [last_nm], [address], [city], [email], [mobile_no], [is_attend] FROM [tbl_invitation] ORDER BY [first_nm]";
        //    Response.Redirect("~/InvitationList/InvitationSearch.aspx");
        //}
    }
}