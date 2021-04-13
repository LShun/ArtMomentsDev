using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class clientReceipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("../usermgmt/PreLogin.aspx");
                }

            }

            //SqlDataSource2.SelectParameters[0].DefaultValue = transacId.Text.ToString();

            //SqlDataSource3.SelectParameters[0].DefaultValue = transacId.Text.ToString();
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Label transacId = (Label)TransactionIDDetailView.FindControl("jelly");
            SqlDataSource2.SelectParameters.Add("@id", transacId.Text.ToString());
            SqlDataSource3.SelectParameters.Add("@id", transacId.Text.ToString());
            calcTotal();
        }

        protected void calcTotal()
        {
            Double total = 0;
            Double deliveryFee = 0;
            foreach(GridViewRow row in GridView1.Rows)
            {
                Label subtotal = (Label)row.FindControl("subtotal");
                total += Convert.ToDouble(subtotal.Text.ToString());
            }

            Label deliveryFeefromDB = (Label)delieryFeeDetailView.FindControl("");
            deliveryFee = Convert.ToDouble(deliveryFeefromDB.Text.ToString());
            total += deliveryFee;
            lblTotal.Text = total.ToString("F");
        }
    }
}