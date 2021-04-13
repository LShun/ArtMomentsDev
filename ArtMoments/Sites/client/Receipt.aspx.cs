using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace ArtMoments.Sites.client
{
    public partial class Receipt : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT top 1 id, date_order, delivery_fees, recv_name, recv_address FROM [Transaction] WHERE user_id = " + Session["UserId"].ToString() + "order by id desc"))
                //using (SqlCommand cmd = new SqlCommand("SELECT top 1 id, date_order, delivery_fees, recv_name, recv_address FROM [Transaction] WHERE user_id = 3 order by id desc"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {

                        sdr.Read();
                        lblOrderDate.Text = sdr["date_order"].ToString();
                        lblName.Text = sdr["recv_name"].ToString();
                        lblShippingAddr.Text = sdr["recv_address"].ToString();
                        string transactionId = sdr["id"].ToString();
                        lblOrderID.Text = transactionId;
                    }

                    con.Close();
                }


            }

            Double total = 0;
            Double deliveryFee = 0;
            foreach (GridViewRow row in itemList.Rows)
            {
                Label subtotal = (Label)row.FindControl("SubTotal");
                total += Convert.ToDouble(subtotal.Text.ToString());
            }

            Label deliveryFeefromDB = (Label)delieryFeeDetailView.FindControl("delivery_fees");
            deliveryFee = Convert.ToDouble(deliveryFeefromDB.Text.ToString());
            total += deliveryFee;
            lblTotal.Text = total.ToString("F");
        }

        protected void itemList_RowCommand(object sender, GridViewCommandEventArgs e)
        {


        }
    }
}