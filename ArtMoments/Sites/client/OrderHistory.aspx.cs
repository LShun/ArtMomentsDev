using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        string conString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (IsPostBack)
        //    {
        //        if (Session["CustId"] != null)
        //        {

        //            DataTable transacTable = getTransacTable();

        //            foreach (DataRow row in transacTable.Rows)
        //            {
        //                DataTable orderTable = getOrderTable();

        //                //update delivery details
        //                chkDispatchOrder(transacTable, orderTable);

        //                //display HTML
        //                displayInHTML(transacTable, orderTable);
        //            }



        //            // step 1) store row  of transaction
        //            // step 2) store row of order under transaction
        //            // step 3) display a row of transaction follows by all the orders
        //            // step 4) repeat step 3 till end

        //            /*
        //             CREATE TABLE [dbo].[Transaction] (
        //            [id]         INT  IDENTITY (1, 1) NOT NULL,
        //            [order_id]   INT  NULL,
        //            [user_id]    INT  NULL,
        //            [date_order] DATE NULL,

        //            CREATE TABLE [dbo].[Order] (
        //            [id]              INT           IDENTITY (1, 1) NOT NULL,
        //            [product_id]      INT           NULL,
        //            [quantity]        INT           NULL,
        //            [deliver_channel] NVARCHAR (50) NULL,
        //            [date_delivery]   DATE          NULL,
        //            [order_status]    NVARCHAR (20) NULL,
        //            [date_received]   DATE          NULL,
        //             */



        //            // combine order, transaction, and customer 
        //            //compare cust id and order id
        //        }    
        //    }
        //}
        //protected DataTable getTransacTable()
        //{
        //    SqlConnection conn = new SqlConnection(conString);
        //    conn.Open();

        //    string custTransacQuery = "select T.id,T.order_id,T.date_order as [transac-id] from Transaction T where T.id = @custId";
        //    SqlCommand cmd = new SqlCommand(custTransacQuery, conn);
        //    DataTable transacTable = new DataTable();
        //    SqlDataAdapter transacRecord = new SqlDataAdapter(cmd);
        //    transacRecord.Fill(transacTable);

        //    conn.Close();
        //    return transacTable;
        //}

        //protected DataTable getOrderTable()
        //{
        //    SqlConnection conn = new SqlConnection(conString);
        //    conn.Open();

        //    string transacOrderQuery = "select O.id, O.product_id, O.quantity, O.deliver_channel, O.date_delivery, O.status, O.date_received";
        //    SqlCommand cmd = new SqlCommand(transacOrderQuery, conn);
        //    DataTable orderTable = new DataTable();
        //    SqlDataAdapter orderRecord = new SqlDataAdapter(cmd);
        //    orderRecord.Fill(orderTable);

        //    conn.Close();
        //    return orderTable;
        //}

        //protected DataTable getOrderTable(int transactionId)
        //{
        //    SqlConnection conn = new SqlConnection(conString);
        //    conn.Open();
        //    // o.transaction_id = transactionId;
        //    string transacOrderQuery = "select O.id, O.product_id, O.quantity, O.deliver_channel, O.date_delivery, O.status, O.date_received where ";
        //    SqlCommand cmd = new SqlCommand(transacOrderQuery, conn);
        //    DataTable orderTable = new DataTable();
        //    SqlDataAdapter orderRecord = new SqlDataAdapter(cmd);
        //    orderRecord.Fill(orderTable);

        //    conn.Close();
        //    return orderTable;
        //}

        //protected void chkDispatchOrder(DataTable transacTable,DataTable orderTable)
        //{
        //    foreach (DataRow row in transacTable.Rows)
        //    {
        //        int rowCount = 0;
        //        SqlConnection conn = new SqlConnection(conString);
        //        conn.Open();
        //        DateTime todayDT = DateTime.Now;
        //        DateTime orderDT = transacTable.Rows[rowCount].Field<DateTime>(3);
        //        DateTime deliveredDT = transacTable.Rows[rowCount].Field<DateTime>(3).AddDays(8);
        //        DateTime dispatchDT = transacTable.Rows[rowCount].Field<DateTime>(3).AddDays(3);
        //        int transacId = transacTable.Rows[rowCount].Field<int>(0);
        //        int updateDeliveryInfo = 0;
        //        // if more than 8 days and null 2-> process 2 if null 1, process 1. if not null -> no need to process
        //        // if more than 3 days and null -> process 1 

        //        if (deliveredDT <= todayDT)
        //        {
        //            updateDeliveryInfo = 1;
        //            if(dispatchDT <= todayDT)
        //            {
        //                updateDeliveryInfo = 2;
        //                updateDeliveryStatus(orderTable, updateDeliveryInfo, orderDT, deliveredDT, dispatchDT);
        //                continue;
        //            }
        //            updateDeliveryStatus(orderTable, updateDeliveryInfo, orderDT, deliveredDT, dispatchDT);
        //        }
        //    }
        //}

        //protected void updateDeliveryStatus(DataTable orderTable, int delivery2Update, DateTime orderDT, DateTime deliveredDT, DateTime dispatchDT)
        //{
        //    foreach (DataRow row in orderTable.Rows)
        //    {
        //        int rowCount = 0;
        //        DateTime dbdeliveredDT = orderTable.Rows[rowCount].Field<DateTime>(4);
        //        DateTime dbdispatchDT = orderTable.Rows[rowCount].Field<DateTime>(6);

        //        if(dbdeliveredDT == null)
        //        {
        //            SqlConnection conn = new SqlConnection(conString);
        //            conn.Open();
        //            string updateDeliverDTQuery = "update Order set O.date_received = @deliveredDT where O.date_delivery = null";
        //            SqlCommand cmd = new SqlCommand(updateDeliverDTQuery, conn);
        //            cmd.Parameters.AddWithValue("@deliveredDT", orderDT.AddDays(3));
        //            cmd.Parameters.AddWithValue("@deliveredStat", "Dispatched");
        //            string updateDeliverStatQuery = "update Order set O.order_status = @deliveredStat where O.order_status in ('Pending')";
        //            cmd = new SqlCommand(updateDeliverStatQuery, conn);
        //            conn.Close();
        //        }
        //        if (dbdispatchDT == null && delivery2Update == 2)
        //        {
        //            SqlConnection conn = new SqlConnection(conString);
        //            conn.Open();
        //            string updateDeliverDTQuery = "update Order set O.date_received = @deliveredDT where O.date_received = null";
        //            SqlCommand cmd = new SqlCommand(updateDeliverDTQuery, conn);
        //            cmd.Parameters.AddWithValue("@deliveredDT", orderDT.AddDays(8));
        //            cmd.Parameters.AddWithValue("@deliveredStat", "Delivered");
        //            string updateDeliverStatQuery = "update Order set O.order_status = @deliveredStat where O.order_status in ('Pending','Dispatched')";
        //            cmd = new SqlCommand(updateDeliverStatQuery, conn);
        //            conn.Close();
        //        }
        //       rowCount++;
        //    }
        //    //if date > 8 days : update to delivered


        //        // if date > 5 days : update to dispatched 

        //}

        //protected void displayInHTML(DataTable transacTable, DataTable orderTable)
        //{
        //    StringBuilder html = new StringBuilder();
        //    html.Append("<table border = '1'>");
        //}

    }
}