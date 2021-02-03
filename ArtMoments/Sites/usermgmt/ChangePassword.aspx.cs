using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace ArtMoments.Sites.usermgmt
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        string connectionString = "Data Source=LAPTOP-RF7VE486\\SQLEXPRESSFJE;Initial Catalog=ArtMomentsDb; Integrated Security=True; User ID=sa;Password=***********";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("PreLogin.html");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                String tbUserName = Session["UserName"].ToString();
                String query = "SELECT * FROM [User] WHERE user_name = @UserName";
                SqlCommand cmd = new SqlCommand(query, sqlCon);

                cmd.Parameters.AddWithValue("@UserName", tbUserName);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        String tempPassword = dr.GetValue(3).ToString();
                    }
                }
                sqlCon.Close();
            }

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                //String query1 = "UPDATE [dboAMUserData] SET [UserPassword] = @NewPassword, [UserConfirmedPassword] = @NewConPassword " +
                //    "WHERE (SELECT UserPassword FROM  dboAMUserData  WHERE UserName = @UserName AND UserPassword= @Password)";
                String tbUserName = Session["UserName"].ToString();
                String query1 = "UPDATE [User] SET [user_password] = @NewPassword" +
                   "WHERE user_name = @UserName AND user_password = @Password";


                SqlCommand sqlCmd = new SqlCommand(query1, sqlCon);

                sqlCmd.Parameters.AddWithValue("@UserName", tbUserName);
                sqlCmd.Parameters.AddWithValue("@Password", tbPassword.Text);
                sqlCmd.Parameters.AddWithValue("@NewPassword", tbNewPassword.Text);
                sqlCmd.Parameters.AddWithValue("@NewConPassword", tbNewConPassword.Text);

                sqlCmd.ExecuteNonQuery();
                lblSuccessMessage.Text = "Changed to new password successfully";
                //RedirectAfterDelayFn();
                sqlCon.Close();
                Response.Redirect("BuyerSetting.aspx");
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}