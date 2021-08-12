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
        }

        protected void HistoryListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
               Button btn= e.Item.FindControl("btnBuyAgain") as Button;
                string b = (e.Item.FindControl("lblOrderStatus") as Label).Text;
                if (b == "Pending")
                {
                    btn.Enabled = false;
                    btn.Text = "Pending";
                }
                else if (b == "Accepted")
                {
                    btn.Enabled = false;
                    btn.Text = "Accepted";
                }
                else if (b == "Dispatched")
                {
                    btn.Enabled = true;
                    btn.Text = "Delivered";
                }
                else if (b == "Delivered")
                {
                    btn.Enabled = false;
                    btn.Text = "Completed";
                }
            }
        }


        // go to the order art page of particular item when usr click on the img
        protected void viewProdImg(object sender, EventArgs e)
        {
            ImageButton clickImgItem = sender as ImageButton;
            string prodId = (clickImgItem.FindControl("lblProdId") as Label).Text;
            Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + prodId);
        }

        // go to the order art page of particular item when usr click on the buy again button
        protected void viewProdBtn(object sender, EventArgs e)
        {
            Button clickBtnItem = sender as Button;
            //string prodId = (clickBtnItem.FindControl("lblProdId") as Label).Text;
            //Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + prodId);
            string orderId = (clickBtnItem.FindControl("lblOrderId") as Label).Text;
            string prodStatus = (clickBtnItem.FindControl("lblOrderStatus") as Label).Text;

            if (prodStatus == "Dispatched")
            {
                clickBtnItem.Text = "Delivered";
                updateDelivery(orderId);
                Response.Redirect("OrderHistoryExtra.aspx");
            }


        }

        void updateDelivery(String orderId)
        {
            DateTime todayDT = DateTime.Now;
            SqlConnection conn = new SqlConnection(conString);
            conn.Open();
            string updateDeliverDTQuery =
                @"update [Order] set date_delivery = @DispatchDT, order_status = @OrderStatus where @TransacId like id";
            using (SqlCommand cmd = new SqlCommand(updateDeliverDTQuery, conn))
            {
                cmd.Parameters.AddWithValue("@DispatchDT", todayDT);
                cmd.Parameters.AddWithValue("@TransacId", orderId);
                cmd.Parameters.AddWithValue("@OrderStatus", "Delivered");
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}