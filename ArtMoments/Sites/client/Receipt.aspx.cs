using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace ArtMoments.Sites.client
{
    public partial class Receipt : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //using (SqlConnection con = new SqlConnection(connectionString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("SELECT * FROM product WHERE id = @ProdID"))
            //    {
            //        string productID = Application["prodID"].ToString();

            //        cmd.CommandType = CommandType.Text;
            //        cmd.Connection = con;
            //        con.Open();
            //        cmd.Parameters.AddWithValue("@ProdID", productID);
            //        using (SqlDataReader sdr = cmd.ExecuteReader())
            //        {
            //            string artSize = "";
            //            string[] spearator = { "cm", "X", "cm", " " };

            //            sdr.Read();
            //            txtArtworkName.Text = sdr["prod_name"].ToString();
            //            artSize = sdr["prod_size"].ToString();
            //            string[] artSize1 = artSize.Split(spearator,
            //                StringSplitOptions.RemoveEmptyEntries);
            //            txtArtworkHeight.Text = artSize1[0];
            //            txtArtworkWidth.Text = artSize1[1];
            //            txtArtworkDesc.Text = sdr["prod_description"].ToString();
            //            string categoryId = sdr["category_id"].ToString();
            //            ddlArtworkCategory.SelectedValue = categoryId;
            //            txtArtworkPrice.Text = sdr["prod_price"].ToString();
            //            txtArtworkStock.Text = sdr["prod_stock"].ToString();
            //        }

            //        con.Close();
            //    }
            //}
        }
    }
}