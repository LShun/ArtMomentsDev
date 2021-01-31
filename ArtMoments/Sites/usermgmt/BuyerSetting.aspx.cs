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
    public partial class BuyerSetting : System.Web.UI.Page
    {
        String connectionString = @"Data Source =(local)\SQLEXPRESSFJE;
                    initial Catalog=artMomentDB; Integrated Security = True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("PreLogin.html");
                }

                tbUserName.Text = Session["UserName"].ToString();

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    String query = "SELECT * FROM dboAMUserData WHERE UserName = @UserName";
                    SqlCommand cmd = new SqlCommand(query, sqlCon);

                    cmd.Parameters.AddWithValue("@UserName", tbUserName.Text.Trim());
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            tbEmail.Text = dr.GetValue(4).ToString();

                            tbContactNo.Text = dr.GetValue(5).ToString();
                            if (tbContactNo.Text == "")
                            {
                                tbContactNo.Text = "Click edit to insert your contact number";
                            }

                            tbAddress.Text = dr.GetValue(6).ToString();
                            if (tbAddress.Text == "")
                            {
                                tbAddress.Text = "Click edit to insert your address";
                            }
                        }
                    }
                    //sqlCon.Close();
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

        protected void tbUserName_TextChanged(object sender, EventArgs e)
        {
            tbUserName.Text = tbUserName.Text;
        }

        protected void tbEmail_TextChanged(object sender, EventArgs e)
        {
            tbEmail.Text = tbEmail.Text;
        }

        protected void tbContactNo_TextChanged(object sender, EventArgs e)
        {
            tbContactNo.Text = tbContactNo.Text;
        }

        protected void tbAddress_TextChanged(object sender, EventArgs e)
        {
            tbAddress.Text = tbAddress.Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerSettingEdit.aspx");
        }
    }
}