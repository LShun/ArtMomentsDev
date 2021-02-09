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
        string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";

        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                this.BindGrid();
                

                //if (Session["UserName"] == null)
                //{
                //    Response.Redirect("usermgmt/PreLogin.aspx");
                //}


                //using (SqlConnection sqlcon = new SqlConnection(connectionString))
                // {
                //string username = session["username"].tostring();


                //    list<int> useridlist = new list<int>();
                //    string sql = "select id from [user] where user_name = @username";

                //    using (sqlcommand cmd = new sqlcommand(sql, sqlcon))
                //    {
                //        cmd.parameters.addwithvalue("@username", username);
                //        sqlcon.open();
                //        sqldatareader reader = cmd.executereader();
                //        while (reader.read())
                //        {
                //            userid = reader[0].tostring();
                //            //useridlist.add(reader.getint32(0));
                //        }
                //        reader.close();
                //        sqlcon.close();
                //    }

                //}


            }
        }

        private void BindGrid(string sortExpression = null)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("select P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                    ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C where P.category_id = C.id", conn))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        if (sortExpression != null)
                        {
                            DataView dataview = dt.AsDataView();
                            if (this.SortDirection == "ASC") {
                                this.SortDirection = "DESC";
                            } 
                            else 
                                this.SortDirection = "ASC";

                            dataview.Sort = sortExpression + " " + this.SortDirection;
                            productList.DataSource = dataview;
                        }
                        else
                        {
                            productList.DataSource = dt;
                        }
                        productList.DataBind();
                    }
                }
            }

        }

        private void SearchProduct()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("select P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] " +
                     ", P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C where P.category_id = C.id and P.prod_name like @productName + '%'", conn))
                {
                    string emptyValue = "";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {

                        sda.SelectCommand.Parameters.AddWithValue("@productName", txtSearch.Text.Trim());
                    }
                    else
                        sda.SelectCommand.Parameters.AddWithValue("@productName", emptyValue);

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    productList.DataSource = dt;
                    productList.DataBind();
                }
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            productList.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            this.BindGrid(e.SortExpression);
        }
        protected void addProdBtn_Click(Object sender, EventArgs e)
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
    }
}