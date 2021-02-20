using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

namespace ArtMoments.Sites.artist
{
    public partial class EditProduct : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Application["prodID"] == null)
                    Response.Redirect("ProductList.aspx");


                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM product WHERE id = @ProdID"))
                    {
                        string productID = Application["prodID"].ToString();

                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        cmd.Parameters.AddWithValue("@ProdID", productID);
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            string artSize = "";
                            string[] spearator = {"cm", "X", "cm", " "};

                            sdr.Read();
                            txtArtworkName.Text = sdr["prod_name"].ToString();
                            artSize = sdr["prod_size"].ToString();
                            string[] artSize1 = artSize.Split(spearator,
                                StringSplitOptions.RemoveEmptyEntries);
                            txtArtworkHeight.Text = artSize1[0];
                            txtArtworkWidth.Text = artSize1[1];
                            txtArtworkDesc.Text = sdr["prod_description"].ToString();
                            string categoryId = sdr["category_id"].ToString();
                            ddlArtworkCategory.SelectedValue = categoryId;
                            txtArtworkPrice.Text = sdr["prod_price"].ToString();
                            txtArtworkStock.Text = sdr["prod_stock"].ToString();
                        }

                        con.Close();
                    }
                }
            }
        }

        protected void saveProdBtn_Click(object sender, EventArgs e)
        {
            string pricePattern = @"^\d{0,8}(\.\d{1,2})?$";

            bool isPriceValid = Regex.IsMatch(txtArtworkPrice.Text, pricePattern);
            if (txtArtworkName.Text.Length == 0 || txtArtworkHeight.Text.Length == 0 ||
                txtArtworkWidth.Text.Length == 0 || txtArtworkDesc.Text.Length == 0 ||
                txtArtworkPrice.Text.Length == 0 || txtArtworkStock.Text.Length == 0 || fuProdImage.HasFile == false)
            {
                lblErrorMsg.Text = "The form is not completed!!!";
            }
            else if (!isPriceValid)
            {
                lblErrorMsg.Text = "Price only can up to 8 decimal number with maximum 2 decimal places";
            }
            else
            {
                string artworkName = txtArtworkName.Text;
                string artworkSize = txtArtworkHeight.Text + "cm X " + txtArtworkWidth.Text + "cm";
                string artworkDesc = txtArtworkDesc.Text;
                int categoryID = int.Parse(ddlArtworkCategory.SelectedValue);
                double artworkPrice = double.Parse(txtArtworkPrice.Text);
                double artworkStock = double.Parse(txtArtworkStock.Text);

                //int userID = getUserID();
                byte[] bytes;
                using (BinaryReader br = new BinaryReader(fuProdImage.PostedFile.InputStream))
                {
                    bytes = br.ReadBytes(fuProdImage.PostedFile.ContentLength);
                }

                using (SqlConnection sqlcon = new SqlConnection(connectionString))
                {
                    string sql =
                        "UPDATE product SET prod_name = @prodName, prod_size = @prodSize, prod_description = @prodDesc, category_id = @categoryId, prod_image = @prodImage, prod_price = @prodPrice, prod_stock = @prodStock WHERE id = @prodID";
                    using (SqlCommand cmd = new SqlCommand(sql, sqlcon))
                    {
                        string productID = Application["prodID"].ToString();
                        cmd.Parameters.AddWithValue("@prodName", artworkName);
                        cmd.Parameters.AddWithValue("@prodSize", artworkSize);
                        cmd.Parameters.AddWithValue("@prodDesc", artworkDesc);
                        cmd.Parameters.AddWithValue("@categoryId", categoryID);
                        cmd.Parameters.AddWithValue("@prodImage", bytes);
                        cmd.Parameters.AddWithValue("@prodPrice", artworkPrice);
                        cmd.Parameters.AddWithValue("@prodStock", artworkStock);
                        cmd.Parameters.AddWithValue("@prodID", productID);
                        //cmd.Parameters.AddWithValue("@userId", userId);
                        sqlcon.Open();
                        cmd.ExecuteNonQuery();
                        sqlcon.Close();
                    }
                }

                //Response.Redirect(Request.Url.AbsoluteUri);
                Response.Redirect("ProductList.aspx");
            }
        }

        protected void cancelProdBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductList.aspx");
        }
    }
}