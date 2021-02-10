using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ArtMoments.Sites.general
{
    public partial class OrderArt : System.Web.UI.Page
    {
        string conString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    //still need get selected ID from display
                    SqlConnection conn = new SqlConnection(conString);
                    conn.Open();

                    string getCustIdQuery = "select cust.id as [cust-id] from User cust where @custUserName like cust.user_name";

                    SqlCommand cmd = new SqlCommand(getCustIdQuery, conn);
                    cmd.Parameters.AddWithValue("@custUserName", (String)Session["UserName"]);

                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    Session["CustId"] = dt;

                    string selectedArt = "select P.id as [prod-id], P.prod_name as [prod-name], P.prod_size [prod-size], P.prod_description as [prod-descrip], P.prod_image as [prod-image], P.prod_price as [prod-price] , P.prod_stock as [prod-stock] from Product P where P.prod_id = selectedId";
                    //put cust id //putselectedprodid
                    cmd = new SqlCommand(selectedArt, conn);
                    cmd.Parameters.AddWithValue("@custId", (String)Session["CustId"]);
                    //get avaiable stock value
                    conn.Close();
                }
                else
                {
                    Response.Write("Require Sign In");
                }
            }
        }
        protected int qtyValue = 20;
        protected void btnMinus_Click(object sender, EventArgs e)
        {
            if (qtyValue > 1)
            {
                qtyValue--;
                txtboxQty.Text = qtyValue.ToString();
            }

            // if the stock available = 0, disable minus , plus button and disable the textbox
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            qtyValue = Convert.ToInt32(txtboxQty.Text);
            qtyValue++;
            txtboxQty.Text = qtyValue.ToString();

            // if stock = stock available, disable the plus button
        }

        protected void btnwishlistOff_Click(object sender, EventArgs e)
        {
            //btnwishlistOn.Visible = true;
            //btnwishlistOff.Visible = false;
            //// 
            //try
            //{
            //    SqlConnection conn = new SqlConnection(conString);
            //    conn.Open();

            //    //put seected prod id // put cust id // use addwitvalue
            //    string removeWishlistQuery = "Delete from [dbo].[Wishlist] where ";
            //    SqlCommand cmd = new SqlCommand(removeWishlistQuery, conn);

            //    cmd.ExecuteNonQuery();

            //    Response.Write("Insert Order Successfully");
            //    conn.Close();
            //}
            //catch (Exception ex)
            //{
            //    Response.Write("Error Delete Wishlist");
            //}
        }

        protected void btnwishlistOn_Click(object sender, EventArgs e)
        {
            btnwishlistOn.Visible = false;
            btnwishlistOff.Visible = true;
            //try
            //{
            //    SqlConnection conn = new SqlConnection(conString);
            //    conn.Open();
            //    //insert custid
            //    string insertWishlistQuery = "insert into [dbo].[Wishlist](prod_id,cust_id) values (@productId,@custId)";
            //    SqlCommand cmd = new SqlCommand(insertWishlistQuery, conn);
            //    cmd.Parameters.AddWithValue("@productId", lblartworkID);
            //    cmd.Parameters.AddWithValue("@custId", (String)Session["CustId"]);
            //    cmd.ExecuteNonQuery();

            //    Response.Write("Insert Wishlist Successfully");
            //    conn.Close();
            //}
            //catch (Exception ex)
            //{
            //    Response.Write("Error Insert Wishlist");
            //}
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
        //    try
        //    {

        //        DateTime deliveryDate = DateTime.Now;
        //        string orderStatus = "Pending";
        //        SqlConnection conn = new SqlConnection(conString);
        //        conn.Open();
        //        string insertOrderQuery = "insert into [dbo].[Order](prod_id,quantity,deliver_channel,date_delivery,order_status) values (@productId,@quantity, @deliveryChannel, @dateDelivery, @orderStatus)";
        //        SqlCommand cmd = new SqlCommand(insertOrderQuery, conn);
        //        cmd.Parameters.AddWithValue("@productId", lblartworkID);
        //        cmd.Parameters.AddWithValue("@quantity", Convert.ToInt32(txtboxQty.Text));
        //        cmd.Parameters.AddWithValue("@deliveryChannel", ddlDeliveyMethod.SelectedValue);
        //        cmd.Parameters.AddWithValue("@prodDesc", deliveryDate);
        //        cmd.Parameters.AddWithValue("@categoryId", orderStatus);
        //        cmd.ExecuteNonQuery();

        //        Response.Write("Insert Order Successfully");

        //        //put into transaction
        //        try
        //        {
        //            DateTime transac_date = DateTime.Now;
        //            string insertTransacQuery = "insert into [dbo].[Transaction](order_id, user_id, date_order) values (@orderId, @user_id, transac_date)";
        //            cmd = new SqlCommand(insertTransacQuery, conn);
        //            cmd.Parameters.AddWithValue("@transacDate", transac_date);
        //            cmd.Parameters.AddWithValue("@custId", (String)Session["CustId"]);
        //            // Create Order ID reference
        //            DataTable dt = new DataTable();
        //            SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //            sda.Fill(dt);
        //            Session["OrderId"] = dt.Columns[0];
        //            cmd.Parameters.AddWithValue("@orderId", (String)Session["OrderId"]);
        //        }
        //        catch (Exception ex)
        //        {

        //        }
        //        conn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("Error Insert Order");
        //    }
        //}
    }
}