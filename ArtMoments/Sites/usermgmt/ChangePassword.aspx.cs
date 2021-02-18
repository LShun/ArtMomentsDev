using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace ArtMoments.Sites.usermgmt
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        //string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("PreLogin.aspx");
                }
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

        protected void btnSave_Click(object sender, EventArgs e)
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
                //lblSuccessMessage.Text = "Changed to new password successfully";
                //RedirectAfterDelayFn();
                sqlCon.Close();
                Response.Redirect("BuyerSetting.aspx");
            }
        }

        protected void lbMyAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerAccount.aspx");
        }

        protected void lbSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerSettingExtra.aspx");            
        }

        protected void lbPresentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerPresentation.aspx");
        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../general/HomePage.aspx");
        }
    }
}