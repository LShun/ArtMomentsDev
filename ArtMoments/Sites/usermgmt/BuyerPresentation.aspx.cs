using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace ArtMoments.Sites.usermgmt
{

    public partial class BuyerPresentationEdit : System.Web.UI.Page
    {
        
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
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
                    sqlCon.Close();
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

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            string imageUrl = "";

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                if (!DBNull.Value.Equals(dr["profile_pic"]))
                    imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["profile_pic"]);
                else
                    imageUrl = String.Empty;

                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
            if (fuProfilePic.PostedFile != null)
            {
                byte[] bytes;
                using (BinaryReader br = new BinaryReader(fuProfilePic.PostedFile.InputStream))
                {
                    bytes = br.ReadBytes(fuProfilePic.PostedFile.ContentLength);
                }


                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string UserName = Session["UserName"].ToString();
                    string sql = "UPDATE [User] SET profile_pic = @Data WHERE user_name = @UserName";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserName", UserName);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
                
                Response.Redirect(Request.Url.AbsoluteUri);
                Response.Redirect("BuyerPresentation.aspx");
            }
        }

        protected void tbBibliography_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string UserName = Session["UserName"].ToString();
                string sql = "UPDATE [User] SET bibliography = @Bibliography WHERE user_name = @UserName";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@UserName", UserName);
                    cmd.Parameters.AddWithValue("@Bibliography", tbBibliography.Text.ToString());
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }

        protected void lbMyAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerAccount.aspx");
        }

        protected void lbSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerSettingExtra.aspx");
        }

        protected void lbPresentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerPresentation.aspx");
        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../general/HomePage.aspx");
        }
    }
}