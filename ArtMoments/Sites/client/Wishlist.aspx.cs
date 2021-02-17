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


        protected void txtSearch_TextChanged1(object sender, EventArgs e)
        {

          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT DISTINCT Wishlist.id, Wishlist.product_id, Product.prod_name, Product.prod_price, Product.prod_stock, Product.prod_size, Product.prod_description, Product_Category.category_name, Product.prod_image" +
                " FROM Wishlist, Product, Product_Category, [User] " +
                "WHERE Wishlist.user_id = [User].id" +
                " AND Wishlist.product_id = Product.id" +
                " AND Product_Category.id = Product.category_id " +
                "AND [User].user_name = @user_name " +
                "AND Product.prod_name LIKE  \'%" + (txtSearch.Text) + "%\'";

            using (SqlDataAdapter sda = new SqlDataAdapter(sqlCmd, conn))
            {
                sda.SelectCommand.CommandType = CommandType.Text;
                sda.SelectCommand.Parameters.AddWithValue("@user_name", Session["UserName"].ToString());
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if ((dt.Rows.Count > 0) && (dt.Rows[0][0] != DBNull.Value))
                {
                    gvWishlist.DataSourceID = null;
                    gvWishlist.DataSource = dt;
                    gvWishlist.DataBind();
                }
            }
            conn.Close();
        }
    }
}