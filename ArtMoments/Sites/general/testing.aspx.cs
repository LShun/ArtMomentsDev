using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.general
{
    public partial class testing : System.Web.UI.Page
    {
        string conString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        protected void BindGrid()
        {
            Session["UserName"] = "John";
            Session["ProdName"] = "Night scene";
            if (Session["UserName"] != null && Session["ProdName"]!= null)
            {
                //still need get selected ID from display
                using (SqlConnection con = new SqlConnection(conString))
                {
                    using (SqlCommand cmd = new SqlCommand("select U.id as CustomerID from [User] U where U.user_name like @custUserName"))
                    {
                        cmd.Parameters.AddWithValue("@custUserName", (String)Session["UserName"]);
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                
                                foreach(DataRow dr in dt.Rows)
                                {
                                    Label1.Text += dt.Rows[0]["CustomerID"].ToString();
                                    Session["CustId"] = dt.Rows[0]["CustomerID"].ToString();
                                }
                            }
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand("select Prod.id as ProdID from [Product] Prod where Prod.prod_name like @prodName"))
                    {
                        cmd.Parameters.AddWithValue("@prodName", (String)Session["ProdName"]);
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);

                                foreach (DataRow dr in dt.Rows)
                                {
                                    Label2.Text += dt.Rows[0]["ProdID"].ToString();
                                    Session["ProdId"] = dt.Rows[0]["ProdID"].ToString();
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}