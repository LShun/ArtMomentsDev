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
        String connectionString = @"Data Source =(local)\SQLEXPRESSFJE;
                    initial Catalog=artMomentDB; Integrated Security = True;";
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

                        hfUserID.Value = userID.ToString();
                        txtUserName.Text = dtbl.Rows[0][1].ToString();
                        txtPassword.Text = dtbl.Rows[0][2].ToString();
                        txtPassword.Attributes.Add("value", dtbl.Rows[0][2].ToString());
                        txtConfirmPassword.Text = dtbl.Rows[0][3].ToString();
                        txtConfirmPassword.Attributes.Add("value", dtbl.Rows[0][3].ToString());
                        txtEmail.Text = dtbl.Rows[0][4].ToString();
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text == "" || txtPassword.Text == "")
            {
                lblErrorMessage.Text = "Please Fill Mandatory Fields";
            }
            else if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblErrorMessage.Text = "Password do not match";
            }
            else
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    //int tempID = GenerateAutoID();

                    SqlCommand sqlCmd = new SqlCommand("UserAdd", sqlCon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserEmail", txtEmail.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserPassword", txtPassword.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserConfirmedPassword", txtConfirmPassword.Text.Trim());

                    sqlCmd.ExecuteNonQuery();
                    Clear();
                    lblSuccessMessage.Text = "Submitted Successfully";
                    Response.Redirect("ConfirmedRegMsg.aspx");
                }
            }
        }

        //clear function
        void Clear()
        {
            txtEmail.Text = txtUserName.Text = txtPassword.Text = txtConfirmPassword.Text = "";
            hfUserID.Value = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
        }
    }
}
