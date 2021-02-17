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
            Session["UserName"] = 1;
            Session["TransacId"] = 1;
            if (!IsPostBack)
            {
                
                DataTable transactionBrief = this.GetData("SELECT [id], [user_id] FROM [Transaction] WHERE ([user_id] = @UserName) ORDER BY date_order DESC ");


                foreach (DataRow row in transactionBrief.Rows)
                {
                    Session["TransacId"] = row.Field<Int32>("id");
                    lblTransacId.Text = Session["TransacId"].ToString();
                    DataTable transactionDetail = this.GetData("SELECT O.id AS order_id, P.prod_name, P.prod_size, P.prod_image, P.prod_price, A.user_name, C.category_name, O.quantity, O.order_status, (O.quantity*P.prod_price) as subtotal FROM[Order] AS O INNER JOIN Product AS P ON P.id = O.product_id INNER JOIN [User] AS A ON A.id = P.user_id INNER JOIN Product_Category AS C ON C.id = P.category_id WHERE O.transaction_id = @TransacId");
                    ListViewTransactionDetails.DataSourceID = null;
                    ListViewTransactionDetails.DataSource = transactionDetail;
                    ListViewTransactionDetails.DataBind();
                    Double total = 0;
                    foreach (DataRow rows in transactionDetail.Rows)
                    {
                        total += rows.Field<Double>("subtotal");
                    }

                }

            }

        }

        private DataTable GetData(string query)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@UserName", Session["UserName"]);
                        sda.SelectCommand.Parameters.AddWithValue("@TransacId", Session["TransacId"]);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

    }
}