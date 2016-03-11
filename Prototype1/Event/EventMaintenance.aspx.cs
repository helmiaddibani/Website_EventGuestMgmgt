using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;

namespace Prototype1.Event
{
    public partial class EventMaintenance : System.Web.UI.Page
    {
        private string connString = "";
        private string query;
        private SqlConnection myConnection;
        private SqlDataReader myDataReader;

        
        #region "Page events"
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                string evID = Request.QueryString["EventID"];
                if (evID != null)
                {
                    LoadEvent(evID);
                }
            }
        }

        #endregion
        
        #region "CRUD"
        protected void SaveEvent()
        {          
            string eventName = txtEventName.Text;
            string eventAddress = txtEventAddress.Text;
            string eventType = txtEventType.Text;
            string eventCity = txtEventCity.Text;
            string userID = Session["UserID"].ToString();
            string v = Request.QueryString["EventID"];
            DateTime eventStartDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime eventEndDate = Convert.ToDateTime(txtEndDate.Text);

            if (v != null)
            {
                query = "";
            }
            else
                query = "INSERT INTO tbl_event (id, admin_id, name, type, start_dt, end_dt, address) values ( NEWID(), '" + userID + "', '" + eventName + "', '" + eventType + "','" + eventStartDate + "','" + eventEndDate + "', '" + eventAddress +", " + eventCity + "') ";

            this.connString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
            myConnection = new SqlConnection(connString);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(query, myConnection);
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            txtEventName.Text = string.Empty;
            txtEventAddress.Text = string.Empty;
            txtEventType.Text = string.Empty;
            txtEventCity.Text = string.Empty;
            txtStartDate.Text = string.Empty;
            txtEndDate.Text = string.Empty;

            ShowMessage();
        }

        private void ShowMessage()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("alert('");
            sb.Append("Event has been created.');");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }
        protected void LoadEvent(string EventID)
        {
            this.connString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
            myConnection = new SqlConnection(connString);
            myConnection.Open();
            query = "Select * from pevent where eventid = " + EventID + "";
            SqlCommand myCommand = new SqlCommand(query, myConnection);
            myDataReader = myCommand.ExecuteReader();
            if (myDataReader.Read())
            {
                txtEventAddress.Text = myDataReader["EventAddress"].ToString();
            }
            myDataReader.Close();
            myConnection.Close();
        }

        #endregion

        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            SaveEvent();
        }
        protected void btnModifyEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Event/EventList.aspx");
        }
        protected void btnMainMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminMenu.aspx");
        }
        
    }
}