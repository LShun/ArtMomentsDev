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
        string connectionString = "Data Source=LAPTOP-RF7VE486\\SQLEXPRESSFJE;Initial Catalog=ArtMomentsDb; Integrated Security=True; User ID=sa;Password=***********";


        protected void Page_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
                {
                    if (Session["UserName"] == null)
                    {
                        Response.Redirect("PreLogin.aspx");
                    }

                    txtUserName.Text = Session["UserName"].ToString();

                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        String query = "SELECT * FROM [User] WHERE user_name = @UserName";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);

                        cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                txtEmail.Text = dr.GetValue(3).ToString();

                                txtContactNo.Text = dr.GetValue(4).ToString();
                                if (txtContactNo.Text == "")
                                {
                                    txtContactNo.Text = "Edit your contact no.";
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

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            txtUserName.Text = txtUserName.Text;
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            txtEmail.Text = txtEmail.Text;
        }

        protected void txtContactNo_TextChanged(object sender, EventArgs e)
        {
            txtContactNo.Text = txtContactNo.Text;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerSettingEdit.aspx");
        }
    }
}