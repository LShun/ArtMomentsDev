using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Configuration;

namespace ArtMoments.Sites.artist
{
    public partial class AddProduct : System.Web.UI.Page
    {
        string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        string userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
                //if (Session["UserName"] == null)
                //{
                //    Response.Redirect("usermgmt/PreLogin.aspx");
                //}


                //using (SqlConnection sqlcon = new SqlConnection(connectionString))
                //{
                //    string UserName = Session["UserName"].ToString();

                    
                //    //List<int> userIdList = new List<int>();
                //    string sql = "SELECT id FROM [User] WHERE user_name = @UserName";

                //    using (SqlCommand cmd = new SqlCommand(sql, sqlcon))
                //    {
                //        cmd.Parameters.AddWithValue("@UserName", UserName);
                //        sqlcon.Open();
                //        SqlDataReader reader = cmd.ExecuteReader();
                //        while (reader.Read())
                //        {
                //            userId = reader[0].ToString();
                //            //userIdList.Add(reader.GetInt32(0));
                //        }
                //        reader.Close();
                //        sqlcon.Close();
                //    }
                //}
 
            }
        }

        protected void saveProdBtn_Click(object sender, EventArgs e)
        {
            string artworkName = txtArtworkName.Text;
            string artworkSize = txtArtworkSize.Text;
            string artworkDesc = txtArtworkDesc.Text;
            int categoryID = int.Parse(ddlArtworkCategory.SelectedValue);
            string test = ddlArtworkCategory.SelectedValue;
            double artworkPrice = double.Parse(txtArtworkPrice.Text);
            double artworkStock = double.Parse(txtArtworkStock.Text);

            //int userID = getUserID();
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(fileUpload.PostedFile.InputStream))
            {
                bytes = br.ReadBytes(fileUpload.PostedFile.ContentLength);
            }

            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {
                string sql = "insert into product (prod_name,prod_size,prod_description,category_id, prod_image, prod_price, prod_stock) values (@prodName, @prodSize, @prodDesc, @categoryId, @prodImage, @prodPrice, @prodStock) ";
                using (SqlCommand cmd = new SqlCommand(sql, sqlcon))
                {
                    cmd.Parameters.AddWithValue("@prodName", artworkName);
                    cmd.Parameters.AddWithValue("@prodSize", artworkSize);
                    cmd.Parameters.AddWithValue("@prodDesc", artworkDesc);
                    cmd.Parameters.AddWithValue("@categoryId", categoryID);
                    cmd.Parameters.AddWithValue("@prodImage", bytes);
                    cmd.Parameters.AddWithValue("@prodPrice", artworkPrice);
                    cmd.Parameters.AddWithValue("@prodStock", artworkStock);
                    //cmd.Parameters.AddWithValue("@userId", userId);
                    sqlcon.Open();
                    cmd.ExecuteNonQuery();
                    sqlcon.Close();
                }
            }
            //Response.Redirect(Request.Url.AbsoluteUri);
            Response.Redirect("ProductList.aspx");
        }
        
        protected void resetProdBtn_Click(object sender, EventArgs e)
        {          
            fileUpload.Attributes.Clear();
            ClearInputs(Page.Controls);
        }
        void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                ClearInputs(ctrl.Controls);
            }
        }
    }
}