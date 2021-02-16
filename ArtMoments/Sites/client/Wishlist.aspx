<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="ArtMoments.Sites.client.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Wishlist</h1>
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand">Search your saved arts</a>
            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </nav>
        <%--<div class="table">
            <div class="row">
                <div class="col">
                    <div class="card" style="width: auto;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Wishlist 1</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: auto;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Wishlist 2</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: auto;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Wishlist 3</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>


        </div>--%>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsWishlist" AllowPaging="True" DataKeyNames="id">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
<asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="product_id" HeaderText="product_id" SortExpression="product_id" />
                <asp:BoundField DataField="prod_name" HeaderText="prod_name" SortExpression="prod_name" />
                <asp:BoundField DataField="prod_price" HeaderText="prod_price" SortExpression="prod_price" />
                <asp:BoundField DataField="prod_stock" HeaderText="prod_stock" SortExpression="prod_stock" />
                <asp:BoundField DataField="prod_size" HeaderText="prod_size" SortExpression="prod_size" />
                <asp:BoundField DataField="prod_description" HeaderText="prod_description" SortExpression="prod_description" />
                <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />

            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="dsWishlist" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT DISTINCT Wishlist.id, Wishlist.product_id, Product.prod_name, Product.prod_price, Product.prod_stock, Product.prod_size, Product.prod_description, Product_Category.category_name, Product.prod_image FROM Product INNER JOIN Product_Category ON Product.category_id = Product_Category.id INNER JOIN [User] ON Product.user_id = [User].id INNER JOIN Wishlist ON Product.id = Wishlist.product_id AND [User].id = Wishlist.user_id AND [User].id = 1" DeleteCommand="DELETE FROM Wishlist WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>

        </asp:SqlDataSource>
    </div>
</asp:Content>
