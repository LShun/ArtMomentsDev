﻿using System;
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
        string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";

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
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string UserName = Session["UserName"].ToString();

                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM [User] WHERE user_name = @UserName", conn))
                    {
                        //sqlDa.SelectCommand.Parameters.AddWithValue("@UserID", userID);
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
            if (FileUpload1.PostedFile != null)
            {
                byte[] bytes;
                using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
                {
                    bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
                }


                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string UserName = Session["UserName"].ToString();
                    string sql = "UPDATE [User] SET bibliography = @Bibliography, profile_pic = @Data WHERE user_name = @UserName";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserName", UserName);
                        //cmd.Parameters.AddWithValue("@Name", Path.GetFileName(FileUpload1.PostedFile.FileName));
                        //cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
                        cmd.Parameters.AddWithValue("@Bibliography", tbBibliography.Text.ToString());
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
    }
}