<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderArt.aspx.cs" Inherits="ArtMoments.Sites.general.OrderArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Order Artwork</title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/OrderArtCss.css" />
    <link href='http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
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

        div#wishlistOff,  div#wishlistOn{
            position: absolute;
            top: -20px;
            right: 0;
        } 

        input#ContentPlaceHolder1_btnwishlistOff:hover {
            -webkit-text-fill-color:red;
        }

        .heading {
            margin-top: 40px;
            margin-bottom: 30px;
            background-color: paleturquoise;
            color: white;
            text-shadow: 1px 1px black;
        }

        .row.sizeCategoryAuthor, .row.descriptionDevision {
            font-size: 13px;
            color: darkgray;
            padding-top: 8px;
        }

        .row.sizeCategoryAuthorDB, .row.lbldescriptionDivision {
           margin-top: -5px;
            font-size: 18px;
        }

        input#ContentPlaceHolder1_qtyTxtBox {
            text-align: center;
        }

        div#qtynPriceDiv {
            font-size: 18px;
            margin-top: 30px;
        }

        div#btnBuyNowDivision {
            margin-top: 20px;
        }

        .row.justify-content-center.align-self-center {
            margin-bottom: 30px;
            background-color: gainsboro;
            text-shadow: 1px 1px black;
            color: white;
            margin-top: 30px;
        }
        
        div#authorName {
            font-size: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Heading -->
    <header>
        <div class="row justify-content-center heading">
            <h1 class="orderHistoryHeader">Order History</h1>
        </div>
    </header>
    
    <div class="container" id="artOrder">
        <div class="row">
            <div class="col-xl-6 col-sm-12 artImgDiv">
               <!-- ArtWork Image -->
                <div class="justify-content-center align-self-center col-12">
                    <div class="artwork-image-division col-12">
                        <asp:Image ID="artworkImage" runat="server" src="../../Content/14019785_00-129-spheroide-noire-01.jpg" class="img-thumbnail" Height="450"/>
                    </div>
                </div>
            </div>
       
            <div class="col-xl-6">
                <!-- Artwork Name-->
                <div class="row artworkNameDivision" id="artworkNameDivision">
                    <div class="col-12">
                        <h1><asp:Label ID="artworkName" runat="server" Text="artworkName"></asp:Label></h1>
                    </div>

                     <!-- wishlist icon img -->
                <div class="row wishlistBtnDivision" id="wishlistBtnDivision">
                    <div id="wishlistOff">
                        <asp:Button ID="btnwishlistOff" runat="server" Text="&#9829;" style="color:darkgrey; font-size:55px;background-color:transparent; border:none; background-size:55px" OnClick="btnwishlistOff_Click" CssClass="btnOff" ToolTip="add to wishlist" />
                    </div>
                    <div id="wishlistOn">
                        <asp:Button ID="btnwishlistOn" runat="server" Text="&#9829;" style="color:red; font-size:55px;background-color:transparent; border:none;background-size:55px" OnClick="btnwishlistOn_Click" visible="false" ToolTip="remove from wishlist"/>
                    </div>
                </div>
                </div>

                <!-- Size, Category, Author label -->
                <div class="row sizeCategoryAuthor">
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

                <!-- Size, Category, Author label from db -->
                <div class="row sizeCategoryAuthorDB">
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
                
                <!-- artwork description-->
                <div class="row descriptionDevision">
                    <div class="col-12" id="descriptionDevision">
                        <label id="lbldescripTxt">Description</label>
                    </div>
                </div>

                <div class="row lbldescriptionDivision">
                    <div class="col-12" id="lbldescriptionDivision">
                        <asp:Label ID="lblartworkDescription" runat="server" Text="Description"></asp:Label>
                    </div>
                </div>
                <!-- quantity & price -->
                <div class="row" id="qtynPriceDiv">
                    <div class="col-6" id="quantityDivision">
                        <div class="quantity">
                            <asp:Button ID="btnMinus" runat="server" Text="-" OnClick="btnMinus_Click" />
                            <asp:TextBox ID="qtyTxtBox" runat="server" Width="55px">1</asp:TextBox>
                            <asp:Button ID="btnPlus" runat="server" Text="+" OnClick="btnPlus_Click1" />
                        </div>
                    </div>

                    <div class="auto-style1" id="priceDivision">
                        <asp:Label ID="lblartworkPrice" runat="server" Text="Price: RM "></asp:Label>
                    </div>
                </div>

                <!-- Buy now button -->
                <div class="row">
                    <div class="col-12 btnBuyNowDivision" id="btnBuyNowDivision">
                        <asp:LinkButton ID="btnBuyNow" runat="server" OnClick="btnBuyNow_Click" PostBackUrl="../client/OrderHistory.aspx" CssClass="btn btn-primary btn-block">BUY NOW</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <!-- Author Information -->
    <div class="container authorInfoContainer">
        <div class="row justify-content-center align-self-center">
            <h2 class="authorInfoHeading" id="authorInfoHeading" style="padding-top:50px;">Author Information</h2>
        </div>

        <div class="container justify-content-center">       
            <div class="row authorInfoDivision" id="authorInfoDivision"> 
                <div class="col-5 float-right">
                    <div class="author-pic-image" id="authorpicDivision">
                        <asp:Image ID="authorImage" runat="server" src="../../Content/panda.jpg" alt="Author Profile Pic" />
                    </div>
                </div>

                <div class="col-7 authorName" id="authorName">
                    <asp:Label ID="authorInfoName" runat="server" Text="authorName"></asp:Label>
                </div>
            </div>
        </div>
    </div>



        <script type="text/javascript">
           
            
            
            //// ADD & REMOVE WISHLIST
            //var clickRed = 0;

            ////let onwishlist = document.getElementById("wishlistLoveOn");
            ////let offwishlist = document.getElementById("wishlistLoveOff");
            //let wishlistCover = document.getElementsByClassName("btnOff");

            //wishlistCover.addEventListener('mouseenter', function () {
            //    this.textContent = "\2665";
            //})


        </script>

</asp:Content>
