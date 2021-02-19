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

    public partial class SignUp : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }          

        //insert the user data into user database
        protected void btnCreateAcc_Click(object sender, EventArgs e)
        {
            //check if user name and password is entered
            if (txtUserName.Text == "" || txtUserPassword.Text == "")
            {
                lblMessage.Text = "Please Fill Mandatory Fields";
            }
            else if (txtUserPassword.Text != txtConfirmedPassword.Text)
            {
                //check is password and confirmed password match
                lblMessage.Text = "Password do not match";
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    //make sure no replicated username
                    String query = "SELECT COUNT(*) FROM [USER] WHERE user_name = @username";
                    conn.Open();

                    SqlCommand sqlCmd = new SqlCommand(query, conn);
                    sqlCmd.Connection = conn;

                    sqlCmd.CommandText = query;
                    sqlCmd.Parameters.Clear();
                    sqlCmd.Parameters.AddWithValue("@username", txtUserName.Text);
                    int numRecords = (int)sqlCmd.ExecuteScalar();
                    conn.Close();

                    if (numRecords == 0)
                    {
                        using (SqlConnection sqlCon = new SqlConnection(connectionString))
                        {
                            sqlCon.Open();
                            //int tempID = GenerateAutoID();

                            int userType = 0;
                            if (rblGender.SelectedValue.Equals("Buyer"))
                            {
                                //if register as buyer then userType is 1
                                userType = 1;
                            }
                            else
                            {
                                //if register as artist then userType is 2
                                userType = 2;
                            }


                            String query1 = "INSERT INTO [User] (user_name, user_password, user_email, user_type)"
                                + "VALUES (@UserName, @UserPassword, @UserEmail, @UserType)";

                            SqlCommand sqlCmd2 = new SqlCommand(query1, sqlCon);
                            sqlCmd2.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                            sqlCmd2.Parameters.AddWithValue("@UserEmail", txtUserEmail.Text.Trim());
                            sqlCmd2.Parameters.AddWithValue("@UserPassword", txtUserPassword.Text.Trim());
                            sqlCmd2.Parameters.AddWithValue("@UserType", userType.ToString());

                            sqlCmd2.ExecuteNonQuery();
                            Clear();
                            lblMessage.Text = "Submitted Successfully";
                            Response.Redirect("ConfirmedRegMsg.aspx");
                        }
                    }
                    else
                    {
                        lblMessage.Text = "This user name already exists";
                    }
                    conn.Close();
                }

            }
        }
        //clear function
        void Clear()
        {
            txtUserEmail.Text = txtUserName.Text = txtUserPassword.Text = txtConfirmedPassword.Text = "";
            lblMessage.Text = lblMessage.Text = "";
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
    
}
