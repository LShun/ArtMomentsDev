using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Content.user_controls
{
    public partial class ArtworkHistory : System.Web.UI.UserControl
    {
        public string selectCommand { get; set; }  = "SELECT TOP 50 [id], SUBSTRING([prod_name], 0, 35) AS prod_name, [prod_image] FROM [Product] ORDER BY [id] DESC"; // default select command
        public string title { get; set; } = "Latest Arts"; // default title
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTitle.Text = "<h3 style='text-align: center;'>" + title + "</h3>";
            dsArtSource.SelectCommand = selectCommand;
        }

        public bool SetValues(string title, string selectCommand)
        {
            this.title = title;
            this.selectCommand = selectCommand;

            return true;
        }
    }
}