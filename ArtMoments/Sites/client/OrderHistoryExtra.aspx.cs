using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class OrderHistoryExtra : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                DataTable transacTable = getTransacTable();
                int transacRow = 0;
                foreach (DataRow row in transacTable.Rows)
                {
                    int TransacId = row.Field<int>("transac-id");
                    DateTime TransacDate = row.Field<DateTime>("order-date");


                    DataTable orderTable = getOrderTable(TransacId);

                    //update delivery details
                    chkDispatchOrder(orderTable, TransacDate, TransacId);

                    transacRow++;
                }
            }
        }

        protected DataTable getTransacTable()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("select id as [transac-id], user_id as [user-id], date_order as [order-date] from [Transaction] where user_id like @CustId ORDER BY [order-date] DESC"))
                {
                    cmd.Parameters.AddWithValue("@CustId", (String)Session["UserName"].ToString());
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

        protected DataTable getOrderTable(int TransacId)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("select id as [order-id], product_id as [prod-id], quantity as [order-qty], delivery_id as [order-deliverId], date_delivery as [order-deliverDate], order_status as [order-status], date_received as [order-dateReceive], O.transaction_id as [transac-id] from [Order] O where O.transaction_id like @TransacId"))
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

        protected void chkDispatchOrder(DataTable orderTable, DateTime TransacDate, int TransacId)
        {
            int rowCount = 0;
            foreach (DataRow row in orderTable.Rows)
            {
                DateTime todayDT = DateTime.Now;
                DateTime orderDT = TransacDate;
                //DateTime orderDT = transacTable.Rows[rowCount].Field<DateTime>(3);
                DateTime deliveredDT = orderDT.AddDays(8);
                DateTime dispatchDT = orderDT.AddDays(3);
                int updateDeliveryInfo = 0;
                // if more than 8 days and null 2-> process 2 if null 1, process 1. if not null -> no need to process
                // if more than 3 days and null -> process 1 

                if (dispatchDT <= todayDT)
                {
                    updateDeliveryInfo = 1;
                    if (deliveredDT <= todayDT)
                    {
                        updateDeliveryInfo = 2;
                    }
                    updateDeliveryStatus(orderTable, updateDeliveryInfo, dispatchDT, deliveredDT, TransacId);
                }
                rowCount++;
            }
        }

        protected void updateDeliveryStatus(DataTable orderTable, int delivery2Update, DateTime dispatchDT, DateTime deliveredDT, int TransacId)
        {
            int rowCount = 0;
            foreach (DataRow row in orderTable.Rows)
            {
                DateTime? dbdeliveredDT = row.Field<DateTime?>("order-deliverDate");
                DateTime? dbdispatchDT = row.Field<DateTime?>("order-dateReceive");

                if (!dbdeliveredDT.HasValue && delivery2Update == 1)
                {
                    SqlConnection conn = new SqlConnection(conString);
                    conn.Open();
                    string updateDeliverDTQuery = @"update [Order] set date_delivery = @DispatchDT, order_status = @OrderStatus where date_delivery IS NULL and @TransacId like transaction_id";
                    using (SqlCommand cmd = new SqlCommand(updateDeliverDTQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@TransacId", TransacId);
                        cmd.Parameters.AddWithValue("@DispatchDT", dispatchDT);
                        cmd.Parameters.AddWithValue("@OrderStatus", "Dispatched");
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
                if (!dbdispatchDT.HasValue && delivery2Update == 2)
                {
                    SqlConnection conn = new SqlConnection(conString);
                    conn.Open();
                    string updateReceivedDTQuery = @"update [Order] set date_received = @deliveredDT, order_status = @OrderStatus where date_received IS NULL and @TransacId like transaction_id";
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

        protected void viewProdImg(object sender, EventArgs e)
        {
            ImageButton clickImgItem = sender as ImageButton;
            string prodId = (clickImgItem.FindControl("lblProdId") as Label).Text;
            Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + prodId);
        }

        protected void viewProdBtn(object sender, EventArgs e)
        {
            Button clickBtnItem = sender as Button;
            string prodId = (clickBtnItem.FindControl("lblProdId") as Label).Text;
            Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + prodId);
        }

    }


}