<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderArt.aspx.cs" Inherits="ArtMoments.Sites.general.OrderArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Order Artwork</title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/OrderArtCss.css" />
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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
        }

        .row.sizeCategoryAuthor, .row.descriptionDevision, .row.sizeCategoryAuthor {
            font-size: 13px;
            color: darkgray;
            padding-top: 8px;
        }

        .row.sizeCategoryAuthorDB, .row.lbldescriptionDivision, .lblStock {
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
            color: black;
            margin-top: 30px;
            text-align:center;
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
            margin-left: auto;
            margin-right: auto;
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

        .align-content-sm-center {
            align-content: center!important;
            min-width: 576px;
        }

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
        }

        .row.sizeCategoryAuthor, .row.descriptionDevision, .row.qtynPriceDiv {
            font-size: 15px;
            color: darkgray;
            padding-top: 8px;
            padding-bottom: 10px
        }

        .row.sizeCategoryAuthorDB, .row.lbldescriptionDivision, .lblStock, div#qtynPriceDiv {
           margin-top: -5px;
            font-size: 18px;
            margin-bottom: 15px;
        }

        input#ContentPlaceHolder1_txtboxQty {
            text-align: center;
        }

        div#btnBuyNowDivision {
            margin-top: 20px;
        }

        .row.justify-content-center.align-self-center {
            margin-bottom: 30px;
            color: black;
            margin-top: 30px;
            text-align:center;
        }
        
        div#authorName {
            font-size: 20px;
        }

        div{
            display:block;
        }

        .btn-block{
            display:block;
            width:100%;
        }

        .float-right{
            float:right!important;
        }


        .rounded {
            border-radius: .25rem!important;
        }

        .justify-content-center {
            justify-content: center!important;
        }

        .align-content-sm-center {
            align-content: center!important;
            min-width: 576px;
        }

        span.lblStock, span.lblStockTxt {
            font-size: 12px;
            color: darkgray;
            font-style: italic;
        }

        span#ContentPlaceHolder1_lblauthorInfoName {
            font-weight: bold;
        }

        blockquote {
            font-size: 15px;
        }
        .auto-style1 {
            color: black;
        }

        .container{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}
 

        span#ContentPlaceHolder1_lblauthorInfoName {
            font-weight: bold;
        }

        blockquote {
            font-size: 15px;
        }

        .container{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}

        .justify-content-center.align-self-center.col-12 {
            max-width: 200px;
            max-height: 200px;
        }

        .col.artImgDiv {
            width: 45%;
            height: 400px;
        }

        .col {
            width: 55%;
        }

        div#sizeDivision, div#categoryDivision, div#authorDivision, div#orderQty, div#orderQty, 
        div#lblsizeDivision, div#lblcategorryDivision, div#lblauthorDivision , div#quantityDivision,
        div#quantityDivision, div#deliveryDivision,div#totalPrice, div#priceDivision{
            width: 33.33%;
        }

        .lblStockAvailable{
            margin-top:3px;
        }

        div#btnBuyNowDivision {
            width: 80%;
            text-align: center;
        }

        #ContentPlaceHolder1_btnBuyNow {
            padding-top: 7px;
            padding-bottom: 7px;
            border-radius: 30px;
            font-size: 18px;
            font-weight: bold;
            font-family: system-ui;
        }

        a#ContentPlaceHolder1_lbBuyNow {
            padding-top: 7px;
            padding-bottom: 7px;
            border-radius: 30px;
            text-decoration: none;
        }

        div#authorName {
            margin-left: 30px;
        }

        blockquote {
            margin-top: -10px;
        }

        div#wishlistOff, div#wishlistOn {
            position: relative;
            right: 0;
            margin-top: -40px;
        }

        input#ContentPlaceHolder1_btnwishlistOff {
            padding-left: 80px;
        }

        div#lbldescriptionDivision {
            margin-right: 124px;
        }

        div#wishlistBtnDivision {
            padding-left: 278px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Heading -->
    <header><h1 style="text-align:center;">Art Details</h1></header>
    <div class="container" id="artOrder">    
    <div class="row">
            <div class="col artImgDiv">
               <!-- ArtWork Image -->
                <div class="justify-content-center align-self-center col-12">
                    <div class="artwork-image-division col-12">
                        <img ID="Imgartwork" runat="server" src="" class="img-thumbnail" Height="450"/>
                    </div>
                </div>
            </div>
       
            <div class="col">

                <!-- Artwork Name-->
                <div class="row artworkNameDivision" id="artworkNameDivision">
                    <div class="col-12">
                        <h1><asp:Label ID="lblartworkName" runat="server" Text=''></asp:Label></h1>
                        <asp:Label ID="lblartworkID" runat="server" Text="" Visible="false"></asp:Label>
                    </div>

                <!-- wishlist icon img -->
                <div class="row wishlistBtnDivision" id="wishlistBtnDivision">
                    <div id="wishlistOff" class="auto-style1">
                        <asp:Button ID="btnwishlistOff" runat="server" Text="&#9829;" style="color:darkgrey; font-size:55px;background-color:transparent; border:none; background-size:55px" OnClick="btnwishlistOff_Click" CssClass="btnOff" ToolTip="add to wishlist" Height="98px" />
                    </div>
                    <div id="wishlistOn" class="auto-style2">
                        <asp:Button ID="btnwishlistOn" runat="server" Text="&#9829;" style="color:red; font-size:55px;background-color:transparent; border:none;background-size:55px" OnClick="btnwishlistOn_Click" visible="false" ToolTip="remove from wishlist" Height="98px"/>
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
                <!-- Price -->
                <div class="row qtynPriceDiv">
                    <div class="col-4" id="orderQty">
                        <label id="orderQtyTxt">Quantity</label>
                    </div>
                    <!-- Total Price -->
                    <div class="col-4" id="totalPrice">
                        <label id="priceTxt">Price</label>
                    </div>
                    <!-- Delivery Channel -->
                    <div class="col-4" id="Delivery Channel">
                        <label id="deliveryChannelTxt">Delivery Channel</label>
                    </div>
                </div>

                <!-- quantity & price & delivery method -->
                <div class="row" id="qtynPriceDiv">
                    <!-- Quantity -->
                    <div class="col-4" id="quantityDivision">
                        <div class="quantity">
                            <asp:Button ID="btnMinusQty" runat="server" Text="-" OnClick="btnMinus_Click" />
                            <asp:TextBox ID="txtboxQty" runat="server" Width="55px" onkeypress="numValid(event);" onfocusout="qtyValid();" class="txtboxQtyClass">1</asp:TextBox>
                            <asp:Button ID="btnPlusQty" runat="server" Text="+" OnClick="btnPlusQty_Click" />
                        </div>
                    </div>
                    <!-- Price -->
                    <div class="col-4" id="priceDivision">
                        <asp:Label ID="lblRM" runat="server" Text="RM "></asp:Label><asp:Label ID="lblartworkPrice" runat="server" Text="" CssClass="lblartworkPrice" DataFormatString="{0:n}" ></asp:Label>
                    </div>
                    <!-- Delivery Mathod -->
                    <div class="col-4" id="deliveryDivision">
                        <asp:DropDownList ID="ddlDeliveryMethod" runat="server" DataSourceID="SqlDataSourceDelivery" DataTextField="deliver_type" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceDelivery" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT [id], [deliver_type] FROM [Delivery]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="lblStockAvailable"><asp:Label ID="lblStockAvailableTxt" runat="server" Visible="true" CssClass ="lblStockTxt" Text="Available stock: "></asp:Label><asp:Label ID="lblStock" runat="server" Text="" Visible="true" CssClass ="lblStock"></asp:Label></div>

                <!-- Buy now button -->
                <div class="row">
                    <div class="col-12 btnBuyNowDivision" id="btnBuyNowDivision">
                        <asp:LinkButton ID="lbBuyNow" runat="server" CssClass="btn btn-primary btn-block" OnClick="btnBuyNow_Click">ADD TO CART</asp:LinkButton>
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
                        <!-- author profile img -->
                        <div class="author-pic-image" id="authorpicDivision">
                            <img ID="imgAuthorProfile" runat="server" src="" alt="Author Profile Pic" />
                        </div>
                    </div>

                    <div class="col-7 authorName" id="authorName">
                        <!-- author name -->
                        <p><asp:Label ID="lblauthorInfoName" runat="server" Text="authorName"></p></asp:Label>
                        <!-- author bibliography -->
                        <blockquote><asp:Label ID="lblauthorBibliography" runat="server" Text=""></asp:Label></blockquote>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- invisible artwork price per piece -->
    <asp:Label ID="artworkPricePerPiece" runat="server" Text="" CssClass="artworkPricePerPiece" Visible="true" Style="font-size:0px"></asp:Label>

        <script type="text/javascript">
            // prevent user from entering non-numeric number 
            function numValid(evt) {
                var ch = String.fromCharCode(evt.which);
                if (!(/[0-9]/.test(ch))) {
                    evt.preventDefault();
                }
            }

            // validate qty enter by the buyer
            function qtyValid() {
                var qtyElement = document.getElementsByClassName("txtboxQtyClass")[0];
                var qtyInput = parseInt(qtyElement.value);
                var qtyAvailable = document.getElementsByClassName("lblStock")[0];
                var maxQty = parseInt(qtyAvailable.textContent);

                // check whether qty input is more than 1
                if (qtyInput > 1) {
                    // check whether the qty input is within the current available stock
                    if (qtyInput > maxQty) {
                        qtyInput = maxQty;
                        qtyElement.value = qtyInput.toString();
                        calcMax(maxQty);
                        alert("The maximum stock available is " + maxQty + " piece(s).");
                    }
                }
                else {
                    qtyInput = 1;
                    qtyElement.value = qtyInput.toString();
                    calcMin();
                    alert("Minimum value is 1.");
                }
                var onePiecePrice = document.getElementsByClassName("artworkPricePerPiece")[0];
                var artPiecePrice = parseFloat(onePiecePrice.textContent);
                // calculate and display the prices according to the qty enter by buyer
                var subtotal = artPiecePrice * qtyInput;
                document.getElementsByClassName("lblartworkPrice")[0].textContent = (parseFloat(subtotal).toFixed(2)).toString();
            }

            // calculate the price of one piece of artwork (for invalid minimum number input)
            function calcMin() {
                var onePiecePrice = document.getElementsByClassName("artworkPricePerPiece")[0];
                var artPiecePrice = parseFloat(onePiecePrice.textContent);
                var subtotal = artPiecePrice * 1;
                document.getElementsByClassName("lblartworkPrice")[0].textContent = (parseFloat(subtotal).toFixed(2)).toString();
            }

             // calculate the price of MAX piece of artwork (for invalid maximum number input)
            function calcMax(maxQty) {
                var onePiecePrice = document.getElementsByClassName("artworkPricePerPiece")[0];
                var artPiecePrice = parseFloat(onePiecePrice.textContent);
                var subtotal = artPiecePrice * maxQty;
                document.getElementsByClassName("lblartworkPrice")[0].textContent = (parseFloat(subtotal).toFixed(2)).toString();
            }

        </script>
    
</asp:Content>
