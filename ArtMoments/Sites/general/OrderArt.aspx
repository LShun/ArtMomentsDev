<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderArt.aspx.cs" Inherits="ArtMoments.Sites.general.OrderArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Order Artwork</title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/OrderArtCss.css" />
    <style>
        div#authorpicDivision {
            float: right;
        }

        div#authorInfoDivision {
            margin-top: 20px;
        }

        img#ContentPlaceHolder1_authorImage {
        max-width: 200px;
        max-height: 200px;
        object-fit: cover;
        border: 2px solid black;
        }

        div#artworkNameDivision {
            margin-top: 20px;
        }

        .artwork-image-division img {
            max-width: 400px;
            max-height: 400px;
            object-fit: cover;
            cursor: pointer;
            border: 2px solid black;
            text-align: center;
            align-items: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container" id="artOrder">
        <div class="row">
            <div class="col-6">
               <!-- ArtWork Image -->
                <div class="justify-content-center align-self-center col-12">
                    <div class="artwork-image-division col-12">
                        <asp:Image ID="artworkImage" runat="server" src="../../Content/14019785_00-129-spheroide-noire-01.jpg" class="img-thumbnail col-12" Height="450"/>
                    </div>
                </div>
            </div>
       
            <div class="col-6">
                <!-- wishlist icon img -->
                <div class="row col-12" id="wishlistImgDivision">
                    <!--<asp:Image ID="imgwishlist" runat="server" src="../../Content/love-wishlist-white.png" />-->
                </div>
                <!-- Artwork Name-->
                <div class="row col-12" id="artworkNameDivision">
                    <h1><asp:Label ID="artworkName" runat="server" Text="artworkName"></asp:Label></h1>
                </div>

                <!-- artwork display label -->
                <div class="row">
                    <div class="col-4" id="sizeDivision">
                        <label id="sizeTxt">Size</label>
                    </div>
                    <div class="col-4" id="categoryDivision">
                        <label id="categoryTxt">Category</label>
                    </div>
                    <div class="col-4" id="authorDivision">
                        <label id="authorTxt">Author</label>
                    </div>
                </div>

                <!-- artwork detail from db -->
                <div class="row">
                    <div class="col-4" id="lblsizeDivision">
                        <asp:Label ID="lblartworkSize" runat="server" Text="M"></asp:Label>
                    </div>
                    <div class="col-4" id="lblcategorryDivision">
                        <asp:Label ID="lblartworkCategory" runat="server" Text="category"></asp:Label>
                    </div>
                    <div class="col-4" id="lblauthorDivision">
                        <asp:Label ID="lblauthor" runat="server" Text="author"></asp:Label>
                    </div>
                </div>                
                
                <div class="row">
                    <div class="col-12" id="descriptionDevision">
                        <label id="lbldescripTxt">Description</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12" id="lbldescriptionDivision">
                        <asp:Label ID="lblartworkDescription" runat="server" Text="Description"></asp:Label>
                    </div>
                </div>
                <!-- quantity & price -->
                <div class="row">
                    <div class="col-6" id="quantityDivision">
                        <div class="quantity">
                            <asp:Button ID="btnMinus" runat="server" Text="-" OnClick="btnMinus_Click" />
                            <asp:TextBox ID="qtyTxtBox" runat="server" Width="55px">1</asp:TextBox>
                            <asp:Button ID="btnPlus" runat="server" Text="+" OnClick="btnPlus_Click1" />
                        </div>
                    </div>

                    <div class="col-6" id="priceDivision">
                        <asp:Label ID="lblartworkPrice" runat="server" Text="Price: RM "></asp:Label>
                    </div>
                </div>

                <!-- Buy now button -->
                <div class="row">
                    <div class="col-12" id="btnBuyNowDivision">
                        <asp:LinkButton ID="btnBuyNow" runat="server" OnClick="btnBuyNow_Click" PostBackUrl="../client/OrderHistory.aspx">BUY NOW</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

        <!-- Author Information -->
        <div class="row justify-content-center align-self-center">
            <h2 id="authorInfoHeading" style="padding-top:50px;">Author Information</h2>
        </div>

        <div class="container justify-content-center">       
            <div class="row" id="authorInfoDivision"> 
                <div class="col-5 float-right">
                    <div class="author-pic-image" id="authorpicDivision">
                        <asp:Image ID="authorImage" runat="server" src="../../Content/panda.jpg" alt="Author Profile Pic" />
                    </div>
                </div>

                <div class="col-7" id="authorName">
                    <asp:Label ID="authorInfoName" runat="server" Text="authorName"></asp:Label>
                </div>
            </div>
        </div>
    </div>



        <script type="text/javascript">
           
            // ADD & REMOVE WISHLIST
            var clickRed = 0;

            let wishLove = document.getElementById("love-img");
            wishLove.addEventListener('click', function () {
                if (document.getElementById("love-img").src.includes("white")) {
                    document.getElementById("love-img").src = "../../Content/love-wishlist-red.png";
                    clickRed = 1;
                }
                else {
                    document.getElementById("love-img").src = "../../Content/love-wishlist-white.png";
                    clickRed = 0;
                }  
            })

            wishLove.addEventListener('mouseenter', function () {
                document.getElementById("love-img").src = "../../Content/love-wishlist-red.png";
            })

            wishLove.addEventListener('mouseleave', function () {
                if (clickRed == 1) {
                    document.getElementById("love-img").src = "../../Content/love-wishlist-red.png";
                }
                else {
                    document.getElementById("love-img").src = "../../Content/love-wishlist-white.png";
                }
            })
        </script>

</asp:Content>
