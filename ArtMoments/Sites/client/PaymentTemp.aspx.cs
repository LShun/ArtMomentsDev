using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


//using System.Configuration;
//using System.IO;

namespace ArtMoments.Sites.client
{
    public partial class PaymentTemp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPaid_Click(object sender, EventArgs e)
        {
                try
                {
                    //SmtpClient smtp = new SmtpClient("127.0.0.1");
                    SmtpClient client = new SmtpClient("Smtp.gmail.com", 587);  //74.125.24.108
                    client.EnableSsl = true;
                    client.Timeout = 10000;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("foojiaern2@gmail.com", "Jefoo1352");

                    MailMessage message = new MailMessage();
                    message.To.Add("foojiaern1@gmail.com");
                    message.From = new MailAddress("foojiaern2@gmail.com");
                    message.Subject = "Your Art Moments E-Receipt";
                    message.Body = "Good day, " + "Thank you for shopping with us.\n" + "";
                    client.Send(message);
                    lblMsg.Text = "Email sent successfully!";
                }
                catch (SmtpException ex)
                {
                    lblMsg.Text = "Email failed to send!";
                    Console.WriteLine(ex.ToString());
                }

            ////Fetching Settings from WEB.CONFIG file.  
            //string emailSender = ConfigurationManager.AppSettings["emailsender"].ToString();
            //string emailSenderPassword = ConfigurationManager.AppSettings["password"].ToString();
            //string emailSenderHost = ConfigurationManager.AppSettings["smtp"].ToString();
            //int emailSenderPort = Convert.ToInt16(ConfigurationManager.AppSettings["portnumber"]);
            //Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);


            ////Fetching Email Body Text from EmailTemplate File.  
            //string FilePath = "C:\\Users\\Jin_Ern\\Desktop\\WAD Practical\\Email_test\\Email_test\\EmailTemplates\\Receipt.html";
            //StreamReader str = new StreamReader(FilePath);
            //string MailText = str.ReadToEnd();
            //str.Close();

            ////Repalce [newusername] = signup user name 
            //MailText = MailText.Replace("[deliveryAddress]", txtUserName.Text.Trim());
            //MailText = MailText.Replace("[orderID]", txtUserName.Text.Trim());
            //MailText = MailText.Replace("[orderDate]", txtUserName.Text.Trim());
            //MailText = MailText.Replace("[orderTotal]", txtUserName.Text.Trim());
            //MailText = MailText.Replace("[newusername]", txtUserName.Text.Trim());


            //string subject = "Welcome to CSharpCorner.Com";

            ////Base class for sending email  
            //MailMessage _mailmsg = new MailMessage();

            ////Make TRUE because our body text is html  
            //_mailmsg.IsBodyHtml = true;

            ////Set From Email ID  
            //_mailmsg.From = new MailAddress(emailSender);

            ////Set To Email ID  
            //_mailmsg.To.Add(txtUserName.Text.ToString());

            ////Set Subject  
            //_mailmsg.Subject = subject;

            ////Set Body Text of Email   
            //_mailmsg.Body = MailText;


            ////Now set your SMTP   
            //SmtpClient _smtp = new SmtpClient();

            ////Set HOST server SMTP detail  
            //_smtp.Host = emailSenderHost;

            ////Set PORT number of SMTP  
            //_smtp.Port = emailSenderPort;

            ////Set SSL --> True / False  
            //_smtp.EnableSsl = emailIsSSL;

            ////Set Sender UserEmailID, Password  
            //NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
            //_smtp.Credentials = _network;

            ////Send Method will send your MailMessage create above.  
            //_smtp.Send(_mailmsg);
        }        
    }
}