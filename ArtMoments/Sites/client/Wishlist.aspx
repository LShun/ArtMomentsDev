<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="ArtMoments.Sites.client.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Wishlist</h1>
        <asp:Label ID="lblSearch" runat="server" Text="Search Your Wishlist: "></asp:Label>
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Button" OnClick="btnSearch_Click" />

        <br />
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
        <asp:GridView CssClass="table" ID="gvWishlist" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsWishlist" AllowPaging="True" DataKeyNames="id" OnRowDeleting="gvWishList_RowDeleting" OnRowCommand="gvWishlist_RowCommand">
            <Columns>
                
                <asp:BoundField DataField="id" HeaderText="Wishlist ID" SortExpression="id" InsertVisible="False" ReadOnly="True" Visible="false"></asp:BoundField>
                <asp:BoundField DataField="product_id" HeaderText="Product ID" SortExpression="product_id" />
                <asp:BoundField DataField="prod_name" HeaderText="Name" SortExpression="prod_name" />
                <asp:BoundField DataField="prod_price" HeaderText="Price (RM)" SortExpression="prod_price" />
                <asp:BoundField DataField="prod_stock" HeaderText="Stock" SortExpression="prod_stock" />
                <asp:BoundField DataField="prod_size" HeaderText="Size" SortExpression="prod_size" />
                <asp:BoundField DataField="prod_description" HeaderText="Desc" SortExpression="prod_description" Visible="false" />
                <asp:BoundField DataField="category_name" HeaderText="Category" SortExpression="category_name" />

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="prod_image" runat="server" 
                            Height="200px" Width="200px" 
                            ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_image")) %>'  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                   <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="return confirm('Confirm delete?');"></asp:LinkButton>
                    <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" 
                        CommandName="View" Text="View"></asp:LinkButton>
                </ItemTemplate>

                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="dsWishlist" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT DISTINCT Wishlist.id, Wishlist.product_id, Product.prod_name, Product.prod_price, Product.prod_stock, Product.prod_size, Product.prod_description, Product_Category.category_name, Product.prod_image FROM Wishlist, Product, Product_Category, [User] WHERE Wishlist.user_id = [User].id AND Wishlist.product_id = Product.id AND Product_Category.id = Product.category_id AND [User].user_name = @user_name">
            <SelectParameters>
                <asp:SessionParameter Name="user_name" SessionField="UserName" />
            </SelectParameters>
        </asp:SqlDataSource>

      <%--  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT DISTINCT Wishlist.id, Wishlist.product_id, Product.prod_name, Product.prod_price, Product.prod_stock, Product.prod_size, Product.prod_description, Product_Category.category_name, Product.prod_image FROM Wishlist, Product, Product_Category, [User] WHERE Wishlist.user_id = [User].id AND Wishlist.product_id = Product.id AND Product_Category.id = Product.category_id AND [User].user_name = @user_name" FilterExpression="Product.prod_name LIKE '%{0}%'">
   <FilterParameters>
      <asp:ControlParameter ControlID="txtSearch" PropertyName="Text" Type="String" />
   </FilterParameters>
            <SelectParameters>
                <asp:SessionParameter Name="user_name" SessionField="UserName" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    </div>
</asp:Content>
