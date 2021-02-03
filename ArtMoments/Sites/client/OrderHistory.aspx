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
        <div class="container" id="orderHistoryContainer">
            <div class="row">
                <div class="col-4" id="orderHistoryRowDiv">
                    <!-- Ordernum N Artwork -->
                    <div class="col justify-content-center" id="orderNumnArt">
                        <!-- Ordernum -->
                        <div class="row">
                            <h3><asp:Label ID="lbladorderNum" runat="server" Text="#orderNum"></asp:Label></h3>
                        </div>
                        <!-- Artwork -->
                        <div class="row">
                            <div class="container">
                                <asp:Image ID="imgdbArtwork" runat="server" src="../../Content/swing.jpg" height="200"/>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Orderhistory Details -->
                <div class="col-8" id="orderHistoryDetail">
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
                        <div class="col-3" id="sizeDivision">
                            <label id="sizeTxt">Size</label>
                        </div>
                        <div class="col-3" id="categoryDivision">
                            <label id="categoryTxt">Category</label>
                        </div>
                        <div class="col-6" id="authorDivision">
                            <label id="authorTxt">Author</label>
                        </div>
                    </div>

                    <!-- Size, Category, Author from db -->
                    <div class="row">
                        <div class="col-3" id="lblsizeDivision">
                            <asp:Label ID="lblartworkSize" runat="server" Text="M"></asp:Label>
                        </div>
                        <div class="col-3" id="lblcategorryDivision">
                            <asp:Label ID="lblartworkCategory" runat="server" Text="category"></asp:Label>
                        </div>
                        <div class="col-6" id="lblauthorDivision">
                            <asp:Label ID="lblauthor" runat="server" Text="author"></asp:Label>
                        </div>
                    </div>   

                    <!-- Size, Category, Author label -->
                    <div class="row">
                        <div class="col-3" id="qtyDivision">
                            <label id="qtyTxt">Quantity</label>
                        </div>
                        <div class="col-3" id="priceDivision">
                            <label id="priceTxt">RM </label>
                        </div>
                        <div class="col-6" id="modeDetailsRow">
                            <a href="#"><asp:Label ID="lblMoreDetail" runat="server" Text="View more details"></asp:Label></a>
                        </div>
                    </div>

                    <!-- Size, Category, Author from db -->
                    <div class="row">
                        <div class="col-3" id="lblqtyDivision">
                            <asp:Label ID="Label1" runat="server" Text="5"></asp:Label>
                        </div>
                        <div class="col-3" id="lblpriceDivision">
                            <asp:Label ID="Label2" runat="server" Text="20.00"></asp:Label>
                        </div>
                        <div class="col-6" id="btnBuyAgainDivision">
                            <asp:Button ID="btnBuyAgain" runat="server" Text="BUY AGAIN" />
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>
</asp:Content>
