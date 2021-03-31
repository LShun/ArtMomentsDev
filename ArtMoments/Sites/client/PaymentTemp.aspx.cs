using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        }        
    }
}