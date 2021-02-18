<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderHistoryExtra.aspx.cs" Inherits="ArtMoments.Sites.client.OrderHistoryExtra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="TransacId" SessionField="TransacId" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT [id], [user_id] FROM [Transaction] WHERE ([user_id] = @user_id)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="user_id" SessionField="@UserName" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <header>
    <div class="row justify-content-center">
        <h1 class="orderHistoryHeader">Order History</h1>
    </div>
    </header>

    <div class="container transactionHistoryContainer">
            <div class="row">
                <h2><asp:Label ID="lblTransacId" runat="server" Text='<%# Eval("transaction_id") %>'/></asp:Label></h2>
            </div>

    <asp:ListView ID="ListViewTransactionDetails" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
      
            <div class="container align-content-sm-center orderHistoryContainer">
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12 orderHistoryRowDiv">
                        <!-- Ordernum N Artwork -->
                        <div class="col justify-content-center orderNumnArt">
                            <!-- Ordernum -->
                            <div class="row">
                                <asp:Label ID="order_idLabel" runat="server" Text='<%# Eval("order_id") %>' />
                            </div>
                            <!-- Artwork -->
                                <asp:ImageButton ID="BtnProdImg" runat="server" style="max-height:200px; max-width:200px" ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_image")) %>' />
                        </div>
                    </div>
                    <!-- Orderhistory Details -->
                    <div class="col-lg-8 orderHistoryDetail">
                    <!-- Delivery Status -->
                    <div class="row  float-right deliveryStatus">
                       <asp:Label ID="order_statusLabel" runat="server" Text='<%# Eval("order_status") %>' />
                    </div>
                    <!-- Artname -->
                    <div class="row artNameRow">
                       <asp:Label ID="prod_nameLabel" runat="server" Text='<%# Eval("prod_name") %>' />
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
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("prod_price") %>' />
                        </div>
                        <div class="col" id="lblcategorryDivision">
                            <asp:Label ID="category_nameLabel" runat="server" Text='<%# Eval("category_name") %>' />
                        </div>
                        <div class="col" id="lblauthorDivision">
                            <asp:Label ID="user_nameLabel" runat="server" Text='<%# Eval("user_name") %>' />
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
                            <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                        </div>
                        <div class="col" id="lblpriceDivision">
                            <asp:Label ID="prod_priceLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                        </div>
                        <div class="col" id="btnBuyAgainDivision">
                            <asp:Button ID="btnBuyAgain" runat="server" Text="BUY AGAIN" class="btn-primary rounded"/>
                        </div>
                    </div>  
                </div>
            </div>
        </div>
   </div>
             
        </ItemTemplate>
        

        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        
    </asp:ListView>
   
</asp:Content>
