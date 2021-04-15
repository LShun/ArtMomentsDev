using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;
using System.Web.UI;
namespace ArtMoments.Sites.client
{
    public partial class Receipt : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {


                    for (int i = 0; i < TransactionIDDetailView.Rows.Count; i++)
                    {
                        if ((Label)TransactionIDDetailView.Rows[i].FindControl("id") != null)
                        {
                            Label transacId = (Label)TransactionIDDetailView.Rows[i].FindControl("id");
                        dsOrderList.SelectParameters.Add("id", transacId.Text.ToString());
                        dsDelivery.SelectParameters.Add("id", transacId.Text.ToString());
                            break;
                        }
                    }
                    Double total = 0;
                Double deliveryFee = 0;
                foreach (GridViewRow row in itemList.Rows)
                {
                    Label subtotal = (Label)row.FindControl("SubTotal");
                    total += Convert.ToDouble(subtotal.Text.ToString());
                }

                Label deliveryFeefromDB = (Label)delieryFeeDetailView.FindControl("delivery_fees");
                deliveryFee = Convert.ToDouble(deliveryFeefromDB.Text.ToString());
                total += deliveryFee;
                lblTotal.Text = total.ToString("F");


                string connectionString =
                ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

                string username = Session["UserName"].ToString();
                String userEmail = "";
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query =
                        "SELECT user_email FROM [User] WHERE user_name =@UserName";

                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@UserName", username);

                    SqlDataReader dr = sqlCmd.ExecuteReader();                    

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            userEmail = dr["user_email"].ToString();
                        }
                    }                    
                    sqlCon.Close();
                }


                try
                {
                    string emailSender = ConfigurationManager.AppSettings["emailsender"].ToString();
                    string emailSenderPassword = ConfigurationManager.AppSettings["password"].ToString();
                    string emailSenderHost = ConfigurationManager.AppSettings["smtp"].ToString();
                    int emailSenderPort = Convert.ToInt16(ConfigurationManager.AppSettings["portnumber"]);
                    Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);
                    string MailText = "	&nbsp; 	&nbsp; 	&nbsp; 	&nbsp;ArtMoments <br />  <br />" +
                        "&nbsp; 	&nbsp; 	&nbsp;Thanks For Your Order <br />  <br /> ";

                    string totalText = "\nTotal: " + lblTotal.Text.ToString();
                    string subject = "ArtMoments Receipt";

                    //Base class for sending email  
                    MailMessage _mailmsg = new MailMessage();

                    //Make TRUE because our body text is html  
                    _mailmsg.IsBodyHtml = true;

                    //Set From Email ID  
                    _mailmsg.From = new MailAddress(emailSender);

                    //Set To Email ID  
                    _mailmsg.To.Add(userEmail);   

                    //Set Subject  
                    _mailmsg.Subject = subject;

                    //Set Body Text of Email   
                    _mailmsg.Body = MailText + DetailsViewToHtml(TransactionIDDetailView) + "<br /><br />" + GridViewToHtml(itemList) + "<br /> <br />"+DetailsViewToHtml1(delieryFeeDetailView) + "<br /><br />" + totalText;

                    //Now set your SMTP   
                    SmtpClient _smtp = new SmtpClient();

                    //Set HOST server SMTP detail  
                    _smtp.Host = emailSenderHost;

                    //Set PORT number of SMTP  
                    _smtp.Port = emailSenderPort;

                    //Set SSL --> True / False  
                    _smtp.EnableSsl = emailIsSSL;

                    //Set Sender UserEmailID, Password  
                    NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
                    _smtp.Credentials = _network;

                    //Send Method will send your MailMessage create above.  
                    _smtp.Send(_mailmsg);
                }
                catch (SmtpException ex)
                {
                    //lblMsg.Text = "Email failed to send!";
                    Console.WriteLine(ex.ToString());
                }
            }
        }

        protected void itemList_RowCommand(object sender, GridViewCommandEventArgs e)
        {


        }
        private string GridViewToHtml(GridView itemList)
        {
            StringBuilder objStringBuilder = new StringBuilder();
            StringWriter objStringWriter = new StringWriter(objStringBuilder);
            HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);
            itemList.RenderControl(objHtmlTextWriter);
            return objStringBuilder.ToString();
        }
        private string DetailsViewToHtml(DetailsView TransactionIDDetailView)
        {
            StringBuilder objStringBuilder = new StringBuilder();
            StringWriter objStringWriter = new StringWriter(objStringBuilder);
            HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);
            TransactionIDDetailView.RenderControl(objHtmlTextWriter);
            return objStringBuilder.ToString();
        }
        private string DetailsViewToHtml1(DetailsView delieryFeeDetailView)
        {
            StringBuilder objStringBuilder = new StringBuilder();
            StringWriter objStringWriter = new StringWriter(objStringBuilder);
            HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);
            delieryFeeDetailView.RenderControl(objHtmlTextWriter);
            return objStringBuilder.ToString();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //Required to verify that the control is rendered properly on page
        }
        protected void btnHomepage_Click(object sender, EventArgs e)
        {
            Response.Redirect("../general/HomePage.aspx");
        }
    }
}