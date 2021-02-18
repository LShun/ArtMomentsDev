<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtMoments.Sites.general.HomePage2" %>

<asp:Content ID="cphHead" ContentPlaceHolderID="head" runat="server">

    <style>
        .img-benefits  {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

        .latest {
            width: auto;
            max-width: 30vh;
            height: 15vh;
        }

        .paginate span {
            color: Highlight;
        }
    </style>
</asp:Content>
<asp:Content ID="cphBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <!-- Welcome -->
        <div class="table">
            <div class="row">
                <div class="col-sm">
                    <div class="jumbotron">
                        <h1 class="display-5">Welcome to ArtMoments Art Gallery</h1>
                        <p class="lead">We specialize in selling &quot;interesting arts&quot;</p>
                        <hr />
                        <a class="btn btn-primary btn-lg" href="../client/DisplayArt.aspx" role="button">Browse Arts...</a>

                    </div>
                </div>
                <div class="col-sm">
                    <div class="table">
                        <div class="row">
                            <h3 style="text-align: center;">Latest Arts</h3>
                        </div>
                        <asp:DetailsView ID="dvLatestArt" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="dsLatestArt" ForeColor="Black" GridLines="Horizontal">
                            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" Font-Bold="true" CssClass="paginate" />
                            <PagerSettings Mode="NumericFirstLast"/>
                            <Fields>
                                <asp:HyperLinkField
                                    DataNavigateUrlFields="id"
                                    DataNavigateUrlFormatString="./OrderArt.aspx?id={0}"
                                    DataTextField="prod_name"
                                    HeaderText="Name" />

                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="imgLatestProduct" runat="server" CssClass="latest"
                                            ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_image")) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="dsLatestArt" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT TOP 50 [id], SUBSTRING([prod_name], 0, 35) AS prod_name, [prod_image] FROM [Product] ORDER BY [id] DESC"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <!-- Benefits -->
            <h1>Benefits of Signing Up</h1>

            <!-- Customer Benefits -->
            <h2>Customers</h2>
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="row">
                            <div class="col-4">
                                <img class="img-benefits" src="../../Content/hp-wishlist-stars.jpg" />
                            </div>
                            <div class="col-8">
                                <div class="card-body">
                                    <h5 class="card-title">Wish-list System</h5>
                                    <p class="card-text">Allow bookmarking of favorite arts</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card">
                        <div class="row">
                            <div class="col-4">
                                <img class="img-benefits" src="../../Content/hp-buy-art.jpg" />
                            </div>
                            <div class="col-8">
                                <div class="card-body">
                                    <h5 class="card-title">Buy Art</h5>
                                    <p class="card-text">Purchase art from the creators.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <h3>Artists</h3>
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div class="row">
                            <div class="col-4">
                                <img class="img-benefits" src="../../Content/hp-additional-income.jpg" />
                            </div>
                            <div class="col-8">
                                <div class="card-body">
                                    <h5 class="card-title">Additional Income</h5>
                                    <p class="card-text">Sell your Art here with low fees.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card">
                        <div class="row">
                            <div class="col-4">
                                <img class="img-benefits" src="../../Content/hp-visibility.jpg" />
                            </div>
                            <div class="col-8">
                                <div class="card-body">
                                    <h5 class="card-title">Increased Visibility</h5>
                                    <p class="card-text">Improve discovery & popularity.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign up & Login Buttons -->
        <asp:Panel CssClass="alert alert-primary" Id="pnlInterested" RunAt="server" role="alert" Visible="true" OnLoad="pnlInterested_Load">
            <h2>Interested?
             <a href="../usermgmt/SignUp.aspx" type="button" class="btn btn-primary">Sign up!</a>
                <a href="../usermgmt/PreLogin.aspx" type="button" class="btn btn-outline-primary">Login!</a>
            </h2>
        </asp:Panel>
    </div>
</asp:Content>
