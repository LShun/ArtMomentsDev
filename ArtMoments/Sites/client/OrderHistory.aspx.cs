using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        string conString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //SqlConnection conn = new SqlConnection(conString);
                //conn.Open();
                //string getCustIdQuery = "select cust.id as [cust-id] from User cust where @custUserName like cust.user_name";
                //SqlCommand cmd = new SqlCommand(getCustIdQuery, conn);

                //DataTable dt = new DataTable();
                //SqlDataAdapter sda = new SqlDataAdapter(cmd);
                //sda.Fill(dt);
                //Session["CustId"] = dt;
                ////compare cust id and order id
                //string custOrder = "select O.id as [order-id], P.prod_name as [prod-name], P.prod_size [prod-size], P.prod_description as [prod-descrip], P.prod_image as [prod-image], P.prod_price as [prod-price] , O.quantity as [order-quantity] from Order O, Product P where custId = O.id";
                //cmd = new SqlCommand(custOrder, conn);
                //int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                //if (temp == 1)
                //{
                //    Response.Write("Successful");
                //}
                //conn.Close();
            }
        }

    }
}