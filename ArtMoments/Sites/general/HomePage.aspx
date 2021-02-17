<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtMoments.Sites.general.HomePage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        img {
            width: 150px; /* You can set the dimensions to whatever you want */
            height: 150px;
            object-fit: cover;
        }

        .img-spotlight {
            width: 200px; /* You can set the dimensions to whatever you want */
            height: 200px;
            object-fit: cover;
        }
    </style>
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
                        <hr />
                        <a class="btn btn-primary btn-lg" href="./DisplayArtwork.aspx" role="button">Browse Arts...</a>

                    </div>
                </div>
                <div class="col-sm">
                    <div class="table">
                        <div class="row">
                            <h3 style="text-align: center;">Spotlight Artist</h3>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <asp:ImageButton ID="ImageButton1" class="img-spotlight" runat="server" ImageUrl="~/Content/art-paint-brush.jpg" />
                            </div>
                            <div class="col-sm">
                                <asp:ImageButton ID="ImageButton3" class="img-spotlight" runat="server" ImageUrl="~/Content/pixel-castle-mountain.png" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <asp:ImageButton ID="ImageButton2" class="img-spotlight" runat="server" ImageUrl="~/Content/waterfall-blue-petal.jpg" />
                            </div>
                            <div class="col-sm">
                                <asp:ImageButton ID="ImageButton4" class="img-spotlight" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
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
                                <img src="../../Content/hp-wishlist-stars.jpg" />
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
                                <img src="../../Content/hp-buy-art.jpg" />
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
                                <img src="../../Content/hp-additional-income.jpg" />
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
                                <img src="../../Content/hp-visibility.jpg" />
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
        <div class="alert alert-primary" role="alert">
            <h2>Interested?
             <a href="../usermgmt/SignUp.aspx" type="button" class="btn btn-primary">Sign up!</a>
                <a href="../usermgmt/PreLogin.aspx" type="button" class="btn btn-outline-primary">Login!</a>
            </h2>
        </div>

        <h2>Categories</h2>


        <div class="table">
            <div class="row">
                <div class="col">
                    <div class="card" style="width: auto;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Category 1</h5>
                            <p class="card-text">Category 1 Text</p>
                            <a href="#" class="btn btn-primary">Link to first Category</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: auto;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Category 2</h5>
                            <p class="card-text">Category 2 Text</p>
                            <a href="#" class="btn btn-primary">Link to second category</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: auto;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Category 3</h5>
                            <p class="card-text">Category 3 Description</p>
                            <a href="#" class="btn btn-primary">Link to 3rd category</a>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</asp:Content>
