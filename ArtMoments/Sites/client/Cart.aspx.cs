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
        string conString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Double total = 0;
            if (!IsPostBack)
            {
                // retrive cart information of particular buyer
                DataTable cartInfo = this.GetData("SELECT C.id, C.product_id, C.quantity as quantity, C.user_id, P.id AS prod_id, P.prod_name as prod_name, P.prod_image as prod_img, P.prod_price as prod_price, P.prod_stock as prod_stock, P.prod_sales, P.user_id AS author_id, U.user_name, C.delivery_id as deliver_id, U.id AS user_id, (P.prod_price*C.quantity) as subtotal FROM CartItems AS C INNER JOIN Product AS P ON P.id = C.product_id INNER JOIN [User] AS U ON U.id = C.user_id WHERE(C.user_id like @CustId)");
                RepeaterCartInfo.DataSource = cartInfo;
                RepeaterCartInfo.DataBind();

                // calcualte total for all the art item in the cart
                foreach (DataRow row in cartInfo.Rows)
                {
                    total += row.Field<Double>("subtotal");
                    lblTotalPrice.Text = total.ToString("F");
                }

                // if there is record only allow user to view the total and allow them to checkout
                if (total > 0)
                {
                    lblTotalPrice.Visible = true;
                    lblTotalPriceTxt.Visible = true;
                    btnCheckout.Visible = true;
                }
         
            }

        }

        // use to create and return datatable
        private DataTable GetData(string query)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@CustId", Session["UserId"]);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        // action carry out when user minus the quantity of particular art item in the cart
        protected void minusQty(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button.
            RepeaterItem qtyItem = (sender as Button).NamingContainer as RepeaterItem;

            int displayQty = Convert.ToInt32((qtyItem.FindControl("txtQty") as TextBox).Text);

            int prodId = Convert.ToInt32((qtyItem.FindControl("txtProdId") as TextBox).Text);

            // the art item qty to be minus should not be less than one
            if (displayQty > 1)
            {
                int updateQty = displayQty - 1;

                // update the qty of the particular item in the database 
                string updateCartItemsQuery = "update [CartItems] set [quantity] = @UpdateQty where user_id like @CustId and product_id like @ProdId";
                using (SqlConnection conn = new SqlConnection(conString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(updateCartItemsQuery, conn);
                    cmd.Parameters.AddWithValue("@CustId", (String)Session["UserId"].ToString());
                    cmd.Parameters.AddWithValue("@ProdId", prodId);
                    cmd.Parameters.AddWithValue("@UpdateQty", updateQty);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect(Request.RawUrl);

                }
            }

        }

        // action carry out when user add the quantity of particular art item in the cart
        protected void plusQty(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button
            RepeaterItem qtyItem = (sender as Button).NamingContainer as RepeaterItem;

            int displayQty = Convert.ToInt32((qtyItem.FindControl("txtQty") as TextBox).Text);

            int prodId = Convert.ToInt32((qtyItem.FindControl("txtProdId") as TextBox).Text);

            int stockAvailable = Convert.ToInt32((qtyItem.FindControl("txtAvailable") as TextBox).Text);

            // the art item qty to be minus should not be more than the stock available
            if (displayQty < stockAvailable)
            {
                int updateQty = displayQty + 1;
                // update the qty of the particular item in the database 
                string updateCartItemsQuery = "update [CartItems] set [quantity] = @UpdateQty where user_id like @CustId and product_id like @ProdId";
                using (SqlConnection conn = new SqlConnection(conString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(updateCartItemsQuery, conn);
                    cmd.Parameters.AddWithValue("@CustId", (String)Session["UserId"].ToString());
                    cmd.Parameters.AddWithValue("@ProdId", prodId);
                    cmd.Parameters.AddWithValue("@UpdateQty", updateQty);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect(Request.RawUrl);

                }
            }

        }

        // action perform when user checkout from the cart
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                btnCheckout.Enabled = true;
                //create new transaction before storing the order
                SqlConnection con = new SqlConnection(conString);

                string createTransacQuery = "insert into [Transaction] (user_id, date_order) VALUES (@CustId, @DateOrder)";
                SqlCommand cmd = new SqlCommand(createTransacQuery, con);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["UserId"]));
                cmd.Parameters.AddWithValue("@DateOrder", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                //insert orders into transaction

                //read data from cart
                con = new SqlConnection(conString);
                string getCartItemsQuery = "SELECT C.product_id as prod_id, C.quantity as cart_quantity, C.delivery_id as delivery_id, P.prod_stock as available_stock, P.prod_sales as prod_sales FROM CartItems AS C JOIN Product P on C.product_id = P.id where C.user_id = @CustId";
                SqlDataAdapter sda = new SqlDataAdapter(getCartItemsQuery, con);
                sda.SelectCommand.Parameters.AddWithValue("@CustId", Session["UserId"]);
                DataTable cartItem = new DataTable();
                sda.Fill(cartItem);

                // retrieve particular newly added transaction id 
                getTransacID();

                // for each of the item recorded in the cart insert as orders
                foreach (DataRow row in cartItem.Rows)
                {
                    con.Open();
                    string insertOrdersQuery = "insert into [Order] (product_id,quantity,delivery_id,order_status,transaction_id) VALUES (@ProdId, @Qty,@DeliverId,@OrderStatus,@TransacId)";
                    cmd = new SqlCommand(insertOrdersQuery, con);
                    cmd.Parameters.AddWithValue("@ProdId", row.Field<Int32>("prod_id"));
                    cmd.Parameters.AddWithValue("@Qty", row.Field<Int32>("cart_quantity"));
                    cmd.Parameters.AddWithValue("@DeliverId", row.Field<Int32>("delivery_id"));
                    cmd.Parameters.AddWithValue("@OrderStatus", "Pending");
                    cmd.Parameters.AddWithValue("@TransacId", Convert.ToInt32(Session["TransacId"]));

                    cmd.ExecuteNonQuery();
                    con.Close();

                    //deduct stock qty
                    con.Open();
                    string updateProdStockQuery = "update [Product] set prod_stock = @UpdatedAvailableQty, prod_sales = @UpdatedSales where id like @ProdId";
                    using (SqlCommand cmdSales = new SqlCommand(updateProdStockQuery, con))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('success update product info')", true);
                        int cartQty = row.Field<Int32>("cart_quantity");
                        int availableQty = row.Field<Int32>("available_stock");
                        int updateQty = availableQty - cartQty;

                        int currentSalesQty = row.Field<Int32>("prod_sales");
                        int updateSales = currentSalesQty + cartQty;
                        int prodId = row.Field<Int32>("prod_id");
                        cmdSales.Parameters.AddWithValue("@UpdatedAvailableQty", updateQty);
                        cmdSales.Parameters.AddWithValue("@UpdatedSales", updateSales);
                        cmdSales.Parameters.AddWithValue("@ProdId", row.Field<Int32>("prod_id"));
                        cmdSales.ExecuteNonQuery();
                        con.Close();
                    }

                    //remove all from cart & minus the stock
                    clearCart();
                }
            }
            else
            {
                // do not allow user to checkout if the qty of item entered is invalid
                btnCheckout.Enabled = false;
            }
        }

        // retrieve the transaction id of newly added transaction
        protected void getTransacID()
        {
            string getTransIdQuery = "select TOP(1) id from [Transaction] ORDER BY id DESC";
            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand(getTransIdQuery, conn);

                conn.Open();

                if (cmd.ExecuteScalar() != null)
                {
                    Session["TransacId"] = cmd.ExecuteScalar();
                }
            }
        }

        // action perform when user click delete the particular item from the cart
        protected void deleteItem(object sender, EventArgs e)
        { 
            RepeaterItem deleteItem = (sender as Button).NamingContainer as RepeaterItem;
            int prodId = Convert.ToInt32((deleteItem.FindControl("txtProdId") as TextBox).Text);
            SqlConnection con = new SqlConnection(conString);

            string removeCartItems = "Delete from [CartItems] where product_id like @ProdId and user_id like @CustId";
            SqlCommand cmd = new SqlCommand(removeCartItems, con);
            cmd.Parameters.AddWithValue("@ProdId", prodId);
            cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["UserId"]));
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
           
        }

        // clear all the item from the cart as the user checkout
        protected void clearCart()
        {
            SqlConnection con = new SqlConnection(conString);

            string clearCartQuery = "Delete from [CartItems] where user_id like @CustId";
            SqlCommand cmd = new SqlCommand(clearCartQuery, con);
            cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["UserId"]));
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        // action on updating the database as buyer change the delivery method for particular art item
        protected void ddlDeliverChg(object sender, EventArgs e)
        {
            RepeaterItem chgDDLItem = (sender as DropDownList).NamingContainer as RepeaterItem;
            int ddlDeliverId = Convert.ToInt32((chgDDLItem.FindControl("ddlDeliveryMethod") as DropDownList).SelectedValue);
            int prodId = Convert.ToInt32((chgDDLItem.FindControl("txtProdId") as TextBox).Text);
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            string updateDeliveryMethodQuery = "update [CartItems] set delivery_id = @DeliveryMethod where user_id like @CustId and product_id like @ProdId";
            using (SqlCommand cmd = new SqlCommand(updateDeliveryMethodQuery, con))
            {
                cmd.Parameters.AddWithValue("@DeliveryMethod", ddlDeliverId);
                cmd.Parameters.AddWithValue("@ProdId", prodId);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["UserId"]));
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }

        // action on updating the database as buyer change the qty of particular art item 
        protected void txtQtyChg(object sender, EventArgs e)
        {
            RepeaterItem chgQtyItem = (sender as TextBox).NamingContainer as RepeaterItem;
            int qtyInput = Convert.ToInt32((chgQtyItem.FindControl("txtQty") as TextBox).Text);
            int prodId = Convert.ToInt32((chgQtyItem.FindControl("txtProdId") as TextBox).Text);
            int qtyAvailable = Convert.ToInt32((chgQtyItem.FindControl("txtAvailable") as TextBox).Text);

            if (qtyInput <= qtyAvailable && qtyInput != 0)
            {
                SqlConnection con = new SqlConnection(conString);
                con.Open();
                string updateQtyQuery = "update [CartItems] set quantity = @QtyInput where user_id like @CustId and product_id like @ProdId";
                using (SqlCommand cmd = new SqlCommand(updateQtyQuery, con))
                {
                    cmd.Parameters.AddWithValue("@QtyInput", qtyInput);
                    cmd.Parameters.AddWithValue("@ProdId", prodId);
                    cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["UserId"]));
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
            }
        }


        // go to the order art page of particular item when usr click on the img
        protected void viewProdDetailImg(object sender, EventArgs e)
        {
            RepeaterItem clickImgItem = (sender as ImageButton).NamingContainer as RepeaterItem;
            string prodId = (clickImgItem.FindControl("txtProdId") as TextBox).Text;
            Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + prodId);
        }

        // go to the order art page of particular item when usr click on the name
        protected void viewProdDetailName(object sender, EventArgs e)
        {
            RepeaterItem clickNameItem = (sender as LinkButton).NamingContainer as RepeaterItem;
            string prodId = (clickNameItem.FindControl("txtProdId") as TextBox).Text;
            Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + prodId);
        }
    }
}
