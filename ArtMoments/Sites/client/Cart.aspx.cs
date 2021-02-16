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
            Double total = 0;
            if (!IsPostBack)
            {
                Session["UserId"] = 3;
                Session["CartId"] = 1003;
                SqlConnection con = new SqlConnection(conString);
                string getCartItemQuery = "SELECT C.id AS cart_id, C.user_id, CI.product_id, CI.quantity_int as cart_quantity, CI.cart_id, P.id AS prod_id, P.prod_name as prod_name, P.prod_size, P.prod_description, P.category_id, P.prod_image AS prod_image, P.prod_price AS prod_price, P.prod_stock AS available_stock, P.prod_sales, P.user_id, U.id AS user_id, U.user_name AS user_name, U.user_password, U.user_email, U.user_contactno, U.bibliography, U.profile_pic, U.user_type, (P.prod_price*CI.quantity_int) as subtotal FROM User_Cart AS C INNER JOIN User_CartItem AS CI ON CI.cart_id = C.id INNER JOIN Product AS P ON CI.product_id = P.id INNER JOIN[User] AS U ON P.user_id = U.id WHERE(C.user_id = @UserId)";
                SqlDataAdapter sda = new SqlDataAdapter(getCartItemQuery, con);
                sda.SelectCommand.Parameters.AddWithValue("@UserId", Session["UserId"]);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

                foreach (DataRow row in dt.Rows)
                {
                    total+= row.Field<Double>("subtotal");
                    lblTotalPrice.Text = total.ToString();
                }
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

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Session["UserId"] = 3;
            Session["CartId"] = 1003;
            //create new transaction
            try
            {
                SqlConnection con = new SqlConnection(conString);

                string createTransacQuery = "insert into [Transaction] (user_id, date_order) VALUES (@CustId, @DateOrder)";
                SqlCommand cmd = new SqlCommand(createTransacQuery, con);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["UserId"]));
                cmd.Parameters.AddWithValue("@DateOrder", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Inserted')", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);

            }
            //insert order into transaction
            try
            {
                //read data from cart
                SqlConnection con = new SqlConnection(conString);
                string getCartItemQuery = "SELECT CI.product_id as prod_id, CI.quantity_int as cart_quantity, CI.cart_id as cart_id, P.prod_stock AS available_stock FROM User_CartItem AS CI JOIN Product P on CI.product_id = P.id INNER JOIN User_Cart C on C.id = CI.cart_id where C.id = @CartId";
                SqlDataAdapter sda = new SqlDataAdapter(getCartItemQuery, con);
                sda.SelectCommand.Parameters.AddWithValue("@CartId", Session["CartId"]);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                
                getTransacID();
                foreach (DataRow row in dt.Rows)
                {
                    con.Open();
                    string insertOrdersQuery = "insert into [Order] (product_id,quantity,deliver_channel,order_status,transaction_id) VALUES (@ProdId, @Qty,@DeliverChannel,@OrderStatus,@TransacId)";
                    SqlCommand cmd = new SqlCommand(insertOrdersQuery, con);
                    cmd.Parameters.AddWithValue("@ProdId", row.Field<Int32>("prod_id"));
                    cmd.Parameters.AddWithValue("@Qty", row.Field<Int32>("cart_quantity"));
                    cmd.Parameters.AddWithValue("@DeliverChannel", "Pos Laju");
                    cmd.Parameters.AddWithValue("@OrderStatus", "Pending");
                    cmd.Parameters.AddWithValue("@TransacId", Convert.ToInt32(Session["TransacId"]));
                    
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);

            }
        }

        protected void getTransacID()
        {
            string getTransIdQuery = "select TOP(1) id from [Transaction] ORDER BY id DESC";
            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand(getTransIdQuery, conn);
                try
                {
                    conn.Open();

                    if (cmd.ExecuteScalar() != null)
                    {
                        Session["TransacId"] = cmd.ExecuteScalar();
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);
                }
            }
        }

        //public Double calculatePrice(int qty, Double price)
        //{
        //    string[] artworkPriceSplit = artworkPrice.Split('.');
        //    Double artPrice = Convert.ToInt32(artworkPriceSplit[0]);
        //    if (artworkPriceSplit[0] != null)
        //    {
        //        if (artworkPriceSplit[1].Length == 1)
        //        {
        //            artPrice += (Convert.ToDouble(artworkPriceSplit[1]) / 10);
        //        }
        //        else
        //        {
        //            artPrice += (Convert.ToDouble(artworkPriceSplit[1]) / 100);
        //        }
        //    }
        //    Double subtotal = (qty * artPrice);
        //    lblartworkPrice.Text = subtotal.ToString("0.00");
        //}

    }
}