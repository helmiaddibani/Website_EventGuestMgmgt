using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//QR Code Generator
using MessagingToolkit.QRCode.Codec;
using MessagingToolkit.QRCode.Codec.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;
using System.Data;
using System.Text;

namespace Prototype1.GuestList
{
    public partial class AddGuest : System.Web.UI.Page
    {
        private string connString = "";
        private string query;
        private SqlConnection myConnection;

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
            //query = "SELECT * FROM Event";
            //this.connString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
            //myConnection = new SqlConnection(connString);
            //myConnection.Open();
            //SqlCommand myCommand = new SqlCommand(query, myConnection);
            //myCommand.ExecuteNonQuery();
            //myConnection.Close();            
            /*QRCodeEncoder encoder = new QRCodeEncoder();

            Bitmap Img = encoder.Encode(TextBox1.Text);
            Img.Save("C:\\Users\\helmi\\Documents\\Kuliah\\FYP\\QR Generator\\QR Generator.sln\\QRimage.jpg", ImageFormat.Jpeg);

            QRImage.ImageUrl = "QRImage.jpg";*/
        }
        protected void btnGenerateGuest_Click(object sender, EventArgs e)
        {
            //generate QR-COde
        }
        protected void btnAddGuest_Click(object sender, EventArgs e)
        {
            string guestEmail = txtEmail.Text;
            string guestFirstName = txtFirstName.Text;
            string guestLastName = txtLastName.Text;
            string guestAddress = txtAddress1.Text;
            string guestCity = "Cyberjaya";
            string guestPhone = txtPhone.Text;
            string eventID = eventDropDown.SelectedValue;
            string eventName = eventDropDown.SelectedItem.Text;
            string invitationID = Guid.NewGuid().ToString();
            string eventAddress = string.Empty;
            string eventStartDate = string.Empty;
            string eventEndDate = string.Empty;

            string connString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
            DataSet ds = new DataSet();
            using (var conn = new SqlConnection(connString))
            {
                conn.Open();
                var command = new SqlCommand("select * from tbl_event where id = '" + eventID + "'", conn);
                var adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);
                conn.Close();
            }
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                DataRow dr = ds.Tables[0].Rows[0];
                eventAddress = dr["address"] != DBNull.Value ? dr["address"].ToString() : string.Empty;
                eventStartDate = dr["start_dt"] != DBNull.Value ? dr["start_dt"].ToString() : string.Empty;
                eventEndDate = dr["end_dt"] != DBNull.Value ? dr["end_dt"].ToString() : string.Empty;
            }

            query = "INSERT INTO tbl_invitation (id, event_id, first_nm, last_nm, address, city, email, mobile_no) values ('" + invitationID + "', '" + eventID + "','"
                + guestFirstName + "','" + guestLastName + "','" + guestAddress + "','" + guestCity + "','" + guestEmail + "','" + guestPhone + "')";
            this.connString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
            myConnection = new SqlConnection(connString);
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(query, myConnection);
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            using (MemoryStream mstream = new MemoryStream())
            {

                #region Generate QRCode
                QRCodeEncoder encoder = new QRCodeEncoder();
                //QRcode Generator
                Bitmap img = encoder.Encode(invitationID);
                string attachmentPath = @"C:\Users\helmi\Documents\Kuliah\FYP\Prototype1\Prototype1\QRCodeList\" + invitationID + ".png";
                img.Save(attachmentPath, ImageFormat.Png);
                #endregion

                #region Send Email
                SmtpClient SmtpServer = new SmtpClient("smtp.live.com");
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("Efento@hotmail.com");
                msg.To.Add(guestEmail);

                #region Construct HTML
                msg.Subject = "Invitation for event " + eventName;
                msg.IsBodyHtml = true;
                string htmlBody;
                htmlBody = @"<html>
            <body>
              <h1>" + eventName + @"</h1>
              <p>Dear " + guestFirstName + " " + guestLastName + @",</p>
              <p>You have been invited to: <br/>
                 Event name: " + eventName + @"<br/>
                 Address: " + eventAddress + @"<br/>
                 Time: " + eventStartDate + @" - " + eventEndDate + @"<br/></p>
               <p>Please keep this QR Code to be presented at the event entrance</p>
                  " + eventName + "</body>  <br /> <img src=\"@@IMAGE@@\" /> </html>";
                #endregion

                // create the INLINE attachment


                //ContentType type = new ContentType()
                //{
                //    MediaType = MediaTypeNames.Image.Gif,
                //    Name = "attachment.gif"
                //};
                //Bitmap img = encoder.Encode(invitationID);
                //img.Save(mstream, ImageFormat.Gif);
                //msg.Attachments.Add(new Attachment(mstream, type));


                Attachment inline = new Attachment(attachmentPath);
                inline.ContentDisposition.Inline = true;
                inline.ContentDisposition.DispositionType = DispositionTypeNames.Inline;
                inline.ContentId = "eInvitation";
                inline.ContentType.MediaType = "image/jpg";
                inline.ContentType.Name = Path.GetFileName(attachmentPath);
                msg.Attachments.Add(inline);
                msg.Body = htmlBody;
                msg.Body = msg.Body.Replace("@@IMAGE@@", "cid:" + "eInvitation");
                SmtpServer.Port = 587;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new System.Net.NetworkCredential("Efento@hotmail.com", "12345xyz");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(msg);
                #endregion
            }
            ShowMessage(guestFirstName, eventName);

            txtEmail.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtAddress1.Text = string.Empty;
            txtPhone.Text = string.Empty;
            eventDropDown.SelectedValue = string.Empty;
        }
        private void ShowMessage(string name, string eventnm)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("alert('");
            sb.Append(name);
            sb.Append(" has been invited to ");
            sb.Append(eventnm);
            sb.Append("');");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminMenu.aspx");
        }
    }
}