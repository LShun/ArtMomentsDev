using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ArtMoments.Sites.general
{
    public partial class OrderArt : System.Web.UI.Page
    {
        string conString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["CustId"] = 1;
                Session["ProdId"] = 12;

                if (Session["CustId"] != null && Session["ProdId"] != null)
                {
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        using (SqlCommand cmd = new SqlCommand("select P.id as [prod-id], P.prod_name as [prod-name], P.prod_size [prod-size], P.prod_description as [prod-descrip], P.prod_image as [prod-image], P.prod_price as [prod-price] , P.prod_stock as [prod-stock], C.category_name as [category-name], C.category_name as [category_name], U.user_name as [author], U.bibliography as [bibliography], U.profile_pic as [author_profilePic] from [Product] P left join [Product_Category] C on C.id = P.category_id left join [User] U on U.id = P.user_id where P.id like @ProdId"))
                        {
                            cmd.Parameters.AddWithValue("@ProdId", (String)Session["ProdId"].ToString());
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.Connection = con;
                                sda.SelectCommand = cmd;
                                using (DataTable prodInfo = new DataTable())
                                {
                                    sda.Fill(prodInfo);

                                    foreach (DataRow rw in prodInfo.Rows)
                                    {
                                        artworkImage.ImageUrl = prodInfo.Rows[0]["prod-image"].ToString();
                                        lblartworkName.Text = prodInfo.Rows[0]["prod-name"].ToString();
                                        lblartworkID.Text = prodInfo.Rows[0]["prod-id"].ToString();
                                        lblartworkSize.Text = prodInfo.Rows[0]["prod-size"].ToString();
                                        lblartworkCategory.Text = prodInfo.Rows[0]["category-name"].ToString();
                                        lblauthor.Text = prodInfo.Rows[0]["author"].ToString();
                                        lblartworkDescription.Text = prodInfo.Rows[0]["prod-descrip"].ToString();
                                        lblartworkPrice.Text = string.Format("{0:#.##}",prodInfo.Rows[0]["prod-price"].ToString());
                                        Session["ProdPrice"] = prodInfo.Rows[0].Field<System.Double>("prod-price");
                                        //artworkPrice = prodInfo.Rows[0].Field<System.Double>("prod-price");
                                        lblHideStock.Text = prodInfo.Rows[0]["prod-stock"].ToString();
                                        checkStock();
                                        authorImage.ImageUrl = prodInfo.Rows[0]["author_profilePic"].ToString();
                                        lblauthorInfoName.Text = prodInfo.Rows[0]["author"].ToString();
                                        lblauthorBibliography.Text = prodInfo.Rows[0]["bibliography"].ToString();
                                    }
                                }
                            }
                        }
                        //check wishlist
                        using (SqlCommand cmd = new SqlCommand("select W.id as [wishlist-id] from [Wishlist] W where W.user_id like @CustId and W.product_id like @ProdId"))
                        {
                            cmd.Parameters.AddWithValue("@ProdId", (String)Session["ProdId"].ToString());
                            cmd.Parameters.AddWithValue("@CustId", (String)Session["CustId"].ToString());
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.Connection = con;
                                sda.SelectCommand = cmd;
                                using (DataTable isWishlist = new DataTable())
                                {
                                    sda.Fill(isWishlist);

                                    foreach (DataRow rw in isWishlist.Rows)
                                    {
                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Found')", true);

                                        btnwishlistOn.Visible = true;
                                        btnwishlistOff.Visible = false;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void checkStock()
        {
            int availableStock = Convert.ToInt32(lblHideStock.Text);
            if (availableStock == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Found')", true);

                txtboxQty.Text = "0";
                txtboxQty.Enabled = false;
                btnBuyNow.Enabled = false;
            }
        }

        protected void calculatePrice(int qty)
        {
            string artworkPrice = Session["ProdPrice"].ToString();
            string[] artworkPriceSplit = artworkPrice.Split('.');
            Double artPrice = Convert.ToInt32(artworkPriceSplit[0]);
            if (artworkPriceSplit[0] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('decimal found')", true);
                if (artworkPriceSplit[1].Length == 1)
                {
                    artPrice += (Convert.ToDouble(artworkPriceSplit[1]) / 10);
                }
                else
                {
                    artPrice += (Convert.ToDouble(artworkPriceSplit[1]) / 100);
                }
            }
            Double subtotal = (qty * artPrice);
            lblartworkPrice.Text = subtotal.ToString("0.00");
        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            int custOrder = Convert.ToInt32(txtboxQty.Text);
            if (custOrder > 1)
            {
                custOrder--;
                txtboxQty.Text = custOrder.ToString();
                calculatePrice(custOrder);
            }
        }


        protected void btnwishlistOff_Click(object sender, EventArgs e)
        {
            btnwishlistOn.Visible = true;
            btnwishlistOff.Visible = false;

            try
            {
                SqlConnection con = new SqlConnection(conString);
                
                string addWishlistQuery = "insert into [Wishlist] (product_id, user_id) VALUES (@ProdId, @CustId)";
                SqlCommand cmd = new SqlCommand(addWishlistQuery,con);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
                cmd.Parameters.AddWithValue("@ProdId", Convert.ToInt32(Session["ProdId"]));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Inserted')", true);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);

            }
        }

        protected void btnwishlistOn_Click(object sender, EventArgs e)
        {
            btnwishlistOn.Visible = false;
            btnwishlistOff.Visible = true;

            try
            {
                SqlConnection con = new SqlConnection(conString);

                string removeWishlistQuery = "Delete from [Wishlist] where user_id like @CustId and product_id like @ProdId";
                SqlCommand cmd = new SqlCommand(removeWishlistQuery, con);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
                cmd.Parameters.AddWithValue("@ProdId", Convert.ToInt32(Session["ProdId"]));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Deleted')", true);

            }catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail Delete')", true);
            }
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            try
            {
                //create transaction
                SqlConnection con = new SqlConnection(conString);
                string createTransacQuery = "insert into [Transaction] (user_id,date_order) VALUES (@CustId,@OrderDate)";
                SqlCommand cmd = new SqlCommand(createTransacQuery, con);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();

                //get the newly added transaction id
                using (SqlCommand cmdTransacId = new SqlCommand("select max(id) as [transac-id] from [Transaction]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    { 
                        cmdTransacId.Connection = con;
                        sda.SelectCommand = cmdTransacId;
                        using (DataTable lastTransacId = new DataTable())
                        {

                            sda.Fill(lastTransacId);

                            foreach (DataRow rw in lastTransacId.Rows)
                            {
                                Session["TransacId"] = lastTransacId.Rows[0].Field<int>("transac-id");
                            }
                        }
                    }
                }
                //create order

                try
                {
                    string addOrderQuery = "insert into [Order] (product_id,quantity,deliver_channel,order_status,transaction_id) VALUES (@ProdId, @Qty, @DeliverChannel, @OrderStatus, @TransacId)";
                    //string addOrderQuery = "insert into [Order] (product_id,transaction_id) VALUES (@ProdId, @TransacId)";
                    SqlCommand cmdOrder = new SqlCommand(addOrderQuery, con);
                    String deliverChannel = ddlDeliveyMethod.SelectedValue;
                    String orderStatus = "Pending";
                    cmdOrder.Parameters.AddWithValue("@ProdId", Convert.ToInt32(Session["ProdId"]));
                    cmdOrder.Parameters.AddWithValue("@Qty", Convert.ToInt32(txtboxQty.Text));
                    cmdOrder.Parameters.AddWithValue("@DeliverChannel", deliverChannel);
                    cmdOrder.Parameters.AddWithValue("@OrderStatus", orderStatus);
                    int transacId = Convert.ToInt32(Session["TransacId"]);
                    cmdOrder.Parameters.AddWithValue("@TransacId", transacId);

                    cmdOrder.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Inserted Order')", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);

            }
        }

        protected void btnPlusQty_Click(object sender, EventArgs e)
        {
            int custOrder = Convert.ToInt32(txtboxQty.Text);
            int availableStock = Convert.ToInt32(lblHideStock.Text);
            if (custOrder < availableStock)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success plus')", true);
                custOrder++;
                txtboxQty.Text = custOrder.ToString();
                calculatePrice(custOrder);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);
            }
        }
    }
}