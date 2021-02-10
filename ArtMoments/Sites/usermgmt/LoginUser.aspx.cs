using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;
using System.Windows;

namespace ArtMoments.Sites.usermgmt
{
    public partial class LoginUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorLoginMsg.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                String query = "SELECT COUNT(1) FROM [User] WHERE user_name =@UserName AND user_password =@UserPassword";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                sqlCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@UserPassword", txtUserPassword.Text.Trim());
                int count = 0;
                count = Convert.ToInt16(sqlCmd.ExecuteScalar());
                //var result = sqlCmd.ExecuteScalar();
                //int count = result != null ? int.Parse(result) : 0;

                if (count == 1)
                {
                    Session["UserName"] = txtUserName.Text.Trim();  //session is created for each user
                    Response.Redirect("BuyerSetting.aspx");
                }
                else
                {
                    lblErrorLoginMsg.Visible = true;
                }
            }
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtUserPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}