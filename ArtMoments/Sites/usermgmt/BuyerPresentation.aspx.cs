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
    public partial class BuyerPresentation : System.Web.UI.Page
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

                String tbUserName = Session["UserName"].ToString();

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    //@UserID, @UserName, @UserPassword, @UserConfirmedPassword, @UserEmail, @Bibliography, @UserContactNo, @UserAddress
                    String query = "SELECT * FROM dboAMUserData WHERE UserName = @UserName";
                    SqlCommand cmd = new SqlCommand(query, sqlCon);

                    cmd.Parameters.AddWithValue("@UserName", tbUserName);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            tbBibliography.Text = dr.GetValue(7).ToString();
                            if (tbBibliography.Text == "")
                            {
                                tbBibliography.Text = "Enter your bibliography to let others know you better";
                            }

                            tbProfilePic.Text = dr.GetValue(8).ToString();

                            if (tbProfilePic.Text == "")
                            {
                                tbProfilePic.Text = "Click edit to insert your image url";
                            }
                            else
                            {
                                Image1.ImageUrl = tbProfilePic.Text;
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerPresentation.aspx");
        }

        protected void tbBibliography_TextChanged(object sender, EventArgs e)
        {

        }

        protected void tbProfilePic_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerPresentationEdit.aspx");
        }
    }
}