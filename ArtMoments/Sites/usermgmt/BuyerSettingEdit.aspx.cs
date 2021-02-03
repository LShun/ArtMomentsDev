using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;

namespace ArtMoments.Sites.usermgmt
{
    public partial class BuyerSettingEdit : System.Web.UI.Page
    {
        String connectionString = @"Data Source =(local)\SQLEXPRESSFJE;
                    initial Catalog=ArtMomentsDB; Integrated Security = True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("PreLogin.html");
                }

                txtUserName.Text = Session["UserName"].ToString();

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query = "SELECT * FROM dboAMUserData WHERE UserName = @UserName";
                    SqlCommand cmd = new SqlCommand(query, sqlCon);

                    cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtEmail.Text = dr.GetValue(4).ToString();

                            txtContactNo.Text = dr.GetValue(5).ToString();
                            if (txtContactNo.Text == "")
                            {
                                //tbContactNo.ToolTip = "Click edit to insert your contact number";
                                txtContactNo.Text = "Click edit to insert your contact number";
                            }
                        }
                    }
                }
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerAccount.aspx");
        }

        protected void btnSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerSetting.aspx");
        }

        protected void btnPresentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerPresentation.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                String usrName = txtUserName.Text;
                String query1 = "UPDATE [dboAMUserData] SET [UserName] = @UserName, [UserEmail] = @Email, [UserContactNo] = @ContactNo WHERE UserName = @UserName";

                SqlCommand sqlCmd = new SqlCommand(query1, sqlCon);

                sqlCmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                sqlCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                sqlCmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);

                sqlCmd.ExecuteNonQuery();
                lblSuccessMessage.Text = "Edited Successfully";
                RedirectAfterDelayFn();
                sqlCon.Close();
            }
        }

        protected void RedirectAfterDelayFn()
        {
            var t = Task.Run(async delegate
            {
                await Task.Delay(1000);
                return 42;
            });
            t.Wait();
            Response.Redirect("BuyerSetting.aspx");
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtContactNo_TextChanged(object sender, EventArgs e)
        {

        }
    }
}