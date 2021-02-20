using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class Wishlist : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void gvWishList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dsWishlist.DeleteCommand = "DELETE FROM Wishlist Where id=@wishlist_id";
            dsWishlist.DeleteParameters.Add("wishlist_id", gvWishlist.DataKeys[e.RowIndex].Values["id"].ToString());
            dsWishlist.Delete();
            gvWishlist.DataBind();
        }

        protected void gvWishlist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                GridViewRow gvr = (GridViewRow) ((Control) e.CommandSource).NamingContainer;
                int rowIndex = gvr.RowIndex;
                Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + gvr.Cells[1].Text);
            }
        }

        protected void txtSearch_Load(object sender, EventArgs e)
        {
            txtSearch.MaxLength = 49;
        }
    }
}