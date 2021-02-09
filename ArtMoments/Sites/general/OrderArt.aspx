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

        .row.sizeCategoryAuthor, .row.descriptionDevision, .row.sizeCategoryAuthor {
            font-size: 13px;
            color: darkgray;
            padding-top: 8px;
        }

        .row.sizeCategoryAuthorDB, .row.lbldescriptionDivision {
           margin-top: -5px;
            font-size: 18px;
        }

        input#ContentPlaceHolder1_txtboxQty {
            text-align: center;
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

       .col-xl-6, .col-sm-12, .col-md-12, col-12,col-4, col-5, col-7, col-6{
            position:relative;
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
        }

       div{
           display:block;
       }

        @media (min-width: 1200px).col-xl-6 {
            flex: 0 0 50%;
            max-width: 50%;
        }

        @media (min-width: 768px)
        .container, .container-md, .container-sm {
            max-width: 720px;
        }

        @media (min-width: 768px)
        .col-md-12 {
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
        }

        .btn-primary{
            color:#fff;
            background-color:#007bff;
            border-color:#007bff
        }

        .btn-block{
            display:block;
            width:100%;
        }

        .float-right{
            float:right!important;
        }

        .row {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
        }

        .rounded {
            border-radius: .25rem!important;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }

        .justify-content-center {
            justify-content: center!important;
        }

        @media (min-width: 576px)
        .align-content-sm-center {
            align-content: center!important;
        }
        .auto-style1 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 33.333333%;
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .col-4{-ms-flex:0 0 33.333333%;flex:0 0 33.333333%;max-width:33.333333%}

        .col-xl-6{-ms-flex:0 0 50%;flex:0 0 50%;max-width:50%}

        .col-sm-12{-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}

        .col-md-12{-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}

        .col-12{-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}

        .col-5{-ms-flex:0 0 41.666667%;flex:0 0 41.666667%;max-width:41.666667%}

        .col-6{-ms-flex:0 0 50%;flex:0 0 50%;max-width:50%}

        .col-7{-ms-flex:0 0 58.333333%;flex:0 0 58.333333%;max-width:58.333333%}
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
                        <h1><asp:Label ID="lblartworkName" runat="server" Text="artworkName"></asp:Label></h1>
                        <asp:Label ID="lblartworkID" runat="server" Text="" Visible="false"></asp:Label>
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

                <!-- quantity, price, delivery method label -->
                <div class="row sizeCategoryAuthor">
                    <div class="col-4" id="orderQty">
                        <label id="orderQtyTxt">Quantity</label>
                    </div>
                    <div class="col-4" id="totalPrice">
                        <label id="priceTxt">Price</label>
                    </div>
                    <div class="col-4" id="Delivery Channel">
                        <label id="deliveryChannelTxt">Delivery Channel</label>
                    </div>
                </div>

                <!-- quantity & price & delivery method -->
                <div class="row" id="qtynPriceDiv">
                    <div class="col-4" id="quantityDivision">
                        <div class="quantity">
                            <asp:Button ID="btnMinus" runat="server" Text="-" OnClick="btnMinus_Click" />
                            <asp:TextBox ID="txtboxQty" runat="server" Width="55px" onkeypress="numValid(event);" onfocusout="qtyValid();" class="txtboxQtyClass">1</asp:TextBox>
                            <asp:Button ID="btnPlus" runat="server" Text="+" OnClick="btnPlus_Click" />
                        </div>
                    </div>

                    <div class="col-4" id="priceDivision">
                        <asp:Label ID="lblartworkPrice" runat="server" Text="RM "></asp:Label>
                    </div>

                    <div class="col-4" id="deliveryDivision">
                        <asp:DropDownList ID="ddlDeliveyMethod" runat="server">
                            <asp:ListItem>Pos Laju</asp:ListItem>
                            <asp:ListItem>Citylink</asp:ListItem>
                            <asp:ListItem>Gdex</asp:ListItem>
                            <asp:ListItem>ABX</asp:ListItem>
                            <asp:ListItem>Ninja Van</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Buy now button -->
                <div class="row">
                    <div class="col-12 btnBuyNowDivision" id="btnBuyNowDivision">
                        <asp:LinkButton ID="btnBuyNow" runat="server" PostBackUrl="../client/OrderHistory.aspx" CssClass="btn btn-primary btn-block">BUY NOW</asp:LinkButton>
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
            function numValid(evt) {
                var ch = String.fromCharCode(evt.which);
                if (!(/[0-9]/.test(ch))) {
                    evt.preventDefault();
                } 
            }

            function qtyValid() {
                var qtyElement = document.getElementsByClassName("txtboxQtyClass")[0];
                    var qtyInput = parseInt(qtyElement.value);
                    var maxQty = 20;
                    if (qtyInput > 1) {
                        if (qtyInput > maxQty) {
                            qtyInput = maxQty;
                            alert("The current available stock of this artwork is only 20 pieces.");
                        }
                    }
                    else{
                        qtyInput = 1;
                        qtyElement.value = qtyInput.toString();
                    }
            }

        </script>

</asp:Content>
