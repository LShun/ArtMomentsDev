using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace ArtMoments.Sites.usermgmt
{
    public partial class BuyerPresentationEdit : System.Web.UI.Page
    {
        string connectionString = "Data Source=LAPTOP-RF7VE486\\SQLEXPRESSFJE;Initial Catalog=ArtMomentsDb; Integrated Security=True; User ID=sa;Password=***********";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("PreLogin.aspx");
                }

                String tbUserName = Session["UserName"].ToString();

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    String query = "SELECT * FROM [User] WHERE user_name = @UserName";

                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        //sda.SelectCommand.Parameters.AddWithValue("@UserName", "%" + tbUserName + "%");
                        //DataTable dt = new DataTable();
                        //sda.Fill(dt);
                        //gvImages.DataSource = dt;
                        //gvImages.DataBind();
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

        protected void tbBibliography_TextChanged(object sender, EventArgs e)
        {

        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["profile_pic"]);
                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;



                
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                String tbUserName = Session["UserName"].ToString();
                byte[] bytes;
                using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
                {
                    bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
                }


                //< add name = "constr" connectionString = "Data Source=.\SQL2014;Initial Catalog=dbFiles;Integrated Security=true" />
                //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {

                    string sql = "UPDATE [User] SET user_contactno = @Name, [bibliography] = @ContentType, [profile_pic] = @ProfilePic WHERE user_name = @UserName";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserName", tbUserName);
                        cmd.Parameters.AddWithValue("@Name", Path.GetFileName(FileUpload1.PostedFile.FileName));
                        cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                        cmd.Parameters.AddWithValue("@Bibliography", tbBibliography.Text);
                        cmd.Parameters.AddWithValue("@ProfilePic", bytes);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
    }
}