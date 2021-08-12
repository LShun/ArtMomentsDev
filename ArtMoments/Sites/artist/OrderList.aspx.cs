using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Configuration;
using System.Text;

namespace ArtMoments.Sites.artist
{
    public partial class OrderList : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void orderList_RowDataBound(object sender,
        GridViewRowEventArgs e)
        {
            foreach (GridViewRow row in orderList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    Button btn = row.FindControl("btnStatus") as Button;
                    String b = row.Cells[8].Text;
                    if (b == "Pending")
                    {
                        btn.Enabled = true;
                        btn.Text = "Accept";
                    }
                    else if(b == "Accepted")
                    {
                        btn.Enabled = true;
                        btn.Text = "Dispatched";
                    }
                    else if(b == "Dispatched")
                    {
                        btn.Enabled = false;
                        btn.Text = "Waiting for delivered";
                    }else if(b == "Delivered")
                    {
                        btn.Enabled = false;
                        btn.Text = "Completed";
                    }

                }

            }
        }


        protected void orderList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "handleStatus")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = orderList.Rows[rowIndex];

                //Fetch value of Name.
                String b = row.Cells[8].Text;

                if(b == "Pending")
                {
                    String orderId = row.Cells[0].Text;
                    acceptRequest(orderId);
                    Response.Redirect("OrderList.aspx");
                }
                else if(b == "Accepted")
                {
                    String orderId = row.Cells[0].Text;
                    dispatchArt(orderId);
                    Response.Redirect("OrderList.aspx");
                }
            }
        }

        void acceptRequest(String orderId)
        {            
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            string updateDeliverDTQuery =
                @"update [Order] set order_status = @OrderStatus where @TransacId like id";
            using (SqlCommand cmd = new SqlCommand(updateDeliverDTQuery, conn))
            {
                cmd.Parameters.AddWithValue("@TransacId", orderId);
                cmd.Parameters.AddWithValue("@OrderStatus", "Accepted");
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        void dispatchArt(String orderId)
        {
            DateTime todayDT = DateTime.Now;
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            string updateDeliverDTQuery =
                @"update [Order] set date_delivery = @DispatchDT, order_status = @OrderStatus where @TransacId like id";
            using (SqlCommand cmd = new SqlCommand(updateDeliverDTQuery, conn))
            {
                cmd.Parameters.AddWithValue("@DispatchDT", todayDT);
                cmd.Parameters.AddWithValue("@TransacId", orderId);
                cmd.Parameters.AddWithValue("@OrderStatus", "Dispatched");
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}