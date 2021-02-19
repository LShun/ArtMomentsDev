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
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        //check is user is artist or buyer (buyer = 1, artist = 2)
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //check if there is any user log in when load this page
            if (Session["UserName"] == null)
            {
                Response.Redirect("LoginUser.aspx");
            }
            if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist1.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client1.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                
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
                //compare if the user input the correct current password
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
                //update the user new password
                sqlCon.Open();
                 String tbUserName = Session["UserName"].ToString();
                String query1 = "UPDATE [User] SET [user_password] = @NewPassword WHERE user_name = @UserName AND user_password = @Password";


                SqlCommand sqlCmd = new SqlCommand(query1, sqlCon);

                sqlCmd.Parameters.AddWithValue("@UserName", tbUserName);
                sqlCmd.Parameters.AddWithValue("@Password", tbPassword.Text);
                sqlCmd.Parameters.AddWithValue("@NewPassword", tbNewPassword.Text);
                sqlCmd.Parameters.AddWithValue("@NewConPassword", tbNewConPassword.Text);

                sqlCmd.ExecuteNonQuery();

                sqlCon.Close();
                Response.Redirect("AccountSetting.aspx");
            }
        }

        //direct user to Account when click on "My Account"
        protected void lbMyAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }

        //direct user to Setting when click on "Setting" to edit the personal info
        protected void lbSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountSetting.aspx");            
        }

        //direct user to presentation page when click on the "Presentation"  to edit bibliography and profile pic
        protected void lbPresentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountPresentation.aspx");
        }

        //allow user to log out and clear the session, then dircet to home page
        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../general/HomePage.aspx");
        }
    }
}