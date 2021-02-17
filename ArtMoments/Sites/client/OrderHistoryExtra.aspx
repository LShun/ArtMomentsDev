<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderHistoryExtra.aspx.cs" Inherits="ArtMoments.Sites.client.OrderHistoryExtra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT T.id as transaction_id, O.id AS order_id, P.prod_name as prod_name, P.prod_size as prod_size, P.prod_image as prod_image, P.prod_price as prod_price, A.user_name as user_name, C.category_name as category_name,  O.quantity as quantity, O.order_status as order_status FROM [Transaction] AS T INNER JOIN [Order] AS O ON T.id = O.transaction_id INNER JOIN Product AS P ON P.id = O.product_id INNER JOIN [User] AS A ON A.id = P.user_id INNER JOIN Product_Category AS C ON C.id = P.category_id WHERE (T.user_id = 1)"></asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="background-color: #FFFFFF;color: #284775;">transaction_id:
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
            <asp:Label ID="prod_imageLabel" runat="server" Text='<%# Eval("prod_image") %>' />
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
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #999999;">transaction_id:
            <asp:Label ID="transaction_idLabel1" runat="server" Text='<%# Eval("transaction_id") %>' />
            <br />
            order_id:
            <asp:Label ID="order_idLabel1" runat="server" Text='<%# Eval("order_id") %>' />
            <br />
            prod_name:
            <asp:TextBox ID="prod_nameTextBox" runat="server" Text='<%# Bind("prod_name") %>' />
            <br />
            prod_size:
            <asp:TextBox ID="prod_sizeTextBox" runat="server" Text='<%# Bind("prod_size") %>' />
            <br />
            prod_image:
            <asp:TextBox ID="prod_imageTextBox" runat="server" Text='<%# Bind("prod_image") %>' />
            <br />
            prod_price:
            <asp:TextBox ID="prod_priceTextBox" runat="server" Text='<%# Bind("prod_price") %>' />
            <br />
            user_name:
            <asp:TextBox ID="user_nameTextBox" runat="server" Text='<%# Bind("user_name") %>' />
            <br />
            category_name:
            <asp:TextBox ID="category_nameTextBox" runat="server" Text='<%# Bind("category_name") %>' />
            <br />
            quantity:
            <asp:TextBox ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
            <br />
            order_status:
            <asp:TextBox ID="order_statusTextBox" runat="server" Text='<%# Bind("order_status") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">prod_name:
            <asp:TextBox ID="prod_nameTextBox" runat="server" Text='<%# Bind("prod_name") %>' />
            <br />prod_size:
            <asp:TextBox ID="prod_sizeTextBox" runat="server" Text='<%# Bind("prod_size") %>' />
            <br />prod_image:
            <asp:TextBox ID="prod_imageTextBox" runat="server" Text='<%# Bind("prod_image") %>' />
            <br />prod_price:
            <asp:TextBox ID="prod_priceTextBox" runat="server" Text='<%# Bind("prod_price") %>' />
            <br />user_name:
            <asp:TextBox ID="user_nameTextBox" runat="server" Text='<%# Bind("user_name") %>' />
            <br />category_name:
            <asp:TextBox ID="category_nameTextBox" runat="server" Text='<%# Bind("category_name") %>' />
            <br />quantity:
            <asp:TextBox ID="quantityTextBox" runat="server" Text='<%# Bind("quantity") %>' />
            <br />order_status:
            <asp:TextBox ID="order_statusTextBox" runat="server" Text='<%# Bind("order_status") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
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
            <asp:Label ID="prod_imageLabel" runat="server" Text='<%# Eval("prod_image") %>' />
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
        <SelectedItemTemplate>
            <span style="background-color: #E2DED6;font-weight: bold;color: #333333;">transaction_id:
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
            <asp:Label ID="prod_imageLabel" runat="server" Text='<%# Eval("prod_image") %>' />
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
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
