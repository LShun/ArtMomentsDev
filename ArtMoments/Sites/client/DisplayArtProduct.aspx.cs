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
    public partial class DisplayArtProduct : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
            int CurrentPage;
            protected void Page_Load(object sender, EventArgs e)
            {
                bindDDLprocCat();
                bindDDLprocSize();
                bindDDLartist();

                if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
                {
                    DropDownList ProdCategory = PreviousPage.FindControl("ContentPlaceHolder1_ddlProdCat") as DropDownList;
                    DropDownList Artist = PreviousPage.FindControl("ContentPlaceHolder1_ddlArtist") as DropDownList;
                    DropDownList ProdSize = PreviousPage.FindControl("ContentPlaceHolder1_ddlProdSize") as DropDownList;
                    Label MinPriceRange = PreviousPage.FindControl("ContentPlaceHolder1_lblMinPRange") as Label;
                    Label MaxPriceRange = PreviousPage.FindControl("ContentPlaceHolder1_lblMaxPRange") as Label;


                    lblDetails.Text = ProdCategory.SelectedItem.Value + "<br/>" +
                        Artist.SelectedItem.Value + "<br/>" +
                        ProdSize.SelectedItem.Value + "<br/>" +
                        MinPriceRange.Text + "<br/>" +
                        MaxPriceRange.Text;

                    //ddlProdCat.SelectedItem.Value.Equals(ProdCategory.SelectedItem.Value);
                    //ddlArtist.SelectedItem.Value.Equals(Artist.SelectedItem.Value);
                    //ddlProdSize.SelectedItem.Value.Equals(ProdSize.SelectedItem.Value);
                    //lblMinPRange.Text = MinPriceRange.Text;
                    //lblMaxPRange.Text = MaxPriceRange.Text;
                    //rangeMin.Value.Equals(MinPriceRange.Text);
                    //rangeMax.Value.Equals(MaxPriceRange.Text);

                }
                else
                {
                    if (!IsPostBack)
                    {
                        generalDisplay();
                        ViewState["PageCount"] = 0;
                    }

                    
                }
                CurrentPage = (int)ViewState["PageCount"];


            }


            public void generalDisplay()
            {
                SqlConnection conn = new SqlConnection(strCon);
                conn.Open();

                string sqlCmd = "SELECT DISTINCT [id], [prod_name], [prod_image] FROM [Product] WHERE ([category_id] = @category_id) ORDER BY [prod_name]";

                //using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
                //{
                //    cmd.CommandType = CommandType.Text;
                //    cmd.Parameters.AddWithValue("@category_id", Request.QueryString["id"].ToString());
                //    SqlDataReader dr = cmd.ExecuteReader();
                //    dlProd.DataSource = dr;
                //    dlProd.DataBind();
                //}

                using (SqlDataAdapter sda = new SqlDataAdapter(sqlCmd, conn))
                {
                    sda.SelectCommand.CommandType = CommandType.Text;
                    sda.SelectCommand.Parameters.AddWithValue("@category_id", Request.QueryString["id"].ToString());
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

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

            public void bindDDLprocCat()
            {
                ddlProdCat.Items.Clear();
                ddlProdCat.Items.Add("ALL");
                SqlConnection conn = new SqlConnection(strCon);
                conn.Open();

                string sqlCmd = "SELECT DISTINCT [category_name], [category_image] FROM [Product_Category] ORDER BY [category_name]";

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
                            ListItem li = new ListItem((string)dr["prod_size"]);
                            ddlProdSize.Items.Add(li);
                        }
                    }
                }
                conn.Close();
            }

            public void bindDDLartist()
            {
                ddlArtist.Items.Clear();
                ddlArtist.Items.Add("ALL");
                SqlConnection conn = new SqlConnection(strCon);
                conn.Open();

                string sqlCmd = "SELECT DISTINCT [user_name] FROM [User] WHERE [user_type] = 2 ORDER BY [user_name]";

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

            protected void btnClear_Click(object sender, EventArgs e)
            {
                ddlProdCat.ClearSelection();
                ddlArtist.ClearSelection();
                ddlProdSize.ClearSelection();
                rangeMin.Value = "30";
                rangeMax.Value = "60";
                generalDisplay();
            }

            protected void dlProd_ItemCommand(object source, DataListCommandEventArgs e)
            {
                if (e.CommandName == "orderProd")
                {
                    Response.Redirect("OrderArt.aspx?id=" + e.CommandArgument.ToString());
                }
            }

            private void DataListPaging(DataTable dt)
            {
                //creating object of PagedDataSource;  
                PagedDataSource PD = new PagedDataSource();
                PD.DataSource = dt.DefaultView;
                PD.PageSize = 9;
                PD.AllowPaging = true;
                PD.CurrentPageIndex = CurrentPage;
                btnFirst.Enabled = !PD.IsFirstPage;
                btnPrevious.Enabled = !PD.IsFirstPage;
                btnLast.Enabled = !PD.IsLastPage;
                btnNext.Enabled = !PD.IsLastPage;
                ViewState["TotalCount"] = PD.PageCount;
                dlProd.DataSource = PD;
                dlProd.DataBind();
                ViewState["PagedDataSurce"] = dt;
            }

            protected void btnFirst_Click(object sender, EventArgs e)
            {
                CurrentPage = 0;
            //dlProd.DataSource = (DataTable)ViewState["PagedDataSurce"];
            //dlProd.DataBind();
            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
            }

            protected void btnPrevious_Click(object sender, EventArgs e)
            {
                CurrentPage = (int)ViewState["PageCount"];
                CurrentPage -= 1;
                ViewState["PageCount"] = CurrentPage;

                DataListPaging((DataTable)ViewState["PagedDataSurce"]);
            }

            protected void btnNext_Click(object sender, EventArgs e)
            {
                CurrentPage = (int)ViewState["PageCount"];
                CurrentPage += 1;
                ViewState["PageCount"] = CurrentPage;
                DataListPaging((DataTable)ViewState["PagedDataSurce"]);
            }

            protected void btnLast_Click(object sender, EventArgs e)
            {
                CurrentPage = (int)ViewState["TotalCount"] - 1;
                DataListPaging((DataTable)ViewState["PagedDataSurce"]);
            }

            protected void btnSearch_Click(object sender, EventArgs e)
            {
                SqlConnection conn = new SqlConnection(strCon);
                conn.Open();

                string sqlCmd = "SELECT DISTINCT [id], [prod_name], [prod_image]" +
                    " FROM [Product],[Product_Category]" +
                    "WHERE (";

                int countCriteria = 0;

                if (!ddlProdCat.SelectedItem.Value.Equals("ALL"))
                {
                    sqlCmd += "[Product.category_id] = [Product_Category.id] " +
                    "AND [Product_Category.category_name] = @CategoryName";
                    countCriteria += 1;
                }

                if (!ddlArtist.SelectedItem.Value.Equals("ALL"))
                {
                    if (countCriteria == 0)
                    {
                        sqlCmd += " AND ";
                    }
                    sqlCmd += "[Product.user_id] = @ArtistName";
                    countCriteria += 1;
                }

                if (!ddlProdSize.SelectedItem.Value.Equals("ALL"))
                {
                    if (countCriteria == 0)
                    {
                        sqlCmd += " AND ";
                    }
                    sqlCmd += "[Product.prod_size] = @ProductSize";
                    countCriteria += 1;
                }

                if (countCriteria == 0)
                {
                    sqlCmd = "SELECT DISTINCT [id], [prod_name], [prod_image]" +
                    " FROM [Product] ";
                }


                using (SqlDataAdapter sda = new SqlDataAdapter(sqlCmd, conn))
                {
                    sda.SelectCommand.CommandType = CommandType.Text;
                    sda.SelectCommand.Parameters.AddWithValue("@CategoryName", ddlProdCat.SelectedItem.Value.ToString());
                    sda.SelectCommand.Parameters.AddWithValue("@ArtistName", ddlArtist.SelectedItem.Value.ToString());
                    sda.SelectCommand.Parameters.AddWithValue("@ProductSize", ddlProdSize.SelectedItem.Value.ToString());
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

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
    }
}
