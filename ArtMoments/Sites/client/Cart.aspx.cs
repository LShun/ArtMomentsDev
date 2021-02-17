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
                Session["CustId"] = 1;
                if (!this.IsPostBack)
                {
                    
                    DataTable cartInfo = this.GetData("SELECT C.id, C.product_id, C.quantity as quantity, C.user_id, P.id AS prod_id, P.prod_name as prod_name, P.prod_image as prod_img, P.prod_price as prod_price, P.prod_stock as prod_stock, P.prod_sales, P.user_id AS author_id, U.user_name, C.delivery_id as deliver_id, U.id AS user_id, (P.prod_price*C.quantity) as subtotal FROM CartItems AS C INNER JOIN Product AS P ON P.id = C.product_id INNER JOIN [User] AS U ON U.id = C.user_id WHERE(C.user_id = @CustId)");
                    RepeaterCartInfo.DataSource = cartInfo;
                    RepeaterCartInfo.DataBind();
                

                    foreach (DataRow row in cartInfo.Rows)
                    {
                        total+= row.Field<Double>("subtotal");
                        lblTotalPrice.Text = total.ToString();
                    }
                }
            }

        }

        private DataTable GetData(string query)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@CustId", Session["CustId"]);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void minusQty(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button.
            RepeaterItem qtyItem = (sender as Button).NamingContainer as RepeaterItem;

            int displayQty = Convert.ToInt32((qtyItem.FindControl("txtQty") as TextBox).Text);

            int prodId = Convert.ToInt32((qtyItem.FindControl("txtProdId") as TextBox).Text);

            if (displayQty > 1)
            {
                int updateQty = displayQty - 1;

                string updateCartItemsQuery = "update [CartItems] set [quantity] = @UpdateQty where user_id like @CustId and product_id like @ProdId";
                using (SqlConnection conn = new SqlConnection(conString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(updateCartItemsQuery, conn);
                    cmd.Parameters.AddWithValue("@CustId", (String)Session["CustId"].ToString());
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

            if (displayQty < stockAvailable)
            {
                int updateQty = displayQty + 1;

                string updateCartItemsQuery = "update [CartItems] set [quantity] = @UpdateQty where user_id like @CustId and product_id like @ProdId";
                using (SqlConnection conn = new SqlConnection(conString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(updateCartItemsQuery, conn);
                    cmd.Parameters.AddWithValue("@CustId", (String)Session["CustId"].ToString());
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
            if (Page.IsValid)
            {
                btnCheckout.Enabled = true;
                //create new transaction
                try
                {
                    SqlConnection con = new SqlConnection(conString);

                    string createTransacQuery = "insert into [Transaction] (user_id, date_order) VALUES (@CustId, @DateOrder)";
                    SqlCommand cmd = new SqlCommand(createTransacQuery, con);
                    cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
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
                    string getCartItemsQuery = "SELECT C.product_id as prod_id, C.quantity as cart_quantity, C.delivery_id as delivery_id, P.prod_stock as available_stock, P.prod_sales as prod_sales FROM CartItems AS C JOIN Product P on C.product_id = P.id where C.user_id = @CustId";
                    SqlDataAdapter sda = new SqlDataAdapter(getCartItemsQuery, con);
                    sda.SelectCommand.Parameters.AddWithValue("@CustId", Session["CustId"]);
                    DataTable cartItem = new DataTable();
                    sda.Fill(cartItem);

                    getTransacID();
                    foreach (DataRow row in cartItem.Rows)
                    {
                        con.Open();
                        string insertOrdersQuery = "insert into [Order] (product_id,quantity,delivery_id,order_status,transaction_id) VALUES (@ProdId, @Qty,@DeliverId,@OrderStatus,@TransacId)";
                        SqlCommand cmd = new SqlCommand(insertOrdersQuery, con);
                        cmd.Parameters.AddWithValue("@ProdId", row.Field<Int32>("prod_id"));
                        cmd.Parameters.AddWithValue("@Qty", row.Field<Int32>("cart_quantity"));
                        cmd.Parameters.AddWithValue("@DeliverId", row.Field<Int32>("delivery_id"));
                        cmd.Parameters.AddWithValue("@OrderStatus", "Pending");
                        cmd.Parameters.AddWithValue("@TransacId", Convert.ToInt32(Session["TransacId"]));

                        cmd.ExecuteNonQuery();
                        con.Close();

                        //deduct stock qty
                        try
                        {
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
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('fail update product info')", true);
                        }
                    }

                    //remove all from cart & minus the stock
                    clearCart();

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);

                }
            }
            else
            {
                btnCheckout.Enabled = false;
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

        protected void deleteItem(object sender, EventArgs e)
        {
            try
            {
                RepeaterItem deleteItem = (sender as Button).NamingContainer as RepeaterItem;
                int prodId = Convert.ToInt32((deleteItem.FindControl("txtProdId") as TextBox).Text);
                SqlConnection con = new SqlConnection(conString);

                string removeCartItems = "Delete from [CartItems] where product_id like @ProdId and user_id like @CustId";
                SqlCommand cmd = new SqlCommand(removeCartItems, con);
                cmd.Parameters.AddWithValue("@ProdId", prodId);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Deleted')", true);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail Delete')", true);
            }
        }

        protected void clearCart()
        {
            try
            {
                SqlConnection con = new SqlConnection(conString);

                string clearCartQuery = "Delete from [CartItems] where user_id like @CustId";
                SqlCommand cmd = new SqlCommand(clearCartQuery, con);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Deleted')", true);
                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail Delete')", true);
            }
        }

        protected void ddlDeliverChg(object sender, EventArgs e)
        {
            RepeaterItem chgDDLItem = (sender as DropDownList).NamingContainer as RepeaterItem;
            int ddlDeliverId = Convert.ToInt32((chgDDLItem.FindControl("ddlDeliveryMethod") as DropDownList).SelectedValue);
            int prodId = Convert.ToInt32((chgDDLItem.FindControl("txtProdId") as TextBox).Text);
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            string updateDeliveryMethodQuery = "update [CartItems] set delivery_id = @DeliveryMethod where user_id like @CustId and product_id like @ProdId";
            using (SqlCommand cmdSales = new SqlCommand(updateDeliveryMethodQuery, con))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('success update product info')", true);

                cmdSales.Parameters.AddWithValue("@DeliveryMethod", ddlDeliverId);
                cmdSales.Parameters.AddWithValue("@ProdId", prodId);
                cmdSales.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
                cmdSales.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void goToSpecificProd(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "viewArtDetail")
            {
                Response.Redirect("~/Sites/general/OrderArt.aspx.aspx?id=" + e.CommandArgument);
            }
        }
    }
}