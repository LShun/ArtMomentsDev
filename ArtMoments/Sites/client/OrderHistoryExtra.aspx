<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderHistoryExtra.aspx.cs" Inherits="ArtMoments.Sites.client.OrderHistoryExtra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT T.id AS transaction_id, O.id AS order_id, P.prod_name, P.prod_size, P.prod_image, P.prod_price, A.user_name, C.category_name, O.quantity, O.order_status FROM [Transaction] AS T INNER JOIN [Order] AS O ON T.id = O.transaction_id INNER JOIN Product AS P ON P.id = O.product_id INNER JOIN [User] AS A ON A.id = P.user_id INNER JOIN Product_Category AS C ON C.id = P.category_id WHERE (T.user_id = 1) ORDER BY T.date_order DESC"></asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        
        <ItemTemplate>
            <span style="background-color: #E0FFFF;color: #333333;">transaction_id:
            <asp:Label ID="transaction_idLabel" runat="server" Text='<%# Eval("transaction_id") %>' />
            <br />
            order_id:
            <asp:Label ID="order_idLabel" runat="server" Text='<%# Eval("order_id") %>' />
            <br />
            prod_name:
            <asp:Label ID="prod_nameLabel" runat="server" Text='<%# Eval("prod_name") %>' />
            <br />
            prod_size:
            <asp:Label ID="prod_sizeLabel" runat="server" Text='<%# Eval("prod_size") %>' />
            <br />
            prod_image:
            <asp:Image ID="Image1" runat="server" Text='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_image")) %>' />
            <br />
            prod_price:
            <asp:Label ID="prod_priceLabel" runat="server" Text='<%# Eval("prod_price") %>' />
            <br />
            user_name:
            <asp:Label ID="user_nameLabel" runat="server" Text='<%# Eval("user_name") %>' />
            <br />
            category_name:
            <asp:Label ID="category_nameLabel" runat="server" Text='<%# Eval("category_name") %>' />
            <br />
            quantity:
            <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
            <br />
            order_status:
            <asp:Label ID="order_statusLabel" runat="server" Text='<%# Eval("order_status") %>' />
            <br />
<br /></span>
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
