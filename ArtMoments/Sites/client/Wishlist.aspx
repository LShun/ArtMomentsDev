<%@ Page Title="Wishlist" Language="C#" MasterPageFile="~/Masters/Client1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="ArtMoments.Sites.client.Wishlist" %>

<asp:Content ID="cphHead" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/css/HomePage.css" rel="stylesheet"/>
    <style>
        .container { display: flex; }

        .gv-wishlist td { padding: 0.5rem 0.5rem; }
    </style>
</asp:Content>
<asp:Content ID="cphBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="table">
            <div class="row">
                <h1>Wishlist</h1>
            </div>
            <div class="row">
                <asp:Label ID="lblSearch" runat="server" Text="Search Your Wishlist (By Name): "></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server" Text="" AutoComplete="off" MaxLength="50"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-primary"/>
            </div>
            <div class="row">
                <p>Click on the blue headers to sort by that column</p>
            </div>
            <div class="row">
                <asp:GridView CssClass="table gv-wishlist" ID="gvWishlist" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsWishlist" AllowPaging="True" DataKeyNames="id" OnRowDeleting="gvWishList_RowDeleting" OnRowCommand="gvWishlist_RowCommand" ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Wishlist ID" SortExpression="id" InsertVisible="False" ReadOnly="True" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="product_id" HeaderText="Product ID" SortExpression="product_id"/>
                        <asp:BoundField DataField="prod_name" HeaderText="Name" SortExpression="prod_name"/>
                        <asp:BoundField DataField="prod_price" HeaderText="Price (RM)" SortExpression="prod_price"/>
                        <asp:BoundField DataField="prod_stock" HeaderText="Stock" SortExpression="prod_stock"/>
                        <asp:BoundField DataField="prod_size" HeaderText="Size" SortExpression="prod_size"/>
                        <asp:BoundField DataField="prod_description" HeaderText="Desc" SortExpression="prod_description" Visible="false"/>
                        <asp:BoundField DataField="category_name" HeaderText="Category" SortExpression="category_name"/>

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="prod_image" runat="server"
                                           Height="200px" Width="200px"
                                           ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[]) Eval("prod_image")) %>'/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False"
                                                CommandName="View" CssClass="btn btn-primary" Text="View">
                                </asp:LinkButton>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False"
                                                CommandName="Delete" Text="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('Confirm delete?');">
                                </asp:LinkButton>
                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>
                    <EmptyDataTemplate>
                        <p>No records found.</p>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br/>
                <asp:SqlDataSource ID="dsWishlist" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT DISTINCT Wishlist.id, Wishlist.product_id, Product.prod_name, Product.prod_price, Product.prod_stock, Product.prod_size, Product.prod_description, Product_Category.category_name, Product.prod_image FROM Wishlist, Product, Product_Category, [User] WHERE Wishlist.user_id = [User].id AND Wishlist.product_id = Product.id AND Product_Category.id = Product.category_id AND [User].user_name = @user_name AND Product.prod_name LIKE CONCAT('%', @prod_name, '%')" CancelSelectOnNullParameter="False">
                    <SelectParameters>
                        <asp:SessionParameter Name="user_name" SessionField="UserName"/>
                        <asp:ControlParameter ControlID="txtSearch" DefaultValue="" Name="prod_name" PropertyName="Text"/>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>


    </div>
</asp:Content>