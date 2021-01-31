<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderArt.aspx.cs" Inherits="ArtMoments.Sites.general.OrderArt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Order Artwork</title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/OrderArtCss.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ="order-content-left" style="width:5%;height:500px;float:left">
        </div>

        <div id="order-content-centre" style="width:89%;height:500px;float:left">
            <header id="orderHeader"></header>

            <div id="order-main-content">
                <div id="order-image-slider" style="width:53%;float:left">
                    <div id="featured-box">
                        <img id="featured" src="../../Content/autumn-countryside.jpg"> 
                    </div>

                    <div id="artWork-slide-wrapper">
                        <img id="order-slideLeft" class ="arrow" src="../../Content/arrow-left.png">

                        <div id="order-slider">
                            <img class="thumbnail active" src="../../Content/autumn-countryside.jpg">
                            <img class="thumbnail" src="../../Content/boat.jpg">
                            <img class="thumbnail" src="../../Content/panda.jpg">
                            <img class="thumbnail" src="../../Content/colorful-street.jpg">
                            <img class="thumbnail" src="../../Content/monalisa.jpg">
                            <img class="thumbnail" src="../../Content/sea.jpg">
                            <img class="thumbnail" src="../../Content/swing.jpg">
                        </div>

                        <img id="order-slideRight" class ="arrow" src="../../Content/arrow-right.png">
                    </div>

                        
                </div>        
            
                <div id="order-information" style="width:42%;float:left;">
                    <div id="separate-info-wish" style="display:inline-block">
                    <section id ="name-year" class="order-info-section">
                        <h1>ArtName</h1>
                        <span id="year">Year</span>
                    </section>

                    <section id="artDetail-size" class="order-info-section">
                        <span class="artDetail">Size</span>
                        <span>1800" x 1900"</span>
                        <br />
                    </section>

                    <section id="artDetail-material" class="order-info-section">
                        <span class="artDetail">Material</span>
                        <span>Canvas, abc, cde, efg</span>
                        <br />
                    </section>

                    <section id="artDetail-author" class="order-info-section">
                        <span class="artDetail">Author</span>
                        <span>Manolisa</span>
                        <br />
                    </section>

                    <section id="order-button-section" class="order-info-section">
                        <a href="#" id="view-more-product">View More Details</a>

                        <button type="button" id="order-buy">BUY NOW!</button>
                         <br />
                         <br />
                    </section>
                    </div>

                    <div id="wishlist-love" style="display:inline-block; float:right">
                        <img id="love-img" src="../../Content/love-wishlist-white.png" style="height: 66px; width: 69px; margin-right:10px; margin-top:10px" />
                    </div>

                </div>

            </div>
            
            <div id="order-art-description" style="float:none; width: 100%; display:inline-block">
                <section id="art-description" class="extra-info">
                    <h1>Art Description</h1>
                    <p>
                        Inspiration by abcdefghijklmnopqrstuvwxyz
                    </p>
                </section>
            </div>

            <div id="order-author-information">

                <section id="author-description" class="extra-info">
                    <h1>Author</h1>
                    <div id="artist-profilePic">
                        <img id="author-profile-pic" src="../../Content/monalisa.jpg">
                    </div>
                    <div id="author-info">
                        Inspiration by abcdefghijklmnopqrstuvwxyz
                    </div>
                </section>
            </div>

        </div>

        

        <div id ="order-content-right" style="width:5%;height:500px;float:left">
        </div>

        <script type="text/javascript">
            var clickRed = 0;
            let thumbnails = document.getElementsByClassName('thumbnail')

            let activeImages = document.getElementsByClassName('active')

            for (var i = 0; i < thumbnails.length; i++) {
                thumbnails[i].addEventListener('click', function () {
                    if (activeImages.length > 0) {
                        activeImages[0].classList.remove('active')
                    }

                    this.classList.add('active')
                    document.getElementById('featured').src = this.src
                })
            }

            let buttonRight = document.getElementById('order-slideRight');
            let buttonLeft = document.getElementById('order-slideLeft');

            buttonLeft.addEventListener('click', function () {
                document.getElementById('order-slider').scrollLeft -= 180
            })

            buttonRight.addEventListener('click', function () {
                document.getElementById('order-slider').scrollLeft += 180
            })

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
