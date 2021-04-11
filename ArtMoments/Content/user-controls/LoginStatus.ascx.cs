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
        public string LoginTime { get; set; } = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsername.Text = "Welcome: " + "<b>" + Username + "<b>";
            lblUserType.Text = "Type: " + "<b>" + UserType + "<b>";
            lblLoginTime.Text = "Login Time: " + "<b>" + LoginTime + "<b>";
        }
    }
}