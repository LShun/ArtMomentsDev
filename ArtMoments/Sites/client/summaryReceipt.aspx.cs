using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class clientReceipt : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("../usermgmt/PreLogin.aspx");
                }
                else
                {

                    for (int i = 0; i < TransactionIDDetailView.Rows.Count; i++)
                    {
                        if ((Label)TransactionIDDetailView.Rows[i].FindControl("id") != null)
                        {
                            Label transacId = (Label)TransactionIDDetailView.Rows[i].FindControl("id");
                            SqlDataSource2.SelectParameters.Add("id", transacId.Text.ToString());
                            SqlDataSource3.SelectParameters.Add("id", transacId.Text.ToString());
                            break;
                        }
                    }

                    calcTotal();
                    //using (SqlConnection con = new SqlConnection(conString))
                    //{
                    //    SqlCommand command = new SqlCommand("SELECT TOP 1 id, date_order, payment_method, user_id FROM [Transaction] as t WHERE user_id = @UserId ORDER BY id DESC",con);
                    //    cmd.Parameters.AddWithValue("@CustId", (String) Session["UserId"].ToString());
                    //    SqlDataAdapter adapter = new SqlDataAdapter(command); 
                    //    DataTable dtTransaction = new DataTable();
                    //    adapter.Fill(dtTransaction);

                    //    TransactionIDDetailView.DataSource = dtTransaction;

                    //    TransactionIDDetailView.DataBind();
                    //}


                //SqlDataSource2.SelectParameters[0].DefaultValue = transacId.Text.ToString();

                //SqlDataSource3.SelectParameters[0].DefaultValue = transacId.Text.ToString();
                }

            }
        }
        protected void calcTotal()
        {
            Double total = 0;
            Double deliveryFee = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                Label subtotal = (Label)row.FindControl("subtotal");
                total += Convert.ToDouble(subtotal.Text.ToString());
            }

            for (int i = 0; i < delieryFeeDetailView.Rows.Count; i++)
            {
                if ((Label)delieryFeeDetailView.Rows[i].FindControl("delivery_fees") != null)
                {
                    Label deliveryFeefromDB = (Label)delieryFeeDetailView.FindControl("delivery_fees");
                    deliveryFee = Convert.ToDouble(deliveryFeefromDB.Text.ToString());
                    total += deliveryFee;
                    lblTotal.Text = total.ToString("F");
                    break;
                }
            }
        }
    }
}