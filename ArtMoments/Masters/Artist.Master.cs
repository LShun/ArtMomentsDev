using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Masters
{
    public partial class Artist : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Request.AppRelativeCurrentExecutionFilePath;
            foreach (MenuItem item in ArtworkMenu.Items)
            {
                item.Selected = item.NavigateUrl.Equals(path, StringComparison.InvariantCultureIgnoreCase);
            }
        }
    }
}