using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ArtMoments.Masters
{
    public partial class General : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Request.AppRelativeCurrentExecutionFilePath;
            foreach (MenuItem item in ArtworkMenu.Items)
            {
                item.Selected = item.NavigateUrl.Equals(path, StringComparison.InvariantCultureIgnoreCase);
            }
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