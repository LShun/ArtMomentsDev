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
using System.Text;

namespace ArtMoments.Sites.artist
{

    public partial class ProductList : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        string sortExpression = null;
        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("../usermgmt/PreLogin.aspx");
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                        ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C, [User] U WHERE U.id = P.user_id AND U.user_name = @name AND P.category_id = C.id", conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            productList.DataSource = dt;
                            productList.DataBind();
                        }
                    }
                }

            }
        }


        private void SearchProduct()
        {

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("select P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                     ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C , [ArtMomentsDb].[dbo].[User] U where U.id = P.user_id AND U.user_name = @name AND P.category_id = C.id and P.prod_name like '%' + @productName + '%'", conn))
                {
                    sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                    string emptyValue = "";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))  //check whether the search input empty or not
                    {

                        sda.SelectCommand.Parameters.AddWithValue("@productName", txtSearch.Text.Trim());
                    }
                    else
                        sda.SelectCommand.Parameters.AddWithValue("@productName", emptyValue);

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Session["searchView"] = dt;

                    productList.DataSource = dt;
                    productList.DataBind();
                }
            }

            if (string.IsNullOrEmpty(txtSearch.Text.Trim()))  //check whether the search input empty or not
            {
                Session["SortedView"] = null;
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e) //change to another page of table
        {
            productList.PageIndex = e.NewPageIndex;
            if (Session["SortedView"] != null)
            {
                productList.DataSource = Session["SortedView"];
                productList.DataBind();
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                        ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C, [User] U WHERE U.id = P.user_id AND U.user_name = @name AND P.category_id = C.id", conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            productList.DataSource = dt;
                            productList.DataBind();
                        }
                    }
                }
            }
        }
        protected void OnSorting(object sender, GridViewSortEventArgs e) //sorting the table
        {
            sortExpression = e.SortExpression;
            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))  //check whether the search input empty or not
            {
                if (sortExpression != null)
                {
                    productList.DataSource = Session["searchView"];
                    DataTable dt = productList.DataSource as DataTable;
                    DataView dataview = dt.AsDataView();
                    if (this.SortDirection == "ASC")
                    {
                        this.SortDirection = "DESC";
                    }
                    else
                        this.SortDirection = "ASC";

                    dataview.Sort = sortExpression + " " + this.SortDirection;
                    Session["SortedView"] = dataview;
                    productList.DataSource = dataview;
                }
                else
                {
                    Session["SortedView"] = null;
                    productList.DataSource = Session["searchView"];
                }
                productList.DataBind();
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                        ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C, [User] U WHERE U.id = P.user_id AND U.user_name = @name AND P.category_id = C.id", conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            if (sortExpression != null)
                            {
                                DataView dataview = dt.AsDataView();
                                if (this.SortDirection == "ASC")
                                {
                                    this.SortDirection = "DESC";
                                }
                                else
                                    this.SortDirection = "ASC";

                                dataview.Sort = sortExpression + " " + this.SortDirection;
                                Session["SortedView"] = dataview;
                                productList.DataSource = dataview;
                            }
                            else
                            {
                                Session["SortedView"] = null;
                                productList.DataSource = dt;
                            }
                            productList.DataBind();
                        }
                    }
                }
            }
        }
        protected void addProdBtn_Click(Object sender, EventArgs e)  //add button is clicked
        {
            Response.Redirect("AddProduct.aspx");
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Image"]);
                (e.Row.FindControl("prodImage") as Image).ImageUrl = imageUrl;
            }
        }

        protected void Search(object sender, EventArgs e)
        {
            this.SearchProduct();
        }

        protected void OnSelectedIndexChanged(Object sender, EventArgs e)
        {
            string prodID = productList.SelectedRow.Cells[0].Text;
            Application["prodID"] = prodID;
            Response.Redirect("EditProduct.aspx");
        }
    }
}