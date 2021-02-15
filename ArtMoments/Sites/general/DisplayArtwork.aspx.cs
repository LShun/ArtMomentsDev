using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.ModelBinding;
using System.Configuration;

namespace ArtMoments.Sites.general
{
    public partial class DisplayArtwork : System.Web.UI.Page
    {
       string strCon = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        public class prodCategory
        {
            public int id { get; set; }
            public string category_name { get; set; }
            public string category_desc_size { get; set; }
            public string category_imageURL { get; set; }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                generalDisplay();
                bindDDLprocCat();
                bindDDLprocSize();
                bindDDLartist();
            }
        }

        public void generalDisplay()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT [id], [category_name], [category_image] FROM [Product_Category] ORDER BY [category_name]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                dlProdCat.DataSource = dr;
                dlProdCat.DataBind();
            }
            conn.Close();

        }

        public void bindDDLprocCat()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT [category_name] FROM [Product_Category] ORDER BY [category_name]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ListItem li = new ListItem((string)dr["category_name"]);
                        ddlProdCat.Items.Add(li);
                    }
                }
            }
            conn.Close();
        }

        public void bindDDLprocSize()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT [prod_size] FROM [Product] ORDER BY [prod_size]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ListItem li = new ListItem((string)dr["prod_size"]);
                        ddlProdSize.Items.Add(li);
                    }
                }
            }
            conn.Close();
        }

        public void bindDDLartist()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT [user_name] FROM [User] ORDER BY [user_name]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ListItem li = new ListItem((string)dr["user_name"]);
                        ddlArtist.Items.Add(li);
                    }
                }
            }
            conn.Close();
        }

        public void Item_Created(Object sender, DataListItemEventArgs e)
        {
            string imageUrl = "";

            if (e.Item.ItemType == ListItemType.Item)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                if (!DBNull.Value.Equals(dr["category_image"]))
                    imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["category_image"]);
                else
                    imageUrl = String.Empty;

                (e.Item.FindControl("ibtnCategory_img") as ImageButton).ImageUrl = imageUrl;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
           /* SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT [id] FROM [Product_Category] WHERE category_name = @Category_Name";

            if (cat_id != null)
            {

                if(ddlArtist.Text == "")
                {
                    if(ddlProdSize.Text != "")
                    {
                        sqlCmd = "SELECT * " +
                    "FROM Product" +
                    "WHERE category_id = @Category_ID " +
                    "AND prod_size = @Product_Size";
                    }

                }
                else
                {
                    if(ddlProdSize.Text != "")
                    {
                        sqlCmd = "SELECT * " +
                    "FROM Product" +
                    "WHERE category_id = @Category_ID " +
                    "AND user_id = @User_ID " +
                    "AND prod_size = @Product_Size";
                    }
                    else
                    {
                        sqlCmd = "SELECT * " +
                    "FROM Product" +
                    "WHERE category_id = @Category_ID " +
                    "AND user_id = @User_ID ";
                    }
                }


                using (SqlDataAdapter sda = new SqlDataAdapter(sqlCmd, conn))
                {
                    sda.SelectCommand.Parameters.AddWithValue("@Category_ID", cat_id);
                    sda.SelectCommand.Parameters.AddWithValue("@User_ID", ddlArtist.Text);
                    sda.SelectCommand.Parameters.AddWithValue("@Product_Size", ddlProdSize.Text);

                }
            }
            conn.Close();
           */
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddlProdCat.ClearSelection();
            ddlArtist.ClearSelection();
            ddlProdSize.ClearSelection();
            rangeMin.Value = "30";
            rangeMax.Value = "60";
            generalDisplay();
        }

        protected void dlProdCat_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "viewProd")
            {
                Response.Redirect("DisplayArtworkProduct.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }

}