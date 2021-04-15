using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;
using System.Windows;
using System.Configuration;

namespace ArtMoments.Sites.usermgmt
{
    public partial class LoginUser : System.Web.UI.Page
    {
        //string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        string connectionString =
            ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorLoginMsg.Visible = false;
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
        }

        protected void txtUserPassword_TextChanged(object sender, EventArgs e)
        {
        }

        //validate the username and password entered
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                String query =
                    "SELECT COUNT(1) FROM [User] WHERE user_name =@UserName AND user_password =@UserPassword";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                sqlCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@UserPassword", txtUserPassword.Text.Trim());
                int count = 0;
                count = Convert.ToInt16(sqlCmd.ExecuteScalar());

                sqlCon.Close();

                if (count == 1)
                {
                    Session["UserName"] = txtUserName.Text.Trim(); //session is created for each user

                    //get user_type
                    using (SqlConnection sqlConn = new SqlConnection(connectionString))
                    {
                        sqlConn.Open();
                        String query1 = "SELECT user_type FROM [User] WHERE user_name = @UserName";
                        SqlCommand sql2 = new SqlCommand(query1, sqlConn);

                        sql2.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());

                        SqlDataReader dr = sql2.ExecuteReader();
                        String userType = "";

                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                userType = dr["user_type"].ToString();
                            }
                        }

                        Session["UserType"] = userType; //session is created for each user
                        sqlConn.Close();

                        sqlConn.Open();
                        String getIdQuery = "SELECT id FROM [User] WHERE user_name = @UserName";
                        SqlCommand cmdGetId = new SqlCommand(getIdQuery, sqlConn);

                        cmdGetId.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());

                        int userId = 0;

                        if (cmdGetId.ExecuteScalar() != null)
                        {
                            userId = Convert.ToInt32(cmdGetId.ExecuteScalar());
                        }

                        Session["UserId"] = userId; //session is created for each user


                        sqlConn.Close();


                        // For update delivery & order details
                        // retrieve all transaction details from buyer
                        DataTable transacTable = getTransacTable();
                        int transacRow = 0;
                        // retrieve all the order under particular transaction
                        foreach (DataRow row in transacTable.Rows)
                        {
                            int TransacId = row.Field<int>("transac-id");
                            DateTime TransacDate = row.Field<DateTime>("order-date");
                            // retrieve particular transaction's order
                            DataTable orderTable = getOrderTable(TransacId);

                            // check and update delivery details
                            chkDispatchOrder(orderTable, TransacDate, TransacId);

                            transacRow++;
                        }
                    }

                    //direct to user account if successfully login
                    HttpCookie myCookie = new HttpCookie("username", txtUserName.Text.Trim());
                    Response.Cookies.Add(myCookie);
                    myCookie.Expires = DateTime.Now.AddDays(7);
                    Response.Redirect("Account.aspx");
                }
                else
                {
                    lblErrorLoginMsg.Visible = true;
                }
            }
        }

        // retrieve all transaction of buyer and store it in a datatable
        protected DataTable getTransacTable()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd =
                    new SqlCommand(
                        "select id as [transac-id], user_id as [user-id], date_order as [order-date] from [Transaction]")
                )
                {
                    cmd.Parameters.AddWithValue("@CustId", (String) Session["UserId"].ToString());
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable custTransac = new DataTable())
                        {
                            sda.Fill(custTransac);

                            return custTransac;
                        }
                    }
                }
            }
        }

        // retrieve all orders under particular transaction of buyer and store it in a datatable
        protected DataTable getOrderTable(int TransacId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(
                    "select id as [order-id], product_id as [prod-id], quantity as [order-qty], delivery_id as [order-deliverId], date_delivery as [order-deliverDate], order_status as [order-status], date_received as [order-dateReceive], O.transaction_id as [transac-id] from [Order] O where O.transaction_id like @TransacId")
                )
                {
                    cmd.Parameters.AddWithValue("@TransacId", TransacId);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable custOrder = new DataTable())
                        {
                            sda.Fill(custOrder);
                            return custOrder;
                        }
                    }
                }
            }
        }

        // calculate and check the order date whether it reached the date for dispatched or delivered
        protected void chkDispatchOrder(DataTable orderTable, DateTime TransacDate, int TransacId)
        {
            int rowCount = 0;
            foreach (DataRow row in orderTable.Rows)
            {
                DateTime todayDT = DateTime.Now;
                DateTime orderDT = TransacDate;

                DateTime deliveredDT = orderDT.AddDays(8); // more or equal 8 days = delivered
                DateTime dispatchDT = orderDT.AddDays(3); // more or equal 3 days = dispatched
                int updateDeliveryInfo = 0;
                // if more than 8 days and null 2-> process 2 if null 1, process 1. if not null -> no need to process
                // if more than 3 days and null -> process 1 

                if (dispatchDT <= todayDT)
                {
                    updateDeliveryInfo = 1; // 1 = chg to dispatch
                    if (deliveredDT <= todayDT)
                    {
                        updateDeliveryInfo = 2; // 2 = chg to delivered
                    }

                    updateDeliveryStatus(orderTable, updateDeliveryInfo, dispatchDT, deliveredDT, TransacId);
                }

                rowCount++;
            }
        }

        // update delivery status & delivery date & date received
        protected void updateDeliveryStatus(DataTable orderTable, int delivery2Update, DateTime dispatchDT,
            DateTime deliveredDT, int TransacId)
        {
            int rowCount = 0;
            foreach (DataRow row in orderTable.Rows)
            {
                DateTime? dbdeliveredDT = row.Field<DateTime?>("order-deliverDate");
                DateTime? dbdispatchDT = row.Field<DateTime?>("order-dateReceive");

                // only more or equal 3 days -> update delivery status to dispatched & update date of delivery
                if (!dbdeliveredDT.HasValue && delivery2Update >= 1)
                {
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    string updateDeliverDTQuery =
                        @"update [Order] set date_delivery = @DispatchDT, order_status = @OrderStatus where date_delivery IS NULL and @TransacId like transaction_id";
                    using (SqlCommand cmd = new SqlCommand(updateDeliverDTQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@TransacId", TransacId);
                        cmd.Parameters.AddWithValue("@DispatchDT", dispatchDT);
                        cmd.Parameters.AddWithValue("@OrderStatus", "Dispatched");
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                // more or equal 8 days -> update delivery status to delivered & update delivered date
                if (!dbdispatchDT.HasValue && delivery2Update == 2)
                {
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    string updateReceivedDTQuery =
                        @"update [Order] set date_received = @deliveredDT, order_status = @OrderStatus where date_received IS NULL and @TransacId like transaction_id";
                    using (SqlCommand cmd = new SqlCommand(updateReceivedDTQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@TransacId", TransacId);
                        cmd.Parameters.AddWithValue("@deliveredDT", deliveredDT);
                        cmd.Parameters.AddWithValue("@OrderStatus", "Delivered");
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                if (dbdeliveredDT.HasValue && dbdispatchDT.HasValue)
                {
                    break;
                }

                rowCount++;
            }
        }
    }
}