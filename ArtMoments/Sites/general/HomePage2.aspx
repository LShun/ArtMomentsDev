<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="HomePage2.aspx.cs" Inherits="ArtMoments.Sites.general.HomePage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
        <!-- Welcome -->
        <div class="table">
            <div class="row">
                <div class="col-sm">
                    <div class="jumbotron">
                        <h1 class="display-5">Welcome to ArtMoments Art Gallery</h1>
                        <p class="lead">We specialize in selling &quot;interesting arts&quot;</p>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="table">
                        <div class="row">
                            <h3 style="text-align: center;">Spotlight Artist</h3>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <asp:ImageButton ID="ImageButton1" class="img-thumbnail" runat="server" ImageUrl="~/Content/art-paint-brush.jpg" />
                            </div>
                            <div class="col-sm">
                                <asp:ImageButton ID="ImageButton3" class="img-thumbnail" runat="server" ImageUrl="~/Content/pixel-castle-mountain.png" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <asp:ImageButton ID="ImageButton2" class="img-thumbnail" runat="server" ImageUrl="~/Content/waterfall-blue-petal.jpg" />
                            </div>
                            <div class="col-sm">
                                <asp:ImageButton ID="ImageButton4" class="img-thumbnail" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                            </div>
                        </div>
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
                                <img src="..." alt="...">
                            </div>
                            <div class="col-8">
                                <div class="card-body">
                                    <h5 class="card-title">Access to Wish-list System</h5>
                                    <p class="card-text">Allow bookmarking of favorite arts, for review down the line.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card">
                        <div class="row">
                            <div class="col-4">
                                <img src="..." alt="...">
                            </div>
                            <div class="col-8">
                                <div class="card-body">
                                    <h5 class="card-title">Buy Art</h5>
                                    <p class="card-text">Purchase physical copies of art from the creators.</p>
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
                                <img src="..." alt="...">
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
                                <img src="..." alt="...">
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
        <h2>Interested? Sign-up / Login Now!</h2>
        <button type="button" class="btn btn-primary">Sign up!</button>
        <button type="button" class="btn btn-info">Login!</button>


        <div>
            <h2>Categories</h2>
            <div style="width: 50%;">
                <asp:Image ID="Image2" runat="server" />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Button" />
            </div>
            <div style="width: 50%;">
                <asp:Image ID="Image3" runat="server" />
                <br />
                <asp:Button ID="Button2" runat="server" Text="Button" />
            </div>
        </div>
    </div>

</asp:Content>
