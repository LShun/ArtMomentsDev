using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using Image = System.Web.UI.WebControls.Image;

namespace ArtMoments.Sites.client
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        string conString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["CustId"] = 1;
                if (Session["CustId"] != null)
                {
                    DataTable transacTable = getTransacTable();
                    int transacRow = 0;
                    foreach (DataRow row in transacTable.Rows)
                    {
                        int TransacId = row.Field<int>("transac-id");
                        DateTime TransacDate = row.Field<DateTime>("order-date");


                        DataTable orderTable = getOrderTable(TransacId);

                        //update delivery details
                        chkDispatchOrder(orderTable, TransacDate,TransacId);

                        ////display HTML
                        displayInHTML(TransacId, orderTable);
                        
                        transacRow++;
                    }
                }
            }

        }
        protected DataTable getTransacTable()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("select id as [transac-id], user_id as [user-id], date_order as [order-date] from [Transaction] where user_id like @CustId"))
                {
                    cmd.Parameters.AddWithValue("@CustId", (String)Session["CustId"].ToString());
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable custTransac = new DataTable())
                        {
                            sda.Fill(custTransac);

                            return custTransac;
                        }
                    }
                }
            }
        }

        protected DataTable getOrderTable(int TransacId)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("select id as [order-id], product_id as [order-id], quantity as [order-qty], delivery_id as [order-deliverId], date_delivery as [order-deliverDate], order_status as [order-status], date_received as [order-dateReceive], O.transaction_id as [transac-id] from [Order] O where O.transaction_id like @TransacId"))
                {
                    cmd.Parameters.AddWithValue("@TransacId", TransacId);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable custOrder = new DataTable())
                        {
                            sda.Fill(custOrder);
                            return custOrder;
                        }
                    }
                }
            }
        }

        protected void chkDispatchOrder(DataTable orderTable, DateTime TransacDate, int TransacId)
        {
            int rowCount = 0;
            foreach (DataRow row in orderTable.Rows)
            {
                DateTime todayDT = DateTime.Now;
                DateTime orderDT = TransacDate;
                //DateTime orderDT = transacTable.Rows[rowCount].Field<DateTime>(3);
                DateTime deliveredDT = orderDT.AddDays(8);
                DateTime dispatchDT = orderDT.AddDays(3);
                int updateDeliveryInfo = 0;
                // if more than 8 days and null 2-> process 2 if null 1, process 1. if not null -> no need to process
                // if more than 3 days and null -> process 1 

                if (dispatchDT <= todayDT)
                {
                    updateDeliveryInfo = 1;
                    if (deliveredDT <= todayDT)
                    {
                        updateDeliveryInfo = 2;
                    }
                    updateDeliveryStatus(orderTable, updateDeliveryInfo, dispatchDT, deliveredDT, TransacId);
                }
                rowCount++;
            }
        }

        protected void updateDeliveryStatus(DataTable orderTable, int delivery2Update, DateTime dispatchDT, DateTime deliveredDT, int TransacId)
        {
            int rowCount = 0;
            foreach (DataRow row in orderTable.Rows)
            {
                DateTime? dbdeliveredDT = row.Field<DateTime?>("order-deliverDate");
                DateTime? dbdispatchDT = row.Field<DateTime?>("order-dateReceive");

                if (!dbdeliveredDT.HasValue && delivery2Update == 1)
                {
                    SqlConnection conn = new SqlConnection(conString);
                    conn.Open();
                    string updateDeliverDTQuery = @"update [Order] set date_delivery = @DispatchDT, order_status = @OrderStatus where date_delivery IS NULL and @TransacId like transaction_id";
                    using (SqlCommand cmd = new SqlCommand(updateDeliverDTQuery, conn))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('success get order info')", true);
                        cmd.Parameters.AddWithValue("@TransacId", TransacId);
                        cmd.Parameters.AddWithValue("@DispatchDT", dispatchDT);
                        cmd.Parameters.AddWithValue("@OrderStatus", "Dispatched");
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
                if (!dbdispatchDT.HasValue && delivery2Update == 2)
                {
                    SqlConnection conn = new SqlConnection(conString);
                    conn.Open();
                    string updateReceivedDTQuery = @"update [Order] set date_received = @deliveredDT, order_status = @OrderStatus where date_received IS NULL and @TransacId like transaction_id";
                    using (SqlCommand cmd = new SqlCommand(updateReceivedDTQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@TransacId", TransacId);
                        cmd.Parameters.AddWithValue("@deliveredDT", deliveredDT);
                        cmd.Parameters.AddWithValue("@OrderStatus", "Delivered");
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
                if (dbdeliveredDT.HasValue && dbdispatchDT.HasValue)
                {
                    break;
                }
                rowCount++;
            }
        }
        protected string calcPrice(int qty, Double price)
        {
            Double subtotal = (qty * price);
            return subtotal.ToString("0.00");
        }
        protected void displayInHTML(int transacId, DataTable orderTable)
        {
            Double total = 0;
            StringBuilder html = new StringBuilder();

            html.Append("<div class='container transactionHistoryContainer'>");
            html.Append("<div class='row'>");
            // Transaction
            html.Append("<h2><asp:Label ID='lbltransacId' runat='server'>");
            // transactionID
            html.Append(transacId);
            html.Append("</asp:Label></h2></div>");
            html.Append("<div class='container align-content-sm-center orderHistoryContainer'>");
            
            // ORDERS
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("select P.id as [prod-id], P.prod_name as [prod-name], P.prod_size as [prod-size], P.prod_description as [prod-descrip], P.prod_image as [prod-img], P.prod_price as [prod-price], U.user_name as [prod-author], C.category_name as [category-name], O.id as [order-id], O.quantity as [order-qty], O.order_status as [order-status], O.transaction_id from"
                                                        + "[Product] P join[Order] O on O.[product_id] = P.id join[Transaction] T on O.transaction_id = T.id join[Product_Category] C on C.id = P.category_id join[User] U on P.user_id = U.id where T.id like @TransacId"))
                {
                    cmd.Parameters.AddWithValue("@TransacId", transacId);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable custTransac = new DataTable())
                        {
                            sda.Fill(custTransac);
                            orderTable = custTransac;
                        }
                    }
                }
            }
           
            foreach (DataRow rows in orderTable.Rows)
            {

                // data to be use
                string orderId = (rows.Field<int>("order-id")).ToString();
                byte[] prodImg = (byte[])rows["prod-img"];

                //String file = "data:image/png;base64," + Convert.ToBase64String(prodImg, Base64FormattingOptions.None);
                //System.Drawing.Image img = (System.Drawing.Image)new Bitmap(file);
                string orderStatus = rows.Field<string>("order-status");
                string prodName = rows.Field<string>("prod-name");
                string prodSize = rows.Field<string>("prod-size");
                string prodCategory = rows.Field<string>("category-name");
                string author = rows.Field<string>("prod-author");
                int qty = rows.Field<int>("order-qty");
                Double prodPrice = rows.Field<System.Double>("prod-price");
                //calculate price
                Double subtotal = (qty * prodPrice);
                string viewMore = "View More Details";
                string buyAgain = "BUY AGAIN";
                total += subtotal;

                // combine order & product
                html.Append("<div class='row'>");
                html.Append("<div class='col-lg-4 col-md-12 col-sm-12 orderHistoryRowDiv'>");
                html.Append("<div class='col justify-content-center orderNumnArt'>");
                html.Append("<div class='row'>");
                html.Append("<h3><asp:Label ID='lbladorderNum' runat='server'>");
                // orderNum
                html.Append(orderId);
                html.Append("</ asp:Label ></h3></div>");

                // ORDER IMG
                string imgArt = "data:Image/png;base64,Convert.ToBase64String((byte[])prodImg";
                var imageString = string.Format("data:image/png;base64,{0}", Convert.ToBase64String(prodImg));
                //html.Append("<asp:Repeater ID = 'Repeater1' runat = 'server' OnItemDataBound = 'repeater_ItemDataBound' >");


                //html.Append("<img src=\"/path/to/image/" +  + "\"></div>")
                //"data:Image/png;base64," + Convert.ToBase64String((byte[])prodImg);
                //ByteArrayOutputStream baos = new ByteArrayOutputStream();
                //yourbitmap.compress(Bitmap.CompressFormat.JPEG, 100, baos);
                ////this will convert image to byte[] 
                //byte[] byteArrayImage = baos.toByteArray();
                //// this will convert byte[] to string
                //String encodedImage = Base64.encodeToString(byteArrayImage, Base64.DEFAULT);

                html.AppendFormat("<img id=\'imgdbArtwork\' u=\'image\' src=\'{0}\' />", ResolveUrl(imageString));

                html.Append("</div></div>");
                // ORDER DETAIL
                html.Append("<div class='col-lg-8 orderHistoryDetail'>");
                // DELIVERY STATUS
                html.Append("<div class='row  float-right deliveryStatus'>");
                html.Append("<asp:Label ID='lbladorderStatus' runat='server' CssClass='btn-success'>");
                html.Append( orderStatus +"</asp:Label>"+ "</div>");
                // ART NAME
                html.Append("<div class='row artNameRow'><asp:Label ID='lbladartName' runat='server' Text ='");
                // art name
                html.Append("' CssClass='h2'>" +prodName + "</asp:Label></div>");
                // Size, Category, Author label
                html.Append("<div class='row sizeCategoryAuthor'><div class='col' id='sizeDivision'><label id ='sizeTxt'>");
                // Size
                html.Append("Size");
                html.Append("</label ></div ><div class='col' id='categoryDivision'><label id ='categoryTxt'>");
                // Category
                html.Append("Category");
                html.Append("</label></div><div class='col' id='authorDivision'><label id='authorTxt'>");
                //Author
                html.Append("Author");
                html.Append("</label></div></div>");
                // Size, Category, Author from db
                html.Append("<div class='row sizeCategoryAuthorDB'><div class='col' id='lblsizeDivision'><asp:Label ID ='lblartworkSize' runat='server' Text='");
                // Size
                html.Append("'>"+ prodSize +"</asp:Label></div><div class='col' id='lblcategorryDivision'><asp:Label ID = 'lblartworkCategory' runat='server' Text='");
                // Category
                html.Append("'>"+prodCategory+"</asp:Label></div><div class='col' id='lblauthorDivision'><asp:Label ID = 'lblauthor' runat='server' Text='");
                //Author
                html.Append("'>"+author+"</asp:Label></div></div>");
                // Qty, Price, view more details label
                html.Append("<div class='row qtyPriceMore'><div class='col' id='qtyDivision'><label id = 'qtyTxt' > Quantity </label></div><div class='col' id='priceDivision'>"
                            + "<label id = 'priceTxt'> RM </label></div><div class='col' id='modeDetailsRow'><a href =# '");
                //more details -> src
                html.Append("'><asp:Label ID = 'lblMoreDetail' runat='server'>"+ viewMore +"</asp:Label></a></div></div>");

                //-Qty, Price, view more details label from db
                html.Append("<div class='row qtyPriceMoreDB'>");
                html.Append("<div class='col' id='lblqtyDivision'>");
                html.Append("<asp:Label ID = 'lblQty' runat='server' Text='");
                // Qty
                html.Append("'>"+qty+"</asp:Label></div><div class='col' id='lblpriceDivision'><asp:Label ID = 'lblTotalPrice' runat='server' Text='");
                // Total Price
                html.Append("'>"+calcPrice(qty,prodPrice)+"</asp:Label></div><div class='col' id='btnBuyAgainDivision'>");
                html.Append("<asp:Button  runat=\"server\" ID=\"btnBuyAgain\" class='btn-primary rounded'>" + buyAgain + "</asp:Button>");
                html.Append("</div></div></div></div>");
                
                // OnClick=\"Button1_Click\"
            }
            html.Append("</div></div>");
            // can display total
            //Append the HTML string to Placeholder.
            ContentPlaceHolder conPlaceHolder = (ContentPlaceHolder)Master.FindControl("ContentPlaceHolder1");
        conPlaceHolder.Controls.Add(new Literal { Text = html.ToString() });
        }
    }

}

