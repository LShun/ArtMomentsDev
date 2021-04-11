using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Masters
{
    public partial class Client1 : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || !Session["UserType"].ToString().Equals("1"))
            {
                Response.Redirect("~/Sites/general/AccessDenied.aspx", true);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Request.AppRelativeCurrentExecutionFilePath;
            foreach (MenuItem item in ArtworkMenu.Items)
            {
                item.Selected = item.NavigateUrl.Equals(path, StringComparison.InvariantCultureIgnoreCase);
            }

            string[] role = { "Client" };
            ctlUserStatus.Username = Session["UserName"].ToString();
            ctlUserStatus.UserType = Session["UserType"].ToString();
            HttpContext.Current.User = new GenericPrincipal(HttpContext.Current.User.Identity, role);
        }
        protected void ArtworkMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            if ((sender as Menu).SelectedItem.Text.Equals("Log Out"))
            {
                Session.RemoveAll();
                Response.Redirect("../general/HomePage.aspx");
            }

        }
    }
}