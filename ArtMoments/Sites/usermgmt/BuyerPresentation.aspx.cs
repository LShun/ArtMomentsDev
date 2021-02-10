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
        string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
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
                        }
                    }
                }
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string UserName = Session["UserName"].ToString();

                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM [User] WHERE user_name = @UserName", conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@UserName", UserName);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();
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

        protected void gvImages_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string imageUrl = "";

                DataRowView dr = (DataRowView)e.Row.DataItem;

                if (!DBNull.Value.Equals(dr["profile_pic"]))
                    imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["profile_pic"]); 
                else
                    imageUrl = String.Empty;

                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;            
                
            }
        }
    }
}