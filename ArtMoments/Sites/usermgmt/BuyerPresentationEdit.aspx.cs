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
    public partial class BuyerPresentationEdit : System.Web.UI.Page
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

                String tbUserName = Session["UserName"].ToString();

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    //@UserID, @UserName, @UserPassword, @UserConfirmedPassword, @UserEmail, @Bibliography, @UserContactNo, @UserAddress
                    String query = "SELECT * FROM [User] WHERE user_name = @UserName";
                    SqlCommand cmd = new SqlCommand(query, sqlCon);

                    cmd.Parameters.AddWithValue("@UserName", tbUserName);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            tbBibliography.Text = dr.GetValue(5).ToString();
                            if (tbBibliography.Text == "")
                            {
                                tbBibliography.Text = "Enter your bibliography to let others know you better";
                            }

                            tbProfilePic.Text = dr.GetValue(6).ToString();

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

        protected void btnPresentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerPresentationEdit.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                String tbUserName = Session["UserName"].ToString();
                String query1 = "UPDATE [User] SET [bibliography] = @Bibliography, [profile_pic] = @ProfilePic WHERE user_name = @UserName";

                SqlCommand sqlCmd = new SqlCommand(query1, sqlCon);

                sqlCmd.Parameters.AddWithValue("@UserName", tbUserName);
                sqlCmd.Parameters.AddWithValue("@Bibliography", tbBibliography.Text);
                sqlCmd.Parameters.AddWithValue("@ProfilePic", tbProfilePic.Text);

                sqlCmd.ExecuteNonQuery();
                lblSuccessMessage.Text = "Edited Successfully";
                //RedirectAfterDelayFn();
                sqlCon.Close();
                Response.Redirect("BuyerPresentation.aspx");
            }
        }

        protected void tbBibliography_TextChanged(object sender, EventArgs e)
        {

        }

        protected void tbProfilePic_TextChanged1(object sender, EventArgs e)
        {

        }
    }
}