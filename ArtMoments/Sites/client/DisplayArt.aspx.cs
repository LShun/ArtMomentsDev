using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class DisplayArt : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        int currentPage;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GeneralDisplay();
                BindDDLprocCat();
                BindDDLprocSize();
                BindDDLartist();
                ViewState["PageCount"] = 0;
            }

            currentPage = (int) ViewState["PageCount"];
        }

        //Used to normal display product category without condition
        protected void GeneralDisplay()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd =
                "SELECT DISTINCT [id], [category_name], [category_image] FROM [Product_Category] ORDER BY [category_name]";

            using (SqlDataAdapter sda = new SqlDataAdapter(sqlCmd, conn))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);

                //check whether the database got data or not
                if ((dt.Rows.Count > 0) && (dt.Rows[0][0] != DBNull.Value))
                {
                    DataListPaging(dt);
                }

                else
                {
                    lblRecordMsg.Text = "No Record is found";
                }
            }

            conn.Close();
        }

        //Get the dropdown item for product category from database
        protected void BindDDLprocCat()
        {
            ddlProdCat.Items.Clear();
            ddlProdCat.Items.Add("ALL");
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT DISTINCT [category_name] FROM [Product_Category] ORDER BY [category_name]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ListItem li = new ListItem((string) dr["category_name"]);
                        ddlProdCat.Items.Add(li);
                    }
                }
            }

            conn.Close();
        }

        //Get the dropdown item for product size from database
        protected void BindDDLprocSize()
        {
            ddlProdSize.Items.Clear();
            ddlProdSize.Items.Add("ALL");
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT DISTINCT [prod_size] FROM [Product] ORDER BY [prod_size]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ListItem li = new ListItem((string) dr["prod_size"]);
                        ddlProdSize.Items.Add(li);
                    }
                }
            }

            conn.Close();
        }

        //Get the dropdown item for artist name from database
        protected void BindDDLartist()
        {
            ddlArtist.Items.Clear();
            ddlArtist.Items.Add("ALL");
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            //user type = 2 is artist , 1 is buyer
            string sqlCmd = "SELECT DISTINCT [user_name] FROM [User]  WHERE [user_type] = 2 ORDER BY [user_name]";

            using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
            {
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        ListItem li = new ListItem((string) dr["user_name"]);
                        ddlArtist.Items.Add(li);
                    }
                }
            }

            conn.Close();
        }

        //Clear all the searching criteria
        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddlProdCat.ClearSelection();
            ddlArtist.ClearSelection();
            ddlProdSize.ClearSelection();
            txtMinPR.Text = "";
            txtMaxPR.Text = "";
            txtProdName.Text = "";
            GeneralDisplay();
        }

        //Navigate to Display Art Product
        protected void dlProdCat_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "viewProd")
            {
                Response.Redirect("DisplayArtProduct.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        //For paging purpose, maximum 9 items per page
        private void DataListPaging(DataTable dt)
        {
            //creating object of PagedDataSource;  
            PagedDataSource PD = new PagedDataSource();
            PD.DataSource = dt.DefaultView;
            PD.PageSize = 9;
            PD.AllowPaging = true;
            PD.CurrentPageIndex = currentPage;
            btnFirst.Enabled = !PD.IsFirstPage;
            btnPrevious.Enabled = !PD.IsFirstPage;
            btnLast.Enabled = !PD.IsLastPage;
            btnNext.Enabled = !PD.IsLastPage;
            ViewState["TotalCount"] = PD.PageCount;
            dlProdCat.DataSource = PD;
            dlProdCat.DataBind();
            ViewState["PagedDataSurce"] = dt;
        }

        //go to first page
        protected void btnFirst_Click(object sender, EventArgs e)
        {
            currentPage = 0;
            DataListPaging((DataTable) ViewState["PagedDataSurce"]);
        }

        //go to previous page
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            currentPage = (int) ViewState["PageCount"];
            currentPage -= 1;
            ViewState["PageCount"] = currentPage;

            DataListPaging((DataTable) ViewState["PagedDataSurce"]);
        }

        //go to the next page
        protected void btnNext_Click(object sender, EventArgs e)
        {
            currentPage = (int) ViewState["PageCount"];
            currentPage += 1;
            ViewState["PageCount"] = currentPage;
            DataListPaging((DataTable) ViewState["PagedDataSurce"]);
        }

        //go to the last page
        protected void btnLast_Click(object sender, EventArgs e)
        {
            currentPage = (int) ViewState["TotalCount"] - 1;
            DataListPaging((DataTable) ViewState["PagedDataSurce"]);
        }
    }
}