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
    public partial class SignUp : System.Web.UI.Page
    {
        string connectionString = "Data Source=LAPTOP-RF7VE486\\SQLEXPRESSFJE;Initial Catalog=ArtMomentsDb; Integrated Security=True; User ID=sa;Password=***********";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();

                if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int userID = Convert.ToInt32(Request.QueryString["id"]);
                    
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("UserViewByID", sqlCon);
                        sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                        sqlDa.SelectCommand.Parameters.AddWithValue("@UserID", userID);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);

                        txtUserName.Text = dtbl.Rows[0][1].ToString();
                        txtUserPassword.Text = dtbl.Rows[0][2].ToString();
                        txtConfirmedPassword.Attributes.Add("value", dtbl.Rows[0][2].ToString());
                        txtUserEmail.Text = dtbl.Rows[0][3].ToString();
                    }
                }
            }
        }          

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text == "" || txtUserPassword.Text == "")
            {
                lblMessage.Text = "Please Fill Mandatory Fields";
            }
            else if (txtUserPassword.Text != txtConfirmedPassword.Text)
            {
                lblMessage.Text = "Password do not match";
            }
            else
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    //int tempID = GenerateAutoID();
                    int userType = 0;
                    if (rbGender.SelectedValue.Equals("Buyer"))
                    {
                        userType = 0;
                    }
                    else
                    {
                        userType = 1;
                    }

                    
                    String query1 = "INSERT INTO [User] (user_name, user_password, user_email, user_type)"
                        + "VALUES (@UserName, @UserPassword, @UserEmail, @UserType)";

                    SqlCommand sqlCmd = new SqlCommand(query1, sqlCon);
                    //sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserEmail", txtUserEmail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserPassword", txtUserPassword.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserType", userType.ToString());

                    sqlCmd.ExecuteNonQuery();
                    Clear();
                    lblMessage.Text = "Submitted Successfully";
                    Response.Redirect("ConfirmedRegMsg.aspx");
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
