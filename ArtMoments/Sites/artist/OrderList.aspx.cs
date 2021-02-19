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
        string connectionString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        string sortExpression = null;
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
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT O.id as [ID], P.prod_name as [ProdName], C.category_name as [Category], O.quantity as [Qty], U.user_name as [Customer], T.date_order as [DateOrder], D.deliver_type as [DeliveryChannel], O.date_delivery as [DateDelivery], O.order_status as [OrderStatus] FROM[ArtMomentsDb].[dbo].[Product] P, [ArtMomentsDb].[dbo].[Delivery] D, [ArtMomentsDb].[dbo].[Product_Category] C, [ArtMomentsDb].[dbo].[Order] O, [ArtMomentsDb].[dbo].[User] A, [ArtMomentsDb].[dbo].[User] U,[ArtMomentsDb].[dbo].[Transaction] T WHERE P.category_id = C.id AND O.product_id = P.id AND T.id = O.transaction_id AND O.delivery_id = D.id AND T.user_id = u.id AND A.id = P.user_id AND A.user_name = @name ", conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);                  
                            orderList.DataSource = dt;
                            orderList.DataBind();
                        }
                    }
                }
                //Session["SortedOrderView"] = null;
                //Session["SearchOrderView"] = null;
                //Session["SortedSearchOrderView"] = null;

            }

        }

        private void SearchProduct()   //search product
        {
            if (Session["SortedOrderView"] != null)
            {
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))  //check whether the search input empty or not
                {
                    orderList.DataSource = Session["SortedOrderView"];
                    DataTable dt = new DataTable();
                    dt = (DataTable)orderList.DataSource;
                    DataTable newOrderTable = CreateNewTable();
                    string searchText = txtSearch.Text.ToString().ToLower();
                    foreach (DataRow orderTableRow in dt.Rows)
                    {
                        string prodName = orderTableRow.Field<string>("ProdName").ToLower();
                        if (prodName.Contains(searchText))
                        {
                            newOrderTable.Rows.Add(orderTableRow.ItemArray);
                        }

                    }
                    orderList.DataSource = newOrderTable;
                    Session["searchOrderView"] = newOrderTable;
                    orderList.DataBind();
                }
                else
                {

                    orderList.DataSource = Session["SortedOrderView"];
                    orderList.DataBind();
                }
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT O.id as [ID], P.prod_name as [ProdName], C.category_name as [Category], O.quantity as [Qty], U.user_name as [Customer], T.date_order as [DateOrder], D.deliver_type as [DeliveryChannel], O.date_delivery as [DateDelivery], O.order_status as [OrderStatus] FROM[ArtMomentsDb].[dbo].[Product] P, [ArtMomentsDb].[dbo].[Delivery] D, [ArtMomentsDb].[dbo].[Product_Category] C, [ArtMomentsDb].[dbo].[Order] O, [ArtMomentsDb].[dbo].[User] A, [ArtMomentsDb].[dbo].[User] U,[ArtMomentsDb].[dbo].[Transaction] T WHERE P.category_id = C.id AND O.product_id = P.id AND T.id = O.transaction_id AND O.delivery_id = D.id AND T.user_id = u.id AND A.id = P.user_id AND A.user_name = @name AND P.prod_name like '%' + @productName + '%'", conn))
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
                        Session["searchOrderView"] = dt;
                        orderList.DataSource = dt;
                        orderList.DataBind();
                    }
                }
                if (string.IsNullOrEmpty(txtSearch.Text.Trim()))  //check whether the search input empty or not
                {
                    Session["SortedOrderView"] = null;
                    Session["searchOrderView"] = null;
                    Session["SortedSearchOrderView"] = null;
                }
            }
        }
        private DataTable CreateNewTable()
        {
            DataTable newOrderTable = new DataTable();
            // Declare DataColumn and DataRow variables.
            DataColumn column;

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.ColumnName = "ID";
            newOrderTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "ProdName";
            newOrderTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "Category";
            newOrderTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.Int32");
            column.ColumnName = "Qty";
            newOrderTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "Customer";
            newOrderTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.DateTime");
            column.ColumnName = "DateOrder";
            newOrderTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "DeliveryChannel";
            newOrderTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.DateTime");
            column.ColumnName = "DateDelivery";
            newOrderTable.Columns.Add(column);

            // Create second column.
            column = new DataColumn();
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "OrderStatus";
            newOrderTable.Columns.Add(column);

            return newOrderTable;
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e) //change to another page of table
        {
            orderList.PageIndex = e.NewPageIndex;
            if (Session["SortedOrderView"] != null)
            {
                orderList.DataSource = Session["SortedOrderView"];
                orderList.DataBind();
            }
            else if(Session["SearchOrderView"] != null)
            {
                orderList.DataSource = Session["SearchOrderView"];
                orderList.DataBind();
            }
            else if (Session["SortedSearchOrderView"] != null)
            {
                orderList.DataSource = Session["SortedSearchOrderView"];
                orderList.DataBind();
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT O.id as [ID], P.prod_name as [ProdName], C.category_name as [Category], O.quantity as [Qty], U.user_name as [Customer], T.date_order as [DateOrder], D.deliver_type as [DeliveryChannel], O.date_delivery as [DateDelivery], O.order_status as [OrderStatus] FROM[ArtMomentsDb].[dbo].[Product] P, [ArtMomentsDb].[dbo].[Delivery] D, [ArtMomentsDb].[dbo].[Product_Category] C, [ArtMomentsDb].[dbo].[Order] O, [ArtMomentsDb].[dbo].[User] A, [ArtMomentsDb].[dbo].[User] U,[ArtMomentsDb].[dbo].[Transaction] T WHERE P.category_id = C.id AND O.product_id = P.id AND T.id = O.transaction_id AND O.delivery_id = D.id AND T.user_id = u.id AND A.id = P.user_id AND A.user_name = @name ", conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("@name", Session["UserName"]);
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            orderList.DataSource = dt;
                            orderList.DataBind();
                        }
                    }
                }
            }
        }
        protected void OnSorting(object sender, GridViewSortEventArgs e)  //sorting the table
        {
            sortExpression = e.SortExpression;
            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))  //check whether the search input empty or not
            {
                if (sortExpression != null)
                {
                    orderList.DataSource = Session["searchOrderView"];
                    DataTable dt = orderList.DataSource as DataTable;
                    DataView dataview = dt.AsDataView();
                    if (this.SortDirection == "ASC")
                    {
                        this.SortDirection = "DESC";
                    }
                    else
                        this.SortDirection = "ASC";

                    dataview.Sort = sortExpression + " " + this.SortDirection;
                    Session["SortedSearchOrderView"] = dataview.ToTable();
                    orderList.DataSource = dataview;
                }
                else
                {
                    //Session["SortedOrderView"] = null;
                   // Session["SortedSearchOrderView"] = null;
                    orderList.DataSource = Session["searchOrderView"];
                }
                orderList.DataBind();
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT O.id as [ID], P.prod_name as [ProdName], C.category_name as [Category], O.quantity as [Qty], U.user_name as [Customer], T.date_order as [DateOrder], D.deliver_type as [DeliveryChannel], O.date_delivery as [DateDelivery], O.order_status as [OrderStatus] FROM[ArtMomentsDb].[dbo].[Product] P, [ArtMomentsDb].[dbo].[Delivery] D, [ArtMomentsDb].[dbo].[Product_Category] C, [ArtMomentsDb].[dbo].[Order] O, [ArtMomentsDb].[dbo].[User] A, [ArtMomentsDb].[dbo].[User] U,[ArtMomentsDb].[dbo].[Transaction] T WHERE P.category_id = C.id AND O.product_id = P.id AND T.id = O.transaction_id AND O.delivery_id = D.id AND T.user_id = u.id AND A.id = P.user_id AND A.user_name = @name ", conn))
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
                                Session["SortedOrderView"] = dataview.ToTable();
                                orderList.DataSource = dataview;
                            }
                            else
                            {
                                Session["SortedOrderView"] = null;
                                Session["SortedSearchOrderView"] = null;
                                Session["SearchOrderView"] = null;
                                orderList.DataSource = dt;
                            }
                            orderList.DataBind();
                        }
                    }
                }
            }
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
          
        }
    }
}