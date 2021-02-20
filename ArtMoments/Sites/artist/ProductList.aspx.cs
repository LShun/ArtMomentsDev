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
        string connectionString =
            ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;

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
                    using (SqlDataAdapter sda = new SqlDataAdapter(
                        "SELECT P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                        ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C, [User] U WHERE U.id = P.user_id AND U.user_name = @name AND P.category_id = C.id",
                        conn))
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
            //check whether the table is sorted
            if (Session["SortedProductView"] != null) // the table is sorted
            {
                //check whether the search input empty or not
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim())) //the search is not empty
                {
                    productList.DataSource = Session["SortedProductView"];
                    DataTable prodTable = new DataTable();
                    prodTable = (DataTable) productList.DataSource;
                    DataTable newProdTable = CreateNewTable();

                    string searchText = txtSearch.Text.ToString().ToLower(); //make the text in the search lower case
                    foreach (DataRow productTableRow in prodTable.Rows)
                    {
                        string prodName =
                            productTableRow.Field<string>("Name")
                                .ToLower(); //make the text in the orderTableRow lower case
                        if (prodName.Contains(searchText))
                        {
                            newProdTable.Rows.Add(productTableRow.ItemArray);
                        }
                    }

                    productList.DataSource = newProdTable;
                    Session["searchProductView"] = newProdTable;
                    ViewState["hasSearchProd"] = true;
                    productList.DataBind();
                }
                else
                {
                    productList.DataSource = Session["SortedProductView"];
                    productList.DataBind();
                    ViewState["hasSearchProd"] = null;
                }
            }
            else //the table is not sorted
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(
                        "select P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                        ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C , [ArtMomentsDb].[dbo].[User] U where U.id = P.user_id AND U.user_name = @name AND P.category_id = C.id and P.prod_name like '%' + @productName + '%'",
                        conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                        string emptyValue = "";
                        if (!string.IsNullOrEmpty(txtSearch.Text.Trim())) //check whether the search input empty or not
                        {
                            sda.SelectCommand.Parameters.AddWithValue("@productName", txtSearch.Text.Trim());
                        }
                        else
                            sda.SelectCommand.Parameters.AddWithValue("@productName", emptyValue);

                        DataTable prodTable = new DataTable();
                        sda.Fill(prodTable);
                        Session["searchProductView"] = prodTable;
                        productList.DataSource = prodTable;
                        productList.DataBind();
                        ViewState["hasSearchProd"] = true;
                    }
                }

                /*when the table is not sorted and searched*/
                if (string.IsNullOrEmpty(txtSearch.Text.Trim())) //check whether the search input empty or not
                {
                    Session["SortedProductView"] = null;
                    ViewState["hasSearchProd"] = null;
                }
            }
        }

        private DataTable CreateNewTable()
        {
            DataTable newProductTable = new DataTable();
            // Declare DataColumn and DataRow variables.
            DataColumn column;

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.ColumnName = "ID";
            newProductTable.Columns.Add(column);

            // Create first column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "Name";
            newProductTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "Size";
            newProductTable.Columns.Add(column);

            // Create third column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "Description";
            newProductTable.Columns.Add(column);

            // Create fourth column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "CategoryName";
            newProductTable.Columns.Add(column);

            // Create fifth column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.Byte[]");
            column.ColumnName = "Image";
            newProductTable.Columns.Add(column);

            // Create sixth column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.Single");
            column.ColumnName = "Price";
            newProductTable.Columns.Add(column);

            // Create seventh column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.Int32");
            column.ColumnName = "Stock";
            newProductTable.Columns.Add(column);

            // Create eighth column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.Int32");
            column.ColumnName = "Sales";
            newProductTable.Columns.Add(column);

            return newProductTable;
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e) //change to another page of table
        {
            productList.PageIndex = e.NewPageIndex;
            if ((ViewState["hasSortedProd"] != null) && (ViewState["hasSearchProd"] != null)
            ) //table is sorted and search
            {
                productList.DataSource = Session["SortedSearchProductView"];
                productList.DataBind();
            }
            else if (ViewState["hasSortedProd"] != null) //table is sorted
            {
                productList.DataSource = Session["SortedProductView"];
                productList.DataBind();
            }
            else if (ViewState["hasSearchProd"] != null) //table is search
            {
                productList.DataSource = Session["SearchProductView"];
                productList.DataBind();
            }
            else //table is not sorted and search
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(
                        "SELECT P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                        ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C, [User] U WHERE U.id = P.user_id AND U.user_name = @name AND P.category_id = C.id",
                        conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                        using (DataTable prodTable = new DataTable())
                        {
                            sda.Fill(prodTable);
                            productList.DataSource = prodTable;
                            productList.DataBind();
                        }
                    }
                }
            }
        }

        protected void OnSorting(object sender, GridViewSortEventArgs e) //sorting the table
        {
            sortExpression = e.SortExpression;
            if (!string.IsNullOrEmpty(txtSearch.Text.Trim())) //check whether the search input empty or not
            {
                if (sortExpression != null)
                {
                    productList.DataSource = Session["searchProductView"];
                    DataTable prodTable = productList.DataSource as DataTable;
                    DataView dataview = prodTable.AsDataView();
                    if (this.SortDirection == "ASC")
                    {
                        this.SortDirection = "DESC";
                    }
                    else
                        this.SortDirection = "ASC";

                    dataview.Sort = sortExpression + " " + this.SortDirection;
                    Session["SortedSearchProductView"] = dataview.ToTable();
                    productList.DataSource = dataview;
                    ViewState["hasSortedProd"] = true;
                }
                else
                {
                    productList.DataSource = Session["searchProductView"];
                    ViewState["hasSortedProd"] = null;
                }

                productList.DataBind();
            }
            else // the search input empty
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(
                        "SELECT P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                        ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C, [User] U WHERE U.id = P.user_id AND U.user_name = @name AND P.category_id = C.id",
                        conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                        using (DataTable prodTable = new DataTable())
                        {
                            sda.Fill(prodTable);
                            if (sortExpression != null)
                            {
                                DataView dataview = prodTable.AsDataView();
                                if (this.SortDirection == "ASC")
                                {
                                    this.SortDirection = "DESC";
                                }
                                else
                                    this.SortDirection = "ASC";

                                dataview.Sort = sortExpression + " " + this.SortDirection;
                                Session["SortedProductView"] = dataview.ToTable();
                                productList.DataSource = dataview;
                                ViewState["hasSortedProd"] = true;
                            }
                            else
                            {
                                Session["SortedProductView"] = null;
                                productList.DataSource = prodTable;
                                ViewState["hasSortedProd"] = null;
                            }

                            productList.DataBind();
                        }
                    }
                }
            }
        }

        protected void addProdBtn_Click(Object sender, EventArgs e) //add button is clicked
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rowProdTable = (DataRowView) e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[]) rowProdTable["Image"]);
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