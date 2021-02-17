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
    public partial class OrderList : System.Web.UI.Page
    {
        string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("../usermgmt/PreLogin.aspx");
                }

                this.BindGrid();

            }
        }
        private void BindGrid(string sortExpression = null)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT O.id as [ID], P.prod_name as [ProdName], C.category_name as [Category], O.quantity as [Qty], U.user_name as [Customer], T.date_order as [DateOrder], O.deliver_channel as [DeliveryChannel], O.date_delivery as [DateDelivery], O.order_status as [OrderStatus] " +
                    "FROM Product P, Product_Category C, [ArtMomentsDb].[dbo].[Order] O, [ArtMomentsDb].[dbo].[User] A, [ArtMomentsDb].[dbo].[User] U,[ArtMomentsDb].[dbo].[Transaction] T " +
                    "WHERE A.id = P.user_id AND A.user_name = @name  AND P.category_id = C.id AND O.product_id = P.id AND T.id = O.transaction_id AND T.user_id = u.id", conn))
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
                            orderList.DataSource = dataview;
                        }
                        else
                        {
                            orderList.DataSource = dt;
                        }
                        orderList.DataBind();
                    }
                }
            }

        }

        private void SearchProduct()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT O.id as [ID], P.prod_name as [ProdName], C.category_name as [Category], O.quantity as [Qty], U.user_name as [Customer], T.date_order as [DateOrder], O.deliver_channel as [DeliveryChannel], O.date_delivery as [DateDelivery], O.order_status as [OrderStatus] " +
                    "FROM Product P, Product_Category C, [ArtMomentsDb].[dbo].[Order] O, [ArtMomentsDb].[dbo].[User] A, [ArtMomentsDb].[dbo].[User] U,[ArtMomentsDb].[dbo].[Transaction] T " +
                    "WHERE A.id = P.user_id AND A.user_name = @name  AND P.category_id = C.id AND O.product_id = P.id AND T.id = O.transaction_id AND T.user_id = u.id AND P.prod_name like '%' + @productName + '%'", conn))
                {
                    sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                    string emptyValue = "";
                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {

                        sda.SelectCommand.Parameters.AddWithValue("@productName", txtSearch.Text.Trim());
                    }
                    else
                        sda.SelectCommand.Parameters.AddWithValue("@productName", emptyValue);

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    orderList.DataSource = dt;
                    orderList.DataBind();
                }
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            orderList.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            this.BindGrid(e.SortExpression);
        }
        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                
            }
        }

        protected void Search(object sender, EventArgs e)
        {
            this.SearchProduct();
        }

        protected void OnSelectedIndexChanged(Object sender, EventArgs e)
        {
            string prodID = orderList.SelectedRow.Cells[0].Text;
            Application["prodID"] = prodID;
            Response.Redirect("EditProduct.aspx");
        }
    }
}