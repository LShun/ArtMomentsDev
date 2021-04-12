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
                                delivery_fees = Double.Parse(lblDeliveryFee.Text);
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
                if (rblCardType.SelectedValue == "Visa Card")
                {
                    revCardNum.ValidationExpression = "^([4]\\d{3}-)(\\d{4}-){2}\\d{4}$|^([4]\\d{3} )(\\d{4} ){2}\\d{4}$|^[4]\\d{15}$";
                }
                else if (rblCardType.SelectedValue == "Master Card")
                {
                    revCardNum.ValidationExpression = "^([5]\\d{3}-)(\\d{4}-){2}\\d{4}$|^([5]\\d{3} )(\\d{4} ){2}\\d{4}$|^[5]\\d{15}$";
                }

                
            }
        }

        protected void checkCardExpiration(object sender, ServerValidateEventArgs e)
        {
            if (txtExpYr.Text.Equals(DateTime.Now.Year.ToString()))
            {
                if (int.Parse(txtExpYr.Text) >= DateTime.Now.Month)
                {
                    txtExpYr.Text = "";
                    txtExpMth.Text = "";
                    e.IsValid = false;
                }
            }

            e.IsValid = true;
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
                        //sda.SelectCommand.Parameters.AddWithValue("@CustId", Session["UserId"]);
                        sda.SelectCommand.Parameters.AddWithValue("@CustId", "1");
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

            string sqlCmd = "SELECT DISTINCT [deliver_type], [deliver_fees] FROM [Delivery] ORDER BY [deliver_type]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (ddlDeliveryMethod.SelectedItem.Value.Equals((string)dr["deliver_type"]))
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
    }
}