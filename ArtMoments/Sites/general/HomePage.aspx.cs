using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.general
{
    public partial class HomePage2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void pnlInterested_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["UserType"] as string))
            {
                pnlInterested.Visible = true;
            }
            else
            {
                pnlInterested.Visible = false;
            }
        }
    }
}