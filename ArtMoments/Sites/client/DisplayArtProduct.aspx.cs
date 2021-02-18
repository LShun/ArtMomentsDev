﻿using System;
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
        int currentPage;
        int currentDdlProdCat;
        int currentDdlArtist;
        int currentDdlProdSize;
        string currentTxtMinPRange;
        string currentTxtMaxPRange;
        string currentTxtProdName;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                MasterPageFile = "~/Masters/General.Master";

            }
            else if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblRecordMsg.Text = "";
            if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                BindDDLprocCat();
                BindDDLprocSize();
                BindDDLartist();
                ContentPlaceHolder cp = PreviousPage.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
                if (cp != null)
                {
                    DropDownList ProdCategory = cp.FindControl("ddlProdCat") as DropDownList;
                    DropDownList Artist = cp.FindControl("ddlArtist") as DropDownList;
                    DropDownList ProdSize = cp.FindControl("ddlProdSize") as DropDownList;
                    TextBox MinPRange = cp.FindControl("txtMinPR") as TextBox;
                    TextBox MaxPRange = cp.FindControl("txtMaxPR") as TextBox;
                    TextBox ProdName = cp.FindControl("txtProdName") as TextBox;

                    ddlProdCat.SelectedItem.Value = ProdCategory.SelectedItem.Value;
                    currentDdlProdCat = ddlProdCat.SelectedIndex = ProdCategory.SelectedIndex;
                    ddlArtist.SelectedItem.Value = Artist.SelectedItem.Value;
                    currentDdlArtist = ddlArtist.SelectedIndex = Artist.SelectedIndex;
                    ddlProdSize.SelectedItem.Value = ProdSize.SelectedItem.Value;
                    currentDdlProdSize = ddlProdSize.SelectedIndex = ProdSize.SelectedIndex;
                    currentTxtMinPRange = txtMinPR.Text = MinPRange.Text;
                    currentTxtMaxPRange = txtMaxPR.Text = MaxPRange.Text;
                    currentTxtProdName = txtProdName.Text = ProdName.Text;
                    ViewState["PageCount"] = 0;
                    FilterDLProd();
                }
            }
            else
            {
                if (!IsPostBack)
                {
                    GeneralDisplay();
                    ViewState["PageCount"] = 0;
                    BindDDLprocCat();
                    BindDDLprocSize();
                    BindDDLartist();
                }

            }
            currentPage = (int)ViewState["PageCount"];


        }

        //Display product according to the selected category
        protected void GeneralDisplay()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT DISTINCT [id], [prod_name], [prod_image] FROM [Product] WHERE ([category_id] = @category_id) ORDER BY [prod_name]";

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

        //Get the dropdown item for product category from database
        protected void BindDDLprocCat()
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
                        ListItem li = new ListItem((string)dr["prod_size"]);
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

        //clear all the searching criteria
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

        //navigate to order product page
        protected void dlProd_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "orderProd")
            {
                Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + e.CommandArgument.ToString());
            }
        }
       
        //pagination purpose
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
            dlProd.DataSource = PD;
            dlProd.DataBind();
            ViewState["PagedDataSurce"] = dt;
        }

        //go to the first page
        protected void btnFirst_Click(object sender, EventArgs e)
        {
            currentPage = 0;
            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
        }

        //go to the previous page
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            currentPage = (int)ViewState["PageCount"];
            currentPage -= 1;
            ViewState["PageCount"] = currentPage;

            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
        }

        //go to the next page
        protected void btnNext_Click(object sender, EventArgs e)
        {
            currentPage = (int)ViewState["PageCount"];
            currentPage += 1;
            ViewState["PageCount"] = currentPage;
            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
        }

        //go to the last page
        protected void btnLast_Click(object sender, EventArgs e)
        {
            currentPage = (int)ViewState["TotalCount"] - 1;
            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
        }

        //filter the datalist according to certain searching criteria
        private void FilterDLProd()
        {
            SqlConnection conn = new SqlConnection(strCon);
            conn.Open();

            string sqlCmd = "SELECT DISTINCT Product.id, Product.prod_name, Product.prod_image" +
                " FROM Product";

            if (!ddlProdCat.SelectedItem.Value.Equals("ALL"))
            {
                sqlCmd += ", Product_Category";
            }

            if (!ddlArtist.SelectedItem.Value.Equals("ALL"))
            {
                sqlCmd += ", [User]";
            }

            sqlCmd += " WHERE (";

            int countCriteria = 0;
                
            if (!ddlProdCat.SelectedItem.Value.Equals("ALL"))
            {
                sqlCmd += "Product.category_id = Product_Category.id " +
                "AND Product_Category.category_name = @CategoryName";
                countCriteria += 1;
                currentDdlProdCat = ddlProdCat.SelectedIndex;
            }

            if (!ddlArtist.SelectedItem.Value.Equals("ALL"))
            {
                if (countCriteria != 0)
                {
                    sqlCmd += " AND ";
                }
                sqlCmd += "Product.user_id = [User].id " +
                "AND [User].user_name = @ArtistName";
                countCriteria += 1;
                currentDdlArtist = ddlArtist.SelectedIndex;
            }

            if (!ddlProdSize.SelectedItem.Value.Equals("ALL"))
            {
                if (countCriteria != 0)
                {
                    sqlCmd += " AND ";
                }
                sqlCmd += "Product.prod_size = @ProductSize";
                countCriteria += 1;
                currentDdlProdSize = ddlProdSize.SelectedIndex;
            }

            if(!txtMinPR.Text.Equals("") && !txtMinPR.Text.Equals(" "))
            {
                if (countCriteria != 0)
                {
                    sqlCmd += " AND ";
                }
                sqlCmd += "Product.prod_price >= " + (txtMinPR.Text);
                countCriteria += 1;
                currentTxtMinPRange = txtMinPR.Text;
            }

            if (!txtMaxPR.Text.Equals("") && !txtMaxPR.Text.Equals(" "))
            {
                if (countCriteria != 0)
                {
                    sqlCmd += " AND ";
                }
                sqlCmd += "Product.prod_price <= " + (txtMaxPR.Text);
                countCriteria += 1;
                currentTxtMaxPRange = txtMaxPR.Text;
            }

            if(!txtProdName.Text.Equals("") && !txtProdName.Text.Equals(" "))
            {
                if (countCriteria != 0)
                {
                    sqlCmd += " AND ";
                }
                sqlCmd += "Product.prod_name LIKE \'%" + (txtProdName.Text) + "%\'";
                countCriteria += 1;
                currentTxtProdName = txtProdName.Text;
            }

            if (countCriteria == 0)
            {
                sqlCmd = "SELECT DISTINCT id, prod_name, prod_image" +
                " FROM Product" +
                " ORDER BY prod_name";
            }
            else
            {
                sqlCmd += ")" +
                " ORDER BY [prod_name]";
            }


            using (SqlDataAdapter sda = new SqlDataAdapter(sqlCmd, conn))
            {
                sda.SelectCommand.CommandType = CommandType.Text;
                if (!ddlProdCat.SelectedItem.Value.Equals("ALL"))
                {
                    sda.SelectCommand.Parameters.AddWithValue("@CategoryName", ddlProdCat.SelectedItem.Value.ToString());

                }

                if (!ddlArtist.SelectedItem.Value.Equals("ALL"))
                {
                    sda.SelectCommand.Parameters.AddWithValue("@ArtistName", ddlArtist.SelectedItem.Value.ToString());

                }

                if (!ddlProdSize.SelectedItem.Value.Equals("ALL"))
                {
                    sda.SelectCommand.Parameters.AddWithValue("@ProductSize", ddlProdSize.SelectedItem.Value.ToString());

                }

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

            ddlProdCat.SelectedIndex = currentDdlProdCat;
            ddlArtist.SelectedIndex = currentDdlArtist;
            ddlProdSize.SelectedIndex = currentDdlProdSize;
            txtMinPR.Text = currentTxtMinPRange;
            txtMaxPR.Text = currentTxtMaxPRange;
            txtProdName.Text = currentTxtProdName;
            conn.Close();
        }

        //Go to filter the datalist 
        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            FilterDLProd();
        }
    }
}
