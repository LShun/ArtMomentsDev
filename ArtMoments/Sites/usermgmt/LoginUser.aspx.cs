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
    public partial class LoginUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorLoginMsg.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(@"Data Source =(local)\SQLEXPRESSFJE;
                    initial Catalog=ArtMomentsDB; Integrated Security = True;"))
            {
                sqlCon.Open();
                String query = "SELECT COUNT(1) FROM dboAMUserData WHERE UserName =@UserName AND UserPassword =@UserPassword";
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
    }
}