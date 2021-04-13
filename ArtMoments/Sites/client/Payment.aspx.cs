using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

using System.IO;

namespace ArtMoments.Sites.client
{
    public partial class Payment : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
       
        Double delivery_fees;

        protected void Page_Load(object sender, EventArgs e)
        {
            Double total = 0;
            if (!IsPostBack)
            {
                DataTable paymentInfo = this.GetData(
                  "SELECT C.id, C.product_id, C.quantity as quantity, C.user_id, P.id AS prod_id, P.prod_name as prod_name, P.prod_image as prod_image, P.prod_price as prod_price, U.user_name, U.id AS user_id, (P.prod_price*C.quantity) as subtotal FROM CartItems AS C INNER JOIN Product AS P ON P.id = C.product_id INNER JOIN [User] AS U ON U.id = C.user_id WHERE(C.user_id like @CustId)");
                lvPaymentItem.DataSourceID = null;
                lvPaymentItem.DataSource = paymentInfo;
                lvPaymentItem.DataBind();

                // calcualte total for all the art item in the cart
                foreach (DataRow row in paymentInfo.Rows)
                {
                    total += row.Field<Double>("subtotal");
                    
                }
                if(total == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is no product for you to purchase..')", true);
                    Response.Redirect("~/Sites/general/HomePage.aspx");

                }
                ddlDeliveryMethod.Items.Clear();
                SqlConnection conn = new SqlConnection(conString);
                conn.Open();

                string sqlCmd = "SELECT DISTINCT [deliver_type], [deliver_fees] FROM [Delivery] ORDER BY [deliver_type]";

                using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            ListItem li = new ListItem((string)dr["deliver_type"]);
                            ddlDeliveryMethod.Items.Add(li);
                            if(ddlDeliveryMethod.SelectedItem.Value.Equals((string)dr["deliver_type"]))
                            {
                                lblDeliveryFee.Text =  dr["deliver_fees"].ToString();
                                //delivery_fees = Double.Parse(lblDeliveryFee.Text);
                            }
                        }
                    }
                }

                conn.Close();
                total += delivery_fees;
                lblTotalPrice.Text = total.ToString("F");
            }
            else
            {
                if (rblCardType.SelectedItem.Value.Equals("Visa Card"))
                {
                    revCardNum.ValidationExpression = "^([4]\\d{3}-)(\\d{4}-){2}\\d{4}$|^([4]\\d{3} )(\\d{4} ){2}\\d{4}$|^[4]\\d{15}$";
                }
                else
                {
                    revCardNum.ValidationExpression = "^([5]\\d{3}-)(\\d{4}-){2}\\d{4}$|^([5]\\d{3} )(\\d{4} ){2}\\d{4}$|^[5]\\d{15}$";
                }

                if (!txtExpYr.Text.Equals("") && !txtExpMth.Text.Equals(""))
                {
                    if(int.Parse(txtExpYr.Text) == DateTime.Now.Year)
                    {
                        if (int.Parse(txtExpYr.Text) >= DateTime.Now.Month)
                        {
                            txtExpYr.Text = "";
                            txtExpMth.Text = "";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Card Expiration Date should be greater than today or onward ')", true);
                        }
                    }
                    else if(int.Parse(txtExpYr.Text) < DateTime.Now.Year)
                    {
                        txtExpYr.Text = "";
                        txtExpMth.Text = "";
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Card Expiration Date should be greater than today or onward ')", true);
                    }


                    
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
                        //sda.SelectCommand.Parameters.AddWithValue("@CustId", "1");
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

      

        protected void ddlDeliveryMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            Double total = 0.00;
            DataTable paymentInfo = this.GetData(
                  "SELECT C.id, C.product_id, C.quantity as quantity, C.user_id, P.id AS prod_id, P.prod_name as prod_name, P.prod_image as prod_image, P.prod_price as prod_price, U.user_name, U.id AS user_id, (P.prod_price*C.quantity) as subtotal FROM CartItems AS C INNER JOIN Product AS P ON P.id = C.product_id INNER JOIN [User] AS U ON U.id = C.user_id WHERE(C.user_id like @CustId)");
            lvPaymentItem.DataSourceID = null;
            lvPaymentItem.DataSource = paymentInfo;
            lvPaymentItem.DataBind();

            // calcualte total for all the art item in the cart
            foreach (DataRow row in paymentInfo.Rows)
            {
                total += row.Field<Double>("subtotal");

            }
            SqlConnection conn = new SqlConnection(conString);
            conn.Open();

            string sqlCmd = "SELECT DISTINCT [id], [deliver_type], [deliver_fees] FROM [Delivery] ORDER BY [deliver_type]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (ddlDeliveryMethod.SelectedItem.Value == dr["id"].ToString())
                        {
                            lblDeliveryFee.Text = dr["deliver_fees"].ToString();
                            delivery_fees = Double.Parse(lblDeliveryFee.Text);
                        }
                    }
                }
            }

            conn.Close();
            total += delivery_fees;
            lblTotalPrice.Text = total.ToString("F");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Sites/general/HomePage.aspx");

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
           
           
            if (Page.IsValid)
            {
                if(chkPolicy.Checked)
                {
                    //confirm email
                    string connectionString =
                    ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

                    string username = Session["UserName"].ToString();
                    try
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connectionString))
                        {
                            sqlCon.Open();
                            String query =
                                "SELECT user_email FROM [User] WHERE user_name =@UserName";

                            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                            sqlCmd.Parameters.AddWithValue("@UserName", username);
                            sqlCon.Close();
                        }
                        //Fetching Settings from WEB.CONFIG file.  
                        string emailSender = ConfigurationManager.AppSettings["emailsender"].ToString();
                        string emailSenderPassword = ConfigurationManager.AppSettings["password"].ToString();
                        string emailSenderHost = ConfigurationManager.AppSettings["smtp"].ToString();
                        int emailSenderPort = Convert.ToInt16(ConfigurationManager.AppSettings["portnumber"]);
                        Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);


                        //Fetching Email Body Text from EmailTemplate File.  
                        //string FilePath = "C:\\Users\\Jin_Ern\\Desktop\\ArtMomentLatest31.1\\ArtMoments\\Sites\\client\\Receipt.aspx";
                        string FilePath = "C:\\Users\\Jin_Ern\\Desktop\\ArtMomentLatest31.1\\ArtMoments\\Sites\\client\\ReceiptTemp.html";
                        StreamReader str = new StreamReader(FilePath);
                        string MailText = str.ReadToEnd();
                        str.Close();


                        String orderDate, recvName, address, transactionId;
                        using (SqlConnection con3 = new SqlConnection(connectionString))
                        {
                            using (SqlCommand cmd3 = new SqlCommand("SELECT top 1 id, date_order, delivery_fees, recv_name, recv_address FROM [Transaction] WHERE user_id = " + Session["UserId"].ToString() + "order by id desc"))
                            //using (SqlCommand cmd = new SqlCommand("SELECT top 1 id, date_order, delivery_fees, recv_name, recv_address FROM [Transaction] WHERE user_id = 3 order by id desc"))
                            {
                                cmd3.CommandType = CommandType.Text;
                                cmd3.Connection = con3;
                                con3.Open();
                                using (SqlDataReader sdr = cmd3.ExecuteReader())
                                {

                                    sdr.Read();
                                    orderDate = sdr["date_order"].ToString();
                                    recvName = sdr["recv_name"].ToString();
                                    address = sdr["recv_address"].ToString();
                                    transactionId = sdr["id"].ToString();
                                }

                                con3.Close();
                            }
                        }

                        //Repalce [newusername] = signup user name 
                        MailText = MailText.Replace("[deliveryAddress]", address);
                        MailText = MailText.Replace("[orderID]", transactionId);
                        MailText = MailText.Replace("[orderDate]", orderDate);
                        MailText = MailText.Replace("[orderTotal]", "XXXX");
                        MailText = MailText.Replace("[newusername]", Session["Username"].ToString());

                        string subject = "Welcome to CSharpCorner.Com";

                        //Base class for sending email  
                        MailMessage _mailmsg = new MailMessage();

                        //Make TRUE because our body text is html  
                        _mailmsg.IsBodyHtml = true;

                        //Set From Email ID  
                        _mailmsg.From = new MailAddress(emailSender);

                        //Set To Email ID  
                        _mailmsg.To.Add("foojiaern1@gmail.com");

                        //Set Subject  
                        _mailmsg.Subject = subject;

                        //Set Body Text of Email   
                        _mailmsg.Body = MailText;


                        //Now set your SMTP   
                        SmtpClient _smtp = new SmtpClient();

                        //Set HOST server SMTP detail  
                        _smtp.Host = emailSenderHost;

                        //Set PORT number of SMTP  
                        _smtp.Port = emailSenderPort;

                        //Set SSL --> True / False  
                        _smtp.EnableSsl = emailIsSSL;

                        //Set Sender UserEmailID, Password  
                        NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
                        _smtp.Credentials = _network;

                        //Send Method will send your MailMessage create above.  
                        _smtp.Send(_mailmsg);
                    }
                    catch (SmtpException ex)
                    {
                        //lblMsg.Text = "Email failed to send!";
                        Console.WriteLine(ex.ToString());
                    }


                    //create new transaction before storing the order
                    SqlConnection con = new SqlConnection(conString);

                    string createTransacQuery =
                        "insert into [Transaction] (user_id, date_order, delivery_id, delivery_fees, card_num, payment_method, payment_amount, recv_name, recv_contactnum,recv_address)" +
                        " VALUES (@CustId, @DateOrder, @DeliveryID, @DeliveryFees, @CardNum, @PayMethod, @PayAmount, @Name, @ContactNum, @Address)";
                    SqlCommand cmd = new SqlCommand(createTransacQuery, con);
                    cmd.Parameters.AddWithValue("@CustId", Convert.ToInt32(Session["UserId"]));
                    cmd.Parameters.AddWithValue("@DateOrder", DateTime.Now);
                    cmd.Parameters.AddWithValue("@DeliveryID", ddlDeliveryMethod.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@DeliveryFees", lblDeliveryFee.Text);
                    cmd.Parameters.AddWithValue("@CardNum", txtCardNum.Text);
                    cmd.Parameters.AddWithValue("@PayMethod", rblCardType.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@PayAmount", lblTotalPrice.Text);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@ContactNum", txtContactNum.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    //insert orders into transaction

                    //read data from cart
                    con = new SqlConnection(conString);
                    string getCartItemsQuery =
                        "SELECT C.product_id as prod_id, C.quantity as cart_quantity, C.delivery_id as delivery_id, P.prod_stock as available_stock, P.prod_sales as prod_sales FROM CartItems AS C JOIN Product P on C.product_id = P.id where C.user_id = @CustId";
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
                        string insertOrdersQuery =
                            "insert into [Order] (product_id,quantity,delivery_id,order_status,transaction_id) VALUES (@ProdId, @Qty,@DeliverId,@OrderStatus,@TransacId)";
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
                        string updateProdStockQuery =
                            "update [Product] set prod_stock = @UpdatedAvailableQty, prod_sales = @UpdatedSales where id like @ProdId";
                        using (SqlCommand cmdSales = new SqlCommand(updateProdStockQuery, con))
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                                "alert('success update product info')", true);
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

                    //remove all from cart & minus the stock
                    clearCart();
                    //Response.Redirect("~/Sites/client/summaryReceipt.aspx");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Pay Successfully.')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please confirm you read the privacy and policy before proceed.')", true);
                }
                
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

                conn.Close();
            }
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
    }
}