<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="ArtMoments.Sites.client.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/OrderHistoryCss.css" />
    <style type="text/css">
        div#orderHistoryDetail {
            margin-top: 20px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Transaction -->
    <div class="container" id="transactionHistoryContainer">
        <div class="row">
            <h1><asp:Label ID="lbltransacId" runat="server" Text="Transaction ID"></asp:Label></h1>
        </div>
        <!-- Order Histories -->
        <div class="container align-content-sm-center" id="orderHistoryContainer">
            <div class="row">
                <div class="col-lg-4 col-md-12 col-sm-12" id="orderHistoryRowDiv">
                    <!-- Ordernum N Artwork -->
                    <div class="col justify-content-center" id="orderNumnArt">
                        <!-- Ordernum -->
                        <div class="row">
                            <h3><asp:Label ID="lbladorderNum" runat="server" Text="#orderNum"></asp:Label></h3>
                        </div>
                        <!-- Artwork -->
                                <asp:Image ID="imgdbArtwork" runat="server" src="../../Content/sea.jpg" height="200"/>

                    </div>
                </div>
                <!-- Orderhistory Details -->
                <div class="col-lg-8" id="orderHistoryDetail">
                    <!-- Delivery Status -->
                    <div class="row  float-right">
                        <asp:Label ID="lbladorderStatus" runat="server" Text="Delivered"></asp:Label>
                    </div>
                    <!-- Artname -->
                    <div class="row">
                        <asp:Label ID="lbladartName" runat="server" Text="ArtName" CssClass="h2"></asp:Label>
                    </div>

                    <!-- Size, Category, Author label -->
                    <div class="row">
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
                    <div class="row">
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

                    <!-- Size, Category, Author label -->
                    <div class="row">
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

                    <!-- Size, Category, Author from db -->
                    <div class="row">
                        <div class="col" id="lblqtyDivision">
                            <asp:Label ID="Label1" runat="server" Text="5"></asp:Label>
                        </div>
                        <div class="col" id="lblpriceDivision">
                            <asp:Label ID="Label2" runat="server" Text="20.00"></asp:Label>
                        </div>
                        <div class="col" id="btnBuyAgainDivision">
                            <asp:Button ID="btnBuyAgain" runat="server" Text="BUY AGAIN" />
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>

    <!-- Transaction -->
    <div class="container" id="transactionHistoryContainer2">
        <div class="row">
            <h1><asp:Label ID="Label3" runat="server" Text="Transaction ID"></asp:Label></h1>
        </div>
        <!-- Order Histories -->
        <div class="container" id="orderHistoryContainer2">
            <div class="row">
                <div class="col-lg-4 col-md-12 col-sm-12" id="orderHistoryRowDiv2">
                    <!-- Ordernum N Artwork -->
                    <div class="col justify-content-center" id="orderNumnArt2">
                        <!-- Ordernum -->
                        <div class="row">
                            <h3><asp:Label ID="Label4" runat="server" Text="#orderNum"></asp:Label></h3>
                        </div>
                        <!-- Artwork -->
                                <asp:Image ID="Image1" runat="server" src="../../Content/swing.jpg" height="200"/>
                    </div>
                </div>
                <!-- Orderhistory Details -->
                <div class="col-lg-8" id="orderHistoryDetail2">
                    <!-- Delivery Status -->
                    <div class="row  float-right">
                        <asp:Label ID="Label5" runat="server" Text="Delivered"></asp:Label>
                    </div>
                    <!-- Artname -->
                    <div class="row">
                        <asp:Label ID="Label6" runat="server" Text="ArtName" CssClass="h2"></asp:Label>
                    </div>

                    <!-- Size, Category, Author label -->
                    <div class="row">
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
                    <div class="row">
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

                    <!-- Size, Category, Author label -->
                    <div class="row">
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

                    <!-- Size, Category, Author from db -->
                    <div class="row">
                        <div class="col" id="lblqtyDivision2">
                            <asp:Label ID="Label11" runat="server" Text="5"></asp:Label>
                        </div>
                        <div class="col" id="lblpriceDivision2">
                            <asp:Label ID="Label12" runat="server" Text="20.00"></asp:Label>
                        </div>
                        <div class="col" id="btnBuyAgainDivision2">
                            <asp:Button ID="Button1" runat="server" Text="BUY AGAIN" />
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>
</asp:Content>
