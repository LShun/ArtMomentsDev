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
            int CurrentPage;

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {

                    generalDisplay();
                    bindDDLprocCat();
                    bindDDLprocSize();
                    bindDDLartist();
                    ViewState["PageCount"] = 0;
                }
                CurrentPage = (int)ViewState["PageCount"];

            }

            public void generalDisplay()
            {
                SqlConnection conn = new SqlConnection(strCon);
                conn.Open();

                string sqlCmd = "SELECT DISTINCT [id], [category_name], [category_image] FROM [Product_Category] ORDER BY [category_name]";

                //using (SqlCommand cmd = new SqlCommand(sqlCmd, conn))
                //{
                //    //SqlDataReader dr = cmd.ExecuteReader();
                //    //dlProdCat.DataSource = dr;
                //    //dlProdCat.DataBind();

                //}

                using (SqlDataAdapter sda = new SqlDataAdapter(sqlCmd, conn))
                {
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

                string sqlCmd = "SELECT DISTINCT [category_name] FROM [Product_Category] ORDER BY [category_name]";

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

                string sqlCmd = "SELECT DISTINCT [user_name] FROM [User]  WHERE [user_type] = 2 ORDER BY [user_name]";

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

            protected void ChangeLabel()
            {
                lblMinPRange.Text = rangeMin.Value;
                lblMaxPRange.Text = rangeMax.Value;
            }

            //sda.SelectCommand.Parameters.AddWithValue("@User_ID", ddlArtist.Text);
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
                if (e.CommandName == "viewProd")
                {
                    Response.Redirect("DisplayArtProduct.aspx?id=" + e.CommandArgument.ToString());
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
                dlProdCat.DataSource = PD;
                dlProdCat.DataBind();
                ViewState["PagedDataSurce"] = dt;
            }

            protected void btnFirst_Click(object sender, EventArgs e)
            {
                CurrentPage = 0;
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
        }

}
