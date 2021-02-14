using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.general
{
    public partial class DisplayArtworkProduct : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            generalDisplay();
            bindDDLprocCat();
        }

        public void generalDisplay()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT [id], [prod_name], [prod_image] FROM [Product] WHERE ([category_id] = @category_id) ORDER BY [prod_name]";
            
            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@category_id", Request.QueryString["id"].ToString());
                SqlDataReader dr = cmd.ExecuteReader();
                dlProd.DataSource = dr;
                dlProd.DataBind();
            }
            conn.Close();

        }

        public void bindDDLprocCat()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT [category_name], [category_image] FROM [Product_Category] ORDER BY [category_name]";

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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddlProdCat.ClearSelection();
            ddlArtist.ClearSelection();
            ddlProdSize.ClearSelection();
            rangeMin.Value = "30";
            rangeMax.Value = "60";
        }

        protected void dlProd_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "orderProd")
            {
                Response.Redirect("OrderArt.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}