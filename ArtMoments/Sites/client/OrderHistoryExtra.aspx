<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Client1.Master" AutoEventWireup="true" CodeBehind="OrderHistoryExtra.aspx.cs" Inherits="ArtMoments.Sites.client.OrderHistoryExtra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        div.orderHistoryDetail {
            margin-top: 20px;
        }

        div.orderHistoryContainer{
            padding-bottom: 12px;
            border-radius: 7px;
        }

        span#ContentPlaceHolder1_lbladorderStatus {
            font-size: 10px;
            border-radius: 15px;
            padding-left: 5px;
            padding-right: 5px;
            margin-right: 8px;
        }

        .row.sizeCategoryAuthor {
            font-size: 13px;
            color: darkgray;
            padding-top: 8px;
        }

        .row.sizeCategoryAuthorDB {
            margin-top: -5px;
            font-size: 18px;
        }

        .row.qtyPriceMore {
            padding-top: 17px;
            color: darkgray;
            font-size: 13px;
        }

        .row.qtyPriceMoreDB {
            margin-top: -5px;
            font-size: 18px;
        }

        div.orderHistoryDetail {
            margin-top: 32px;
        }

        .row.float-right.deliveryStatus {
            border-radius: 10px;
            margin-top: -20px;
            margin-right: -5px;
        }

        span#ContentPlaceHolder1_lbladorderStatus {
            padding-left: 7px;
            padding-right: 7px;
            font-size: 13px;
            border-radius: 10px;
            padding-bottom: 1px;
            padding-top: 1px;
        }

        .row.justify-content-center {
            margin-top: 40px;
            margin-bottom: 30px;
            color: white;
        }

        .container.transactionHistoryContainer {
            margin-top: 60px;
        }

        div {
            display: block;
        }

        .container{
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }

        .col-lg-4, .col-md-12, .col-sm-12, .col-lg-8, .col {
            position: relative;
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
        }

        .row {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
        }

        #ibimgdbArtwork {
            max-width: 200px;
            max-height: 200px;
        }

        #lbladorderStatus{
            color:#fff;
            background-color:#28a745;
            border-color:#28a745;
            font-size: 13px;
            border-radius: 8px;
            padding-left:5px;
            padding-right:5px;
        }
       
        .lblTransacTotalPrice{
            float:right;
        }

        .row.artNameRow {
            font-size: 25px;
            font-weight: bold;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 3px;
            padding-bottom: 3px;
            border-radius: 40px;
            font-weight: 400;
            cursor: pointer
        }

        h4 {
            padding-left: 25px;
        }

        .container.transactionHistoryContainer {
            border-bottom: groove;
        }

        .orderHistoryHeader {
            color: black;
        }

        span#ContentPlaceHolder1_ListViewOrderHistory_defaultItem {
            margin-left: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- header -->
    <header>
        <div class="row justify-content-center">
            <h1 class="orderHistoryHeader">Order History</h1>
        </div>
    </header>
    <asp:ListView ID="ListViewOrderHistory" runat="server" DataSourceID="SqlDataSourceOrderHistory">
        <ItemTemplate>
            <div class="container transactionHistoryContainer">
                <div class="row">
                    <!-- Transaction id -->
                    <h2><asp:Label ID="lblTransacTxt" runat="server" Text='Transaction ID:'/></asp:Label><asp:Label ID="lblTransacId" runat="server" Text='<%# Eval("transaction_id") %>'/></asp:Label></h2>
                </div>
              
                <div class="container align-content-sm-center orderHistoryContainer">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12 orderHistoryRowDiv">
                            <!-- Ordernum N Artwork -->
                            <div class="col justify-content-center orderNumnArt">
                                <!-- Ordernum -->
                                <div class="row">
                                    <asp:Label ID="lblOrderIdTxt" runat="server" Text="Order ID: " />
                                    <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("order_id") %>' />
                                </div>
                                <!-- Artwork -->
                                    <asp:ImageButton ID="BtnProdImg" runat="server" style="max-height:200px; max-width:200px"  OnClick="viewProdImg" ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_image")) %>' />
                            </div>
                        </div>
                        <!-- Orderhistory Details -->
                        <div class="col-lg-8 orderHistoryDetail">
                        <!-- Delivery Status -->
                        <div class="row  float-right deliveryStatus">
                            <asp:Label ID="lblOrderStatus" runat="server" Text='<%# Eval("order_status") %>' />
                        </div>
                        <!-- Artname -->
                        <div class="row artNameRow">
                            <asp:Label ID="lblProdName" runat="server" Text='<%# Eval("prod_name") %>' /><asp:Label ID="lblProdId" style="font-size:0px" runat="server" Text='<%# Eval("prod_id") %>' />
                        </div>

                        <!-- Size, Category, Author label -->
                        <div class="row sizeCategoryAuthor">
                            <div class="col" id="sizeDivision">
                                <label id="lblSizeTxt">Size</label>
                            </div>
                            <div class="col" id="categoryDivision">
                                <label id="lblCategoryTxt">Category</label>
                            </div>
                            <div class="col" id="authorDivision">
                                <label id="lblAuthorTxt">Author</label>
                            </div>
                        </div>

                        <!-- Size, Category, Author from db -->
                        <div class="row sizeCategoryAuthorDB">
                            <div class="col" id="lblsizeDivision">
                                <asp:Label ID="lblProdSize" runat="server" Text='<%# Eval("prod_size") %>' />
                            </div>
                            <div class="col" id="lblcategorryDivision">
                                <asp:Label ID="lblCatName" runat="server" Text='<%# Eval("category_name") %>' />
                            </div>
                            <div class="col" id="lblauthorDivision">
                                <asp:Label ID="lblAuthorName" runat="server" Text='<%# Eval("user_name") %>' />
                            </div>
                        </div>   

                        <!-- Qty, Price, order date label -->
                        <div class="row qtyPriceMore">
                            <div class="col" id="qtyDivision">
                                <label id="lblQtyTxt">Quantity</label>
                            </div>
                            <div class="col" id="priceDivision">
                                <label id="lblPriceTxt">RM </label>
                            </div>
                            <div class="col" id="modeDetailsRow">
                                <asp:Label ID="lblOrderDateTxt" runat="server" Text='Order by: ' /><asp:Label ID="lblOrderDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"order_date","{0:MM/dd/yyyy}") %>' />
                            </div>
                        </div>

                        <!-- Qty, Price, view more details label from db-->
                        <div class="row qtyPriceMoreDB">
                            <div class="col" id="lblqtyDivision">
                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("quantity") %>' />
                            </div>
                            <div class="col" id="lblpriceDivision">
                                <asp:Label ID="lblProdPrice" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"subtotal","{0:f}") %>' />
                            </div>
                            <div class="col" id="btnBuyAgainDivision">
                                <asp:Button ID="btnBuyAgain" runat="server" Text="BUY AGAIN" class="btn-primary rounded" OnClick="viewProdBtn"/>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
    <!-- display if there is no history for the buyer -->
    <EmptyDataTemplate>
            <asp:Label ID="defaultItem" runat="server" 
                Visible='<%# ListViewOrderHistory.Items.Count == 0 %>' Text="No items found" />
    </EmptyDataTemplate>
                
    <LayoutTemplate>
        <div id="itemPlaceholderContainer" runat="server" style="">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div style="">
            <asp:DataPager ID="DataPagerOrderHistory" runat="server">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
               
</asp:ListView>

    <asp:SqlDataSource ID="SqlDataSourceOrderHistory" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT T.id as transaction_id, T.date_order as order_date, O.id AS order_id, P.id as prod_id , P.prod_name as prod_name, P.prod_size as prod_size, P.prod_image as prod_image, P.prod_price as prod_price, A.user_name as user_name, C.category_name as category_name,  O.quantity as quantity, O.order_status as order_status, (O.quantity*P.prod_price) as subtotal FROM [Transaction] AS T INNER JOIN [Order] AS O ON T.id = O.transaction_id INNER JOIN Product AS P ON P.id = O.product_id INNER JOIN [User] AS A ON A.id = P.user_id INNER JOIN Product_Category AS C ON C.id = P.category_id WHERE T.user_id = @UserName ORDER BY T.id DESC">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="4" Name="UserName" SessionField="UserName" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
