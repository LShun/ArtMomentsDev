using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Text;
using System.Web.Services;
using System.Threading;

namespace ArtMoments.Sites.client
{
    public partial class Cart : System.Web.UI.Page
    {
        string conString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["UserId"] = 3;
                Session["CartId"] = 1003;
                SqlConnection con = new SqlConnection(conString);
                string getCartItemQuery = "SELECT C.id AS cart_id, C.user_id, CI.product_id, CI.quantity_int as cart_quantity, CI.cart_id, P.id AS prod_id, P.prod_name as prod_name, P.prod_size, P.prod_description, P.category_id, P.prod_image AS prod_image, P.prod_price AS prod_price, P.prod_stock AS available_stock, P.prod_sales, P.user_id, U.id AS user_id, U.user_name AS user_name, U.user_password, U.user_email, U.user_contactno, U.bibliography, U.profile_pic, U.user_type FROM User_Cart AS C INNER JOIN User_CartItem AS CI ON CI.cart_id = C.id INNER JOIN Product AS P ON CI.product_id = P.id INNER JOIN[User] AS U ON P.user_id = U.id WHERE(C.user_id = @UserId)";
                SqlDataAdapter sda = new SqlDataAdapter(getCartItemQuery, con);
                sda.SelectCommand.Parameters.AddWithValue("@UserId", Session["UserId"]);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }

        }

        protected void minusQty(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button.
            RepeaterItem qtyItem = (sender as Button).NamingContainer as RepeaterItem;

            int displayQty = Convert.ToInt32((qtyItem.FindControl("txtQty") as TextBox).Text);

            int prodId = Convert.ToInt32((qtyItem.FindControl("txtProdId") as TextBox).Text);

            if(displayQty > 1)
            {
                int updateQty = displayQty - 1;

                string updateCartItemQuery = "update [User_CartItem] set [quantity_int] = @UpdateQty where cart_id like @CartId and product_id like @ProdId";
                using (SqlConnection conn = new SqlConnection(conString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(updateCartItemQuery, conn);
                    cmd.Parameters.AddWithValue("@CartId", (String)Session["CartId"].ToString());
                    cmd.Parameters.AddWithValue("@ProdId", prodId);
                    cmd.Parameters.AddWithValue("@UpdateQty", updateQty);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('UpdateCart')", true);
                    Response.Redirect(Request.RawUrl);

                }
            }
            
        }

        protected void plusQty(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button.
            RepeaterItem qtyItem = (sender as Button).NamingContainer as RepeaterItem;

            int displayQty = Convert.ToInt32((qtyItem.FindControl("txtQty") as TextBox).Text);

            int prodId = Convert.ToInt32((qtyItem.FindControl("txtProdId") as TextBox).Text);

            int stockAvailable = Convert.ToInt32((qtyItem.FindControl("txtAvailable") as TextBox).Text);

            if(displayQty < stockAvailable)
            {
                int updateQty = displayQty + 1;

                string updateCartItemQuery = "update [User_CartItem] set [quantity_int] = @UpdateQty where cart_id like @CartId and product_id like @ProdId";
                using (SqlConnection conn = new SqlConnection(conString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(updateCartItemQuery, conn);
                    cmd.Parameters.AddWithValue("@CartId", (String)Session["CartId"].ToString());
                    cmd.Parameters.AddWithValue("@ProdId", prodId);
                    cmd.Parameters.AddWithValue("@UpdateQty", updateQty);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('UpdateCart')", true);
                    Response.Redirect(Request.RawUrl);

                }
            }

        }

    }
}