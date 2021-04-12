using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Configuration;
using System.Text;

namespace ArtMoments.Sites.artist
{
    public partial class ProductList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("../usermgmt/PreLogin.aspx");
                }

            }

            ahSellerLatestArt.SetValues("Competitor's inspiration", "SELECT TOP 50 [id], SUBSTRING([prod_name], 0, 35) AS prod_name, [prod_image] FROM [Product] WHERE [user_id] <>" + Session["UserId"].ToString() + "ORDER BY [id] DESC ");
        }

        protected void addProdBtn_Click(Object sender, EventArgs e) //add button is clicked
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void productList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                GridViewRow gvr = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                string prodID = gvr.Cells[0].Text;
                Application["prodID"] = prodID;
                Response.Redirect("EditProduct.aspx");
            }

        }
    }
}