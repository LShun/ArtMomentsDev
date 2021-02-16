using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class Wishlist : System.Web.UI.Page
    {
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

    }
}