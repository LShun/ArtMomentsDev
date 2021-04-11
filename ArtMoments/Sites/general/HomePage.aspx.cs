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
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                MasterPageFile = "~/Masters/General.Master";
            }
            else if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist1.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client1.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            adRectCustomer1.setValues("Buy Art", "Purchase art from the creators.", "../../Content/hp-buy-art.jpg");
            adRectCustomer2.setValues("Wish-list System", "Allow bookmarking of favorite arts", "../../Content/hp-wishlist-stars.jpg");
            adRectArtist1.setValues("Additional Income", "Sell your Art here with low fees.", "../../Content/hp-additional-income.jpg");
            adRectArtist2.setValues("Increased Visibility", "Improve discovery & popularity.", "../../Content/hp-visibility.jpg");
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