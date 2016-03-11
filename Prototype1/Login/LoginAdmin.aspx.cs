using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Prototype1.Login
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        private string connString = "";
        private string query;
        private SqlConnection myConnection;
        private SqlDataReader myDataReader;
        public bool isError = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void matchID(string email)
        {
            string userID = "";
            string userName = "";
            this.connString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
            myConnection = new SqlConnection(connString);
            myConnection.Open();
            query = "SELECT  * FROM tbl_admin a INNER JOIN tbl_password b ON a.id = b.[key] WHERE email = '" + email + "' AND password = '" + txtPassword.Text +"'" ;

            /*
            SqlCommand myCommand = new SqlCommand("SELECT  * FROM PUser", myConnection);
            myCommand.ExecuteNonQuery();
            */

            SqlCommand myCommand = new SqlCommand(query, myConnection);
            myDataReader = myCommand.ExecuteReader();
            if (myDataReader.Read())
            {
                userID = myDataReader["id"].ToString();
                userName = myDataReader["first_nm"].ToString();
                Session["UserID"] = userID;
                Session["UserName"] = userName;
                Response.Redirect("~/Admin/AdminMenu.aspx");
            }
            else
            {
                isError = true;
            }
            myDataReader.Close();
            myConnection.Close();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            matchID(txtEmail.Text);
        }
    }
}