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
        string conString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                MasterPageFile = "~/Masters/General.Master";

            }
            else if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist1.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client1.Master";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["ProdId"] = Request.QueryString["id"];
                Session["ProdId"] = 3;

                if (Session["ProdId"] != null)
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
                                        lblartworkPrice.Text = ((Double)prodInfo.Rows[0]["prod-price"]).ToString("F");
                                        artworkPricePerPiece.Text = ((Double)prodInfo.Rows[0]["prod-price"]).ToString("F");
                                        Session["ProdPrice"] = prodInfo.Rows[0].Field<System.Double>("prod-price");
                                        //artworkPrice = prodInfo.Rows[0].Field<System.Double>("prod-price");
                                        lblStock.Text = prodInfo.Rows[0]["prod-stock"].ToString();
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
                        if(Session["Username"] != null && Session["UserType"].Equals(1))
                        {
                            btnwishlistOff.Enabled = true;
                            btnwishlistOn.Enabled = true;

                            btnMinusQty.Enabled = true;
                            btnPlusQty.Enabled = true;
                            txtboxQty.Enabled = true;
                            btnBuyNow.Enabled = true; 

                            string wishlistQuery = "select W.id as [wishlist-id] from [Wishlist] W where W.user_id like @CustId and W.product_id like @ProdId";
                            using (SqlConnection conn = new SqlConnection(conString))
                            {
                                SqlCommand cmd = new SqlCommand(wishlistQuery, conn);
                                cmd.Parameters.Add("@CustId", (String)Session["Username"].ToString());
                                cmd.Parameters.Add("@ProdId", (String)Session["ProdId"].ToString());
                                try
                                {
                                    conn.Open();

                                    if (cmd.ExecuteScalar() != null)
                                    {
                                        btnwishlistOn.Visible = true;
                                        btnwishlistOff.Visible = false;
                                    }
                                }
                                catch (Exception ex)
                                {
                                }
                            }
                        }
                        else
                        {
                            btnwishlistOn.Visible = false;
                            btnwishlistOff.Visible = true;
                            btnwishlistOff.Enabled = false;
                            btnwishlistOn.Enabled = false;

                            btnMinusQty.Enabled = false;
                            btnPlusQty.Enabled = false;
                            txtboxQty.Enabled = false;
                            btnBuyNow.Enabled = false;
                            btnBuyNow.Text = "Login As Buyer To Buy";
                        }
                    }
                }
            }
        }

        protected void checkStock()
        {
            int availableStock = Convert.ToInt32(lblStock.Text);
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
                SqlCommand cmd = new SqlCommand(addWishlistQuery, con);
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["Username"]));
                cmd.Parameters.AddWithValue("@ProdId", Convert.ToInt32(Session["ProdId"]));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {

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
                cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["Username"]));
                cmd.Parameters.AddWithValue("@ProdId", Convert.ToInt32(Session["ProdId"]));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
            }
        }
        protected void updateCartItemss(int totalQty)
        {
            string updateCartItemssQuery = "update [CartItems] set [quantity_int] = @UpdateQty where user_id like @CustId and product_id like @ProdId";
            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(updateCartItemssQuery, conn);
                cmd.Parameters.AddWithValue("@CustId", (String)Session["Username"].ToString());
                cmd.Parameters.AddWithValue("@ProdId", (String)Session["ProdId"].ToString());
                cmd.Parameters.AddWithValue("@UpdateQty", totalQty);

                cmd.ExecuteNonQuery();
                conn.Close();
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
                cmdOrder.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["Username"]));
                cmdOrder.Parameters.AddWithValue("@DeliveryId", Convert.ToInt32(ddlDeliveryMethod.SelectedValue));

                cmdOrder.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {

            }
        }

        protected void checkInCart()
        {

            string cartChkQuery = "select quantity from [CartItems] C where C.user_id like @CustId and C.product_id like @ProdId";
            using (SqlConnection conn = new SqlConnection(conString))
            {
                SqlCommand cmd = new SqlCommand(cartChkQuery, conn);
                cmd.Parameters.Add("@CustId", (String)Session["Username"].ToString());
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
                }
            }
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            try
            {
                checkInCart();
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnPlusQty_Click(object sender, EventArgs e)
        {
            int custOrder = Convert.ToInt32(txtboxQty.Text);
            int availableStock = Convert.ToInt32(lblStock.Text);
            if (custOrder < availableStock)
            {
                custOrder++;
                txtboxQty.Text = custOrder.ToString();
                calculatePrice(custOrder);
            }
        }

    }
}
