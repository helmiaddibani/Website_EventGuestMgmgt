using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MessagingToolkit.QRCode.Codec;
using MessagingToolkit.QRCode.Codec.Ecc;
using MessagingToolkit.QRCode.Codec.Data;
using System.Drawing;
using Prototype1.Guest;
using System.Drawing.Imaging;
using System.Collections;
using System.Configuration;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mime;

namespace Prototype1.GuestMenu
{
    public partial class GuestMainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                GetData();
            else
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            string connString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
            dsInvitation.ConnectionString = connString;
            string email = Session["UserName"].ToString();
            dsInvitation.SelectCommand = "select a.id as inv_id, first_nm, last_nm, mobile_no, a.address as guest_address,  name, start_dt, end_dt, b.address as event_address from tbl_invitation a inner join tbl_event b on a.event_id = b.id where is_attend = 0 and email = '" + email + "'";
            GridView1.DataSource = dsInvitation;
            GridView1.DataBind();
        }
        protected void btnMainMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        private void GetData()
        {
            ArrayList arr;
            if (ViewState["SelectedRecords"] != null)
                arr = (ArrayList)ViewState["SelectedRecords"];
            else
                arr = new ArrayList();
            CheckBox chkAll = (CheckBox)GridView1.HeaderRow
                                .Cells[0].FindControl("chkAll");
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (chkAll.Checked)
                {
                    if (!arr.Contains(GridView1.DataKeys[i].Value))
                    {
                        arr.Add(GridView1.DataKeys[i].Value);
                    }
                }
                else
                {
                    CheckBox chk = (CheckBox)GridView1.Rows[i]
                                       .Cells[0].FindControl("chk");
                    if (chk.Checked)
                    {
                        if (!arr.Contains(GridView1.DataKeys[i].Value))
                        {
                            arr.Add(GridView1.DataKeys[i].Value);
                        }
                    }
                    else
                    {
                        if (arr.Contains(GridView1.DataKeys[i].Value))
                        {
                            arr.Remove(GridView1.DataKeys[i].Value);
                        }
                    }
                }
            }
            ViewState["SelectedRecords"] = arr;
        }

        private void SetData()
        {
            int currentCount = 0;
            CheckBox chkAll = (CheckBox)GridView1.HeaderRow
                                    .Cells[0].FindControl("chkAll");
            chkAll.Checked = true;
            ArrayList arr = (ArrayList)ViewState["SelectedRecords"];
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i]
                                .Cells[0].FindControl("chk");
                if (chk != null)
                {
                    chk.Checked = arr.Contains(GridView1.DataKeys[i].Value);
                    if (!chk.Checked)
                        chkAll.Checked = false;
                    else
                        currentCount++;
                }
            }
            hfCount.Value = (arr.Count - currentCount).ToString();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            SetData();
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            int count = 0;
            SetData();
            GridView1.AllowPaging = false;
            //GridView1.DataBind();
            ArrayList arr = (ArrayList)ViewState["SelectedRecords"];
            count = arr.Count;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (arr.Contains(GridView1.DataKeys[i].Value))
                {
                    ResendRecord(GridView1.DataKeys[i].Value.ToString());
                    arr.Remove(GridView1.DataKeys[i].Value);
                }
            }
            ViewState["SelectedRecords"] = arr;
            hfCount.Value = "0";
            GridView1.AllowPaging = true;
            BindGrid();
            ShowMessage(count);
        }

        private void ResendRecord(string invitationID)
        {

            string guestEmail = string.Empty;
            string guestFirstName = string.Empty;
            string guestLastName = string.Empty;
            string guestAddress = string.Empty;
            string guestCity = string.Empty;
            string guestPhone = string.Empty;
            string eventID = string.Empty;
            string connString = ConfigurationManager.ConnectionStrings["ProductionDB"].ConnectionString;
            DataSet dsInv = new DataSet();
            using (var conn = new SqlConnection(connString))
            {
                conn.Open();
                var command = new SqlCommand("select * from tbl_invitation where id = '" + invitationID + "'", conn);
                var adapter = new SqlDataAdapter(command);
                adapter.Fill(dsInv);
                conn.Close();
            }
            if (dsInv != null && dsInv.Tables.Count > 0 && dsInv.Tables[0].Rows.Count > 0)
            {
                DataTable dt = dsInv.Tables[0];
                DataRow dr = dsInv.Tables[0].Rows[0];
                guestEmail = dr["email"] != DBNull.Value ? dr["email"].ToString() : string.Empty;
                guestFirstName = dr["first_nm"] != DBNull.Value ? dr["first_nm"].ToString() : string.Empty;
                guestLastName = dr["last_nm"] != DBNull.Value ? dr["last_nm"].ToString() : string.Empty;
                guestAddress = dr["address"] != DBNull.Value ? dr["address"].ToString() : string.Empty;
                guestCity = dr["city"] != DBNull.Value ? dr["city"].ToString() : string.Empty;
                guestPhone = dr["mobile_no"] != DBNull.Value ? dr["mobile_no"].ToString() : string.Empty;
                eventID = dr["event_id"] != DBNull.Value ? dr["event_id"].ToString() : string.Empty;
            }

            string eventName = string.Empty;
            string eventAddress = string.Empty;
            string eventStartDate = string.Empty;
            string eventEndDate = string.Empty;

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
                eventName = dr["name"] != DBNull.Value ? dr["name"].ToString() : string.Empty;
            }

            using (MemoryStream mstream = new MemoryStream())
            {

                #region Generate QRCode
                QRCodeEncoder encoder = new QRCodeEncoder();
                //QRcode Generator
                Bitmap img = encoder.Encode(invitationID);
                string attachmentPath = @"C:\Users\helmi\Documents\Kuliah\FYP\Prototype1\Prototype1\QRCodeList\" + invitationID + ".png";
                //img.Save(attachmentPath, ImageFormat.Png);
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
        }

        private void ShowMessage(int count)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("alert('");
            sb.Append(count.ToString());
            sb.Append(" email(s) resent.');");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());
        }

    }
}