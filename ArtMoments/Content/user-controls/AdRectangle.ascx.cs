using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Content.user_controls
{
    public partial class AdRectangles : System.Web.UI.UserControl
    {
        public string title { get; set; } = "";
        public string description { get; set; } = "";
        public string imageUrl { get; set; } = "";

        public bool setAdRect(string title, string description, string imageUrl)
        {
            this.title = title;
            this.description = description;
            this.imageUrl = imageUrl;
            return true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblTitle.Text = "<h5>" + title + "<h5>";
            lblDesc.Text = "<h5>" + description + "<h5>";
            imgAdvert.ImageUrl = imageUrl;
        }
    }
}