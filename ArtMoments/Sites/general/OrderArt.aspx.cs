using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.Web.Services;

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
                Session["ProdId"] = 6;

                if (Session["CustId"] != null && Session["ProdId"] != null)
                {
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        using (SqlCommand cmd = new SqlCommand("select P.id as [prod-id], P.prod_name as [prod-name], P.prod_size [prod-size], P.prod_description as [prod-descrip], P.prod_image as [prod-image], P.prod_price as [prod-price] , P.prod_stock as [prod-stock], P.prod_sales as [prod-sales], C.category_name as [category-name], C.category_name as [category_name], U.user_name as [author], U.bibliography as [bibliography], U.profile_pic as [author_profilePic] from [Product] P left join [Product_Category] C on C.id = P.category_id left join [User] U on U.id = P.user_id where P.id like @ProdId"))
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
                                        byte[] imgBinUrlProd = (byte[])prodInfo.Rows[0]["prod-image"];
                                        artworkImage.Src = string.Format("data:image/png;base64,{0}", Convert.ToBase64String(imgBinUrlProd));
                                        lblartworkName.Text = prodInfo.Rows[0]["prod-name"].ToString();
                                        lblartworkID.Text = prodInfo.Rows[0]["prod-id"].ToString();
                                        lblartworkSize.Text = prodInfo.Rows[0]["prod-size"].ToString();
                                        lblartworkCategory.Text = prodInfo.Rows[0]["category-name"].ToString();
                                        lblauthor.Text = prodInfo.Rows[0]["author"].ToString();
                                        lblartworkDescription.Text = prodInfo.Rows[0]["prod-descrip"].ToString();
                                        lblartworkPrice.Text = string.Format("{0:n}",prodInfo.Rows[0]["prod-price"].ToString());
                                        artworkPricePerPiece.Text= ((Double)prodInfo.Rows[0]["prod-price"]).ToString();
                                        Session["ProdPrice"] = prodInfo.Rows[0].Field<System.Double>("prod-price");
                                        //artworkPrice = prodInfo.Rows[0].Field<System.Double>("prod-price");
                                        lblHideStock.Text = prodInfo.Rows[0]["prod-stock"].ToString();
                                        checkStock();
                                        byte[] imgBinUrlAuthor = (byte[])prodInfo.Rows[0]["author_profilePic"];
                                        authorImage.Src = string.Format("data:image/png;base64,{0}", Convert.ToBase64String(imgBinUrlAuthor));
                                        lblauthorInfoName.Text = prodInfo.Rows[0]["author"].ToString();
                                        lblauthorBibliography.Text = prodInfo.Rows[0]["bibliography"].ToString();
                                        Session["CurrentSales"] = prodInfo.Rows[0]["prod-sales"];
                                    }
                                }
                            }
                        }
                        //check wishlist
                        string wishlistQuery = "select W.id as [wishlist-id] from [Wishlist] W where W.user_id like @CustId and W.product_id like @ProdId";
                        using (SqlConnection conn = new SqlConnection(conString))
                        {
                            SqlCommand cmd = new SqlCommand(wishlistQuery, conn);
                            cmd.Parameters.Add("@CustId", (String)Session["CustId"].ToString());
                            cmd.Parameters.Add("@ProdId", (String)Session["ProdId"].ToString());
                            try
                            {
                                conn.Open();

                                if(cmd.ExecuteScalar() != null)
                                {
                                    btnwishlistOn.Visible = true;
                                    btnwishlistOff.Visible = false;
                                }
                            }
                            catch(Exception ex)
                            {
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);
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

        public void calculatePrice(int qty)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('decimal found')", true);
            string artworkPrice = Session["ProdPrice"].ToString();
            string[] artworkPriceSplit = artworkPrice.Split('.');
            Double artPrice = Convert.ToInt32(artworkPriceSplit[0]);
            if (artworkPriceSplit[0] != null)
            {
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
        protected void updateCartItemss(int totalQty)
        {
            string updateCartItemssQuery = "update [CartItems] set [quantity_int] = @UpdateQty where user_id like @CustId and product_id like @ProdId";
            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(updateCartItemssQuery, conn);
                cmd.Parameters.AddWithValue("@CustId", (String)Session["CustId"].ToString());
                cmd.Parameters.AddWithValue("@ProdId", (String)Session["ProdId"].ToString());
                cmd.Parameters.AddWithValue("@UpdateQty", totalQty);
                
                cmd.ExecuteNonQuery();
                conn.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('UpdateCart')", true);
            }
        }

        void addNewIntoCart()
        {
            try
            {
                
                SqlConnection conn = new SqlConnection(conString);
                string addCartQuery = "insert into [CartItems] (product_id,quantity,delivery_id, user_id) VALUES (@ProdId, @Qty, @DeliveryId, @CustId)";
                //string addOrderQuery = "insert into [Order] (product_id,transaction_id) VALUES (@ProdId, @TransacId)";
                SqlCommand cmdOrder = new SqlCommand(addCartQuery, conn);
                conn.Open();
                cmdOrder.Parameters.AddWithValue("@ProdId", Convert.ToInt32(Session["ProdId"]));
                cmdOrder.Parameters.AddWithValue("@Qty", Convert.ToInt32(txtboxQty.Text));
                cmdOrder.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
                cmdOrder.Parameters.AddWithValue("@DeliveryId", Convert.ToInt32(ddlDeliveryMethod.SelectedValue));

                cmdOrder.ExecuteNonQuery();
                conn.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('addCart')", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);

            }
        }

        protected void checkInCart()
        {

            string cartChkQuery = "select quantity from [CartItems] C where C.user_id like @CustId and C.product_id like @ProdId";
            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand(cartChkQuery, conn);
                cmd.Parameters.Add("@CustId", (String)Session["CustId"].ToString());
                cmd.Parameters.Add("@ProdId", (String)Session["ProdId"].ToString());
                try
                {
                    conn.Open();

                    if (cmd.ExecuteScalar() != null)
                    {
                        // update
                        int totalQty = Convert.ToInt32(txtboxQty.Text) + (Int32)cmd.ExecuteScalar();
                        updateCartItemss(totalQty);
                    }
                    else
                    {
                        addNewIntoCart();
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);
                    
                }
            }
        }

       

        //void getUserCartId()
        //{
        //    string cartChkQuery = "select id from [User_Cart] C where C.user_id like @CustId";
        //    using (SqlConnection conn = new SqlConnection(conString))
        //    {
        //        SqlCommand cmd = new SqlCommand(cartChkQuery, conn);
        //        cmd.Parameters.Add("@CustId", (String)Session["CustId"].ToString());
        //        try
        //        {
        //            conn.Open();
        //            if(cmd.ExecuteScalar() != null)
        //            {
        //                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('addCart')", true);
        //                Session["CartId"] = cmd.ExecuteScalar();
        //                checkInCart();
        //            }
        //            else
        //            {
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail')", true);
        //        }
        //    }
        //}

        

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            try
            {
                checkInCart();

                ////create transaction
                //SqlConnection con = new SqlConnection(conString);
                //string createTransacQuery = "insert into [User_Cart] (user_id) VALUES (@CustId)";
                //SqlCommand cmd = new SqlCommand(createTransacQuery, con);
                //cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["CustId"]));
                //con.Open();
                //cmd.ExecuteNonQuery();

                ////get the newly added transaction id


                //string newCartQuery = "SELECT [id] FROM [User_Cart] C where C.user_id like @CustId";
                //using (SqlConnection conn = new SqlConnection(conString))
                //{
                //    SqlCommand newTransacCmd = new SqlCommand(newCartQuery, conn);
                //    try
                //    {
                //        conn.Open();

                //        if (newTransacCmd.ExecuteScalar() != null)
                //        {
                //            Session["CartId"] = newTransacCmd.ExecuteScalar();
                //        }
                //    }
                //    catch (Exception ex)
                //    {
                //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fail Transac')", true);
                //    }
                //}

                ////using (SqlCommand cmdTransacId = new SqlCommand("select max(id) as [transac-id] from [Transaction]"))
                ////{
                ////    using (SqlDataAdapter sda = new SqlDataAdapter())
                ////    {
                ////        cmdTransacId.Connection = con;
                ////        sda.SelectCommand = cmdTransacId;
                ////        using (DataTable lastTransacId = new DataTable())
                ////        {

                ////            sda.Fill(lastTransacId);

                ////            foreach (DataRow rw in lastTransacId.Rows)
                ////            {
                ////                Session["TransacId"] = lastTransacId.Rows[0].Field<int>("transac-id");
                ////            }
                ////        }
                ////    }
                ////}

                //checkInCart();
                ////create order



                //update product detail
                //try
                //{
                //    con.Open();
                //    int currentQty = Convert.ToInt32(lblHideStock.Text) - Convert.ToInt32(txtboxQty.Text);
                //    int currentSales = Convert.ToInt32(Session["CurrentSales"]) + Convert.ToInt32(txtboxQty.Text);

                //    string updateProdInfoQuery = @"update [Product] set prod_stock = @UpdatesAvailableQty, prod_sales = @UpdatedSales where id like @PodId";
                //    using (SqlCommand cmdSales = new SqlCommand(updateProdInfoQuery, con))
                //    {
                //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('success update product info')", true);
                //        cmdSales.Parameters.AddWithValue("@UpdatedAvailableQty", currentQty);
                //        cmdSales.Parameters.AddWithValue("@UpdatedSales", currentSales);
                //        cmdSales.Parameters.AddWithValue("@ProdId", Convert.ToInt32(Session["ProdId"]));
                //        cmdSales.ExecuteNonQuery();
                //        con.Close();
                //    }
                //}catch(Exception ex)
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('fail update product info')", true);
                //}
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
        }

    }
}
