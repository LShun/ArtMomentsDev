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
using System.Configuration;

namespace ArtMoments.Sites.usermgmt
{
    public partial class LoginUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorLoginMsg.Visible = false;
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtUserPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
            string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                String query = "SELECT COUNT(1) FROM [User] WHERE user_name =@UserName AND user_password =@UserPassword";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                sqlCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@UserPassword", txtUserPassword.Text.Trim());
                int count = 0;
                count = Convert.ToInt16(sqlCmd.ExecuteScalar());

                sqlCon.Close();

                if (count == 1)
                {
                    Session["UserName"] = txtUserName.Text.Trim();  //session is created for each user

                    //get user_type
                    using (SqlConnection sqlConn = new SqlConnection(connectionString))
                    {
                        sqlConn.Open();
                        String query1 = "SELECT user_type FROM [User] WHERE user_name = @UserName";
                        SqlCommand sql2 = new SqlCommand(query1, sqlConn);

                        sql2.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());

                        SqlDataReader dr = sql2.ExecuteReader();
                        String userType = "";

                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                userType = dr["user_type"].ToString();
                            }
                        }
                        Session["UserType"] = userType;  //session is created for each user
                        sqlConn.Close();
                    }

                    Response.Redirect("BuyerSettingExtra.aspx");
                }
                else
                {
                    lblErrorLoginMsg.Visible = true;
                }
                
            }
        }
    }
}