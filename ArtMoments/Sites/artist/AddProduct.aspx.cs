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
using System.Text.RegularExpressions;
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

                if (Session["UserName"] == null)
                {
                    Response.Redirect("../usermgmt/PreLogin.aspx");
                } 

            }
            
        }

        protected void saveProdBtn_Click(object sender, EventArgs e)
        {
             string pricePattern = @"^\d{0,8}(\.\d{1,2})?$";

            bool isPriceValid = Regex.IsMatch(txtArtworkPrice.Text, pricePattern);
            if (txtArtworkName.Text.Length == 0 || txtArtworkSize.Text.Length == 0 || txtArtworkDesc.Text.Length == 0 || txtArtworkPrice.Text.Length == 0 || txtArtworkStock.Text.Length == 0 || ImageUpload.HasFile == false)
            {
                lblErrorMsg.Text = "The form is not completed!!!";
            }
            else if (!isPriceValid)
            {
                lblErrorMsg.Text = "The price is invalid!!!";
            }
            else
            {
                string artworkName = txtArtworkName.Text;
                string artworkSize = txtArtworkSize.Text;
                string artworkDesc = txtArtworkDesc.Text;
                int categoryID = int.Parse(ddlArtworkCategory.SelectedValue);
                double artworkPrice = double.Parse(txtArtworkPrice.Text);
                double artworkStock = double.Parse(txtArtworkStock.Text);

                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {

                    string sql = "SELECT id FROM [User] WHERE user_name = @UserName";

                    using (SqlCommand cmd = new SqlCommand(sql, sqlcon))
                    {
                        cmd.Parameters.AddWithValue("@UserName", Session["UserName"]);
                        sqlcon.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            userId = reader[0].ToString();
                        }
                        reader.Close();
                        sqlcon.Close();
                    }
                }

                //int userID = getUserID();
                byte[] bytes;
                using (BinaryReader br = new BinaryReader(ImageUpload.PostedFile.InputStream))
                {
                    bytes = br.ReadBytes(ImageUpload.PostedFile.ContentLength);
                }

                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    string sql = "insert into product (prod_name,prod_size,prod_description,category_id, prod_image, prod_price, prod_stock, prod_sales, user_id) values (@prodName, @prodSize, @prodDesc, @categoryId, @prodImage, @prodPrice, @prodStock, @prodSales, @userID)";
                    using (SqlCommand cmd = new SqlCommand(sql, sqlcon))
                    {
                        cmd.Parameters.AddWithValue("@prodName", artworkName);
                        cmd.Parameters.AddWithValue("@prodSize", artworkSize);
                        cmd.Parameters.AddWithValue("@prodDesc", artworkDesc);
                        cmd.Parameters.AddWithValue("@categoryId", categoryID);
                        cmd.Parameters.AddWithValue("@prodImage", bytes);
                        cmd.Parameters.AddWithValue("@prodPrice", artworkPrice);
                        cmd.Parameters.AddWithValue("@prodStock", artworkStock);
                        cmd.Parameters.AddWithValue("@prodSales", 0);
                        cmd.Parameters.AddWithValue("@userID", userId);
                        sqlcon.Open();
                        cmd.ExecuteNonQuery();
                        sqlcon.Close();
                    }
                }
                //Response.Redirect(Request.Url.AbsoluteUri);
                Response.Redirect("ProductList.aspx");
            }
        }
        
        protected void resetProdBtn_Click(object sender, EventArgs e)
        {          
            ImageUpload.Attributes.Clear();
            txtArtworkName.Text = string.Empty;
            txtArtworkSize.Text = string.Empty;
            txtArtworkDesc.Text = string.Empty;
            txtArtworkPrice.Text = string.Empty;
            txtArtworkStock.Text = string.Empty;
            lblErrorMsg.Text = string.Empty;
            
        }
      
    }
}