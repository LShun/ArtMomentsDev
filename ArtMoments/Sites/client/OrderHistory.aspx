<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="ArtMoments.Sites.client.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/OrderHistoryCss.css" />
    <style type="text/css">
        div.orderHistoryDetail {
            margin-top: 20px;
        }

        div.orderHistoryContainer{
            background-color: #f9f9f9;
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
            background-color: paleturquoise;
            color: white;
            text-shadow: 1px 1px black;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <%--<!-- Heading -->
    <header>
        <div class="row justify-content-center">
            <h1 class="orderHistoryHeader">Order History</h1>
        </div>
    </header>
    <!-- Transaction -->
    <div class="container transactionHistoryContainer">
        <div class="row">
            <h2><asp:Label ID="lbltransacId" runat="server" Text="Transaction ID"></asp:Label></h2>
        </div>
        <!-- Order Histories -->
        <div class="container align-content-sm-center orderHistoryContainer">
            <div class="row">
                <div class="col-lg-4 col-md-12 col-sm-12 orderHistoryRowDiv">
                    <!-- Ordernum N Artwork -->
                    <div class="col justify-content-center orderNumnArt">
                        <!-- Ordernum -->
                        <div class="row">
                            <h3><asp:Label ID="lbladorderNum" runat="server" Text="#orderNum"></asp:Label></h3>
                        </div>
                        <!-- Artwork -->
                                <asp:Image ID="imgdbArtwork" runat="server" src="../../Content/sea.jpg" height="200"/>

                    </div>
                </div>
                <!-- Orderhistory Details -->
                <div class="col-lg-8 orderHistoryDetail">
                    <!-- Delivery Status -->
                    <div class="row  float-right deliveryStatus">
                        <asp:Label ID="lbladorderStatus" runat="server" Text="Delivered" CssClass="btn-success"></asp:Label>
                    </div>
                    <!-- Artname -->
                    <div class="row artNameRow">
                        <asp:Label ID="lbladartName" runat="server" Text="ArtName" CssClass="h2"></asp:Label>
                    </div>

                    <!-- Size, Category, Author label -->
                    <div class="row sizeCategoryAuthor">
                        <div class="col" id="sizeDivision">
                            <label id="sizeTxt">Size</label>
                        </div>
                        <div class="col" id="categoryDivision">
                            <label id="categoryTxt">Category</label>
                        </div>
                        <div class="col" id="authorDivision">
                            <label id="authorTxt">Author</label>
                        </div>
                    </div>

                    <!-- Size, Category, Author from db -->
                    <div class="row sizeCategoryAuthorDB">
                        <div class="col" id="lblsizeDivision">
                            <asp:Label ID="lblartworkSize" runat="server" Text="M"></asp:Label>
                        </div>
                        <div class="col" id="lblcategorryDivision">
                            <asp:Label ID="lblartworkCategory" runat="server" Text="category"></asp:Label>
                        </div>
                        <div class="col" id="lblauthorDivision">
                            <asp:Label ID="lblauthor" runat="server" Text="author"></asp:Label>
                        </div>
                    </div>   

                    <!-- Qty, Price, view more details label -->
                    <div class="row qtyPriceMore">
                        <div class="col" id="qtyDivision">
                            <label id="qtyTxt">Quantity</label>
                        </div>
                        <div class="col" id="priceDivision">
                            <label id="priceTxt">RM </label>
                        </div>
                        <div class="col" id="modeDetailsRow">
                            <a href="#"><asp:Label ID="lblMoreDetail" runat="server" Text="View more details"></asp:Label></a>
                        </div>
                    </div>

                    <!-- Qty, Price, view more details label from db-->
                    <div class="row qtyPriceMoreDB">
                        <div class="col" id="lblqtyDivision">
                            <asp:Label ID="Label1" runat="server" Text="5"></asp:Label>
                        </div>
                        <div class="col" id="lblpriceDivision">
                            <asp:Label ID="Label2" runat="server" Text="20.00"></asp:Label>
                        </div>
                        <div class="col" id="btnBuyAgainDivision">
                            <asp:Button ID="btnBuyAgain" runat="server" Text="BUY AGAIN" class="btn-primary rounded"/>
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>

    <!-- Transaction -->
    <div class="container transactionHistoryContainer" id="transactionHistoryContainer2">
        <div class="row">
            <h2><asp:Label ID="Label3" runat="server" Text="Transaction ID"></asp:Label></h2>
        </div>
        <!-- Order Histories -->
        <div class="container orderHistoryContainer" id="orderHistoryContainer2">
            <div class="row">
                <div class="col-lg-4 col-md-12 col-sm-12 orderHistoryRowDiv" id="orderHistoryRowDiv2">
                    <!-- Ordernum N Artwork -->
                    <div class="col justify-content-center orderNumnArt" id="orderNumnArt2">
                        <!-- Ordernum -->
                        <div class="row">
                            <h3><asp:Label ID="Label4" runat="server" Text="#orderNum"></asp:Label></h3>
                        </div>
                        <!-- Artwork -->
                            <asp:Image ID="Image1" runat="server" src="../../Content/swing.jpg" height="200"/>
                    </div>
                </div>
                <!-- Orderhistory Details -->
                <div class="col-lg-8 orderHistoryDetail" id="orderHistoryDetail2">
                    <!-- Delivery Status -->
                    <div class="row  float-right deliveryStatus">
                        <asp:Label ID="Label5" runat="server" Text="Delivered"></asp:Label>
                    </div>
                    <!-- Artname -->
                    <div class="row artNameRow">
                        <asp:Label ID="Label6" runat="server" Text="ArtName" CssClass="h2"></asp:Label>
                    </div>

                    <!-- Size, Category, Author label -->
                    <div class="row sizeCategoryAuthor">
                        <div class="col" id="sizeDivision2">
                            <label id="sizeTxt2">Size</label>
                        </div>
                        <div class="col" id="categoryDivision2">
                            <label id="categoryTxt2">Category</label>
                        </div>
                        <div class="col" id="authorDivision2">
                            <label id="authorTxt2">Author</label>
                        </div>
                    </div>

                    <!-- Size, Category, Author from db -->
                    <div class="row sizeCategoryAuthorDB">
                        <div class="col" id="lblsizeDivision2">
                            <asp:Label ID="Label7" runat="server" Text="M"></asp:Label>
                        </div>
                        <div class="col" id="lblcategorryDivision2">
                            <asp:Label ID="Label8" runat="server" Text="category"></asp:Label>
                        </div>
                        <div class="col" id="lblauthorDivision2">
                            <asp:Label ID="Label9" runat="server" Text="author"></asp:Label>
                        </div>
                    </div>   

                    <!-- Qty, Price, view more details label -->
                    <div class="row qtyPriceMore">
                        <div class="col" id="qtyDivision2">
                            <label id="qtyTxt2">Quantity</label>
                        </div>
                        <div class="col" id="priceDivision2">
                            <label id="priceTxt2">RM </label>
                        </div>
                        <div class="col" id="modeDetailsRow2">
                            <a href="#"><asp:Label ID="Label10" runat="server" Text="View more details"></asp:Label></a>
                        </div>
                    </div>

                    <!-- Qty, Price, view more details from db -->
                    <div class="row qtyPriceMoreDB">
                        <div class="col" id="lblqtyDivision2">
                            <asp:Label ID="Label11" runat="server" Text="5"></asp:Label>
                        </div>
                        <div class="col" id="lblpriceDivision2">
                            <asp:Label ID="Label12" runat="server" Text="20.00"></asp:Label>
                        </div>
                        <div class="col" id="btnBuyAgainDivision2">
                            <asp:Button ID="Button1" runat="server" Text="BUY AGAIN" class="btn-primary rounded" />
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>--%>
    

</asp:Content>
