<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="ArtMoments.Sites.client.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/OrderHistoryCss.css" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" id="orderHistoryContainer">
        <div class="row">
            <div class="col-md-3 col-sm-1"></div>
            <div class="col-md-2 col-sm-4" id="orderHistoryRowDiv">
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
            <div class="col-md-4 col-sm-6" id="orderHistoryDetail">
                <!-- Delivery Status -->
                <div class="row">
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
        <div class="col-md-3 col-sm-1"></div>
    </div>
    <%--<div class="container justify-content-center" id="oderHistoryDivision">
        <!-- Order Number & Artwork -->
        

        <table class="align-content-md-center" id="itemOrderHisDiv">
            <thead class="table-dark list-group-flush">
                <!-- row 1 -->
                <tr>
                    <td class="auto-style2" rowspan="2">
                        
                    </td>
                    <td class="auto-style1 text-right" colspan="3">
                        
                    </td>
                </tr>
                <!-- row 2 -->
                <tr>
                    <td colspan="3">
                        
                    </td>
                </tr>
                <!-- row 3 -->
                <tr>
                    <td rowspan="5" class="auto-style2" id="tdartworkImg">
                        <div class="row" id="imgArtworkRowDiv">
                            <div class="col table-responsive" id="imgArtworkColDiv" >
                                
                            </div>
                        </div>
                    </td>
               
                    <td>
                        <asp:Label ID="lblSize" runat="server" Text="Size"></asp:Label>
                    </td>

                    <td>
                        <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                    </td>

                    <td>
                        <asp:Label ID="lblAuthor" runat="server" Text="Author"></asp:Label>
                    </td>

                <!-- row 5 -->
                <tr>
                    <td>
                        <asp:Label ID="lbldbSize" runat="server" Text="Size"></asp:Label>
                    </td>

                    <td>
                        <asp:Label ID="lbldbCategory" runat="server" Text="Category"></asp:Label>
                    </td>

                    <td>
                        <asp:Label ID="lbldbAuthor" runat="server" Text="Author"></asp:Label>
                    </td>

                </tr>
                <!-- row 6 -->
                <tr>
                    <td>
                        <asp:Label ID="lblQty" runat="server" Text="Quantity"></asp:Label>
                    </td>

                    <td>
                        <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                    </td>

                    <td>
                        
                    </td>

                </tr>
                <!-- row 7 -->
                <tr>
                    <td>
                        <asp:Label ID="lbldbQty" runat="server" Text="Quantity"></asp:Label>
                    </td>

                    <td>
                        <asp:Label ID="lbldbPrice" runat="server" Text="Price"></asp:Label>
                    </td>
                    <td>

                    </td>
                </tr>
            </thead>
        </table>--%>
</asp:Content>
