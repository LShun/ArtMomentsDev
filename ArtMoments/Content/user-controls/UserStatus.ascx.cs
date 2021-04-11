using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Content.user_controls
{
    public partial class Labels : System.Web.UI.UserControl
    {
        public string Username { get; set; } = "";
        public string UserType { get; set; } = "";
        public string CurrentTime { get; set; } = "";

        protected void Page_Load(object sender, EventArgs e)
        {   
            // convert user type to string
            string UserTypeName = "";
            switch(UserType)
            {
                case "1":
                    UserTypeName = "Buyer";
                    break;
                case "2":
                    UserTypeName = "Seller";
                    break;
                default:
                    Username = UserTypeName = "our respected guest";
                    lblUserType.Visible = false;
                    lblLoginTime.Visible = false;
                    break;
            }
            lblUsername.Text = "Welcome, " + "<b>" + Username + "<b>";
            lblUserType.Text = "You are a " + "<b>" + UserTypeName + "<b>";
            lblLoginTime.Text = "Login Time: " + "<b>" + DateTime.Now.ToString() + "<b>"; // todo: Fix this as it keeps changing the date
        }
    }
}