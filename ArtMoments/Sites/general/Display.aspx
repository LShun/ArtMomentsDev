<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/General.Master"  CodeBehind="DisplayArtwork.aspx.cs" Inherits="ArtMoments.Sites.general.DisplayArtwork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Display Artwork</title>
    <link href="../../Content/css/searchForm.css" rel="stylesheet" />
    <link href="../../Content/css/DisplayImageHover.css" rel="stylesheet" />
    <style type="text/css">
        .btnImg{
            width:100%;
            height:100%;
        }

        .lblImg{
            text-align:center;
        }

        .search-form-group label {
            font-size: 60%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Display Artwork</h2>
        <div class="container" ID="search-form-container">
            <div class="row">
             <div class="col-3 form-group search-form-group">
                <label>Type</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control search-form-control">
                    <asp:ListItem>Artwork</asp:ListItem>
                    <asp:ListItem>Painting</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-3 form-group search-form-group">
                <label>Artist</label>
               <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control search-form-control">
                    <asp:ListItem>Andy Warhol</asp:ListItem>
                    <asp:ListItem>Pablo Picasso</asp:ListItem>
               </asp:DropDownList>
            </div>
            <div class="col-3 form-group search-form-group">
                <label>Publication Year</label>
               <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control search-form-control">
                   <asp:ListItem>2000-2009</asp:ListItem>
                   <asp:ListItem>2010-2019</asp:ListItem>
               </asp:DropDownList>
            </div>
             <div class="col-3 form-group search-form-group" style="margin-top:auto" >
                 <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" />
            </div>
            </div>

            <div class="row">
                <div class="col-2 form-group search-form-group">
                    <label>Price Range</label>
                </div>
                <div class="col-7 form-group">
                    <div class="slider" id="slider-distance">
                          <div>
                            <div class="inverse-left" style="width:70%;" id="LHSrange" runat="server"></div>
                            <div class="inverse-right"  style="width:70%;" id="RHSrange" runat="server"></div>
                            <div class="range" style="left:30%;right:40%;" id="Pricerange" runat="server" ></div>
                            <span class="thumb"  style="left:30%;" id="LHSthumb" runat="server"></span>
                            <span  class="thumb" style="left:60%;" id="RHSthumb" runat="server"></span>
                            <div class="sign" style="left:30%;">
                              <span class="value">30</span>
                            </div>
                            <div class="sign" style="left:60%;">
                              <span class="value">60</span>
                            </div>
                            
                          </div>
                           <input type="range" tabindex="0" value="30" max="100" min="0" step="1" runat="server" id="rangeMin" oninput="
                              this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
                              var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
                              var children = this.parentNode.childNodes[1].childNodes;
                              children[1].style.width=value+'%';
                              children[5].style.left=value+'%';
                              children[7].style.left=value+'%';
                              children[11].style.left=value+'%';
                              children[11].childNodes[1].innerHTML=this.value;
                                txtMin.Text =this.value;" />

                          <input type="range" tabindex="0" value="60" max="100" min="0" step="1" runat="server" id="rangeMax" oninput="
                              this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
                              var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
                              var children = this.parentNode.childNodes[1].childNodes;
                              children[3].style.width=(100-value)+'%';
                              children[5].style.right=(100-value)+'%';
                              children[9].style.left=value+'%';
                              children[13].style.left=value+'%';
                              children[13].childNodes[1].innerHTML=this.value;
                              txtMax.Text =this.value;" />
                        </div>
                </div>
                <div class="col-3 form-group search-form-group" style="margin-top:auto" >
                     <asp:Button ID="Button2" runat="server" Text="Clear" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
        <div class="container" ID="display-img-container">
            <div class="d-flex">
              <div class="flex-row containerRow1">
  
                  <div class="p-2 imgItem">
                    <div class="imgLabel" id="Img_bckgrd1">
                      <p class="h2">Category 1</p>
                    </div>
    
                    <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Content/boat.jpg"/>
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image4" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Content/blue-man-waves.jpg"/>
                      </div>
                    </div>
                  </div>
  
                  <div class="p-2 imgItem">
                    <div class="imgLabel" id="Img_bckgrd2">
                      <h2>Category 2</h2>
                    </div>
    
                     <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image6" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image9" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>

                   <div class="p-2 imgItem">
                    <div class="imgLabel" id="Img_bckgrd3">
                      <h2>Category 3</h2>
                    </div>
    
                     <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image11" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image12" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image13" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image14" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image15" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>

                  <div class="p-2 imgItem">
                    <div class="imgLabel" id="Img_bckgrd4">
                      <h2>Category 4</h2>
                    </div>
    
                    <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image46" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image47" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image48" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image49" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image50" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>


                  </div>

                </div>
            <div class="row">
              <div class="containerRow1">
  
                  <div class="imgItem">
                    <div class="imgLabel" id="Img_bckgrd5">
                      <h2>Category 5</h2>
                    </div>
    
                    <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image16" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image17" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image18" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image19" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image20" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>
  
                  <div class="imgItem">
                    <div class="imgLabel" id="Img_bckgrd6">
                      <h2>Category 6</h2>
                    </div>
    
                     <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image21" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image22" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image23" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image24" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image25" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>

                   <div class="imgItem">
                    <div class="imgLabel" id="Img_bckgrd7">
                      <h2>Category 7</h2>
                    </div>
    
                     <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image26" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image27" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image28" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image29" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image30" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>
        
                  <div class="imgItem">
                    <div class="imgLabel" id="Img_bckgrd8">
                      <h2>Category 8</h2>
                    </div>
    
                    <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image56" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image57" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image58" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image59" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image60" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>
                  
                  </div>

                </div>
            <div class="row">
              <div class="containerRow1">
  
                  <div class="imgItem">
                    <div class="imgLabel" id="Img_bckgrd9">
                      <h2>Category 9</h2>
                    </div>
    
                    <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image31" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image32" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image33" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image34" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image35" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>
  
                  <div class="imgItem">
                    <div class="imgLabel" id="Img_bckgrd10">
                      <h2>Category 10</h2>
                    </div>
    
                     <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image36" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image37" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image38" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image39" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image40" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>

                   <div class="imgItem">
                    <div class="imgLabel" id="Img_bckgrd11">
                      <h2>Category 11</h2>
                    </div>
    
                     <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image41" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image42" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image43" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image44" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image45" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>
    
                  <div class="imgItem">
                    <div class="imgLabel" id="Img_bckgrd12">
                      <h2>Category 12</h2>
                    </div>
    
                    <div class="imgPreviews">
                      <div class="preview-image">
                          <asp:Image ID="Image51" runat="server" ImageUrl="~/Content/Black Deer2.png" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image52" runat="server" ImageUrl="~/Content/blue-man-waves.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image53" runat="server" ImageUrl="~/Content/boat.jpg" />
                      </div>
                      <div class="preview-image">
                       <asp:Image ID="Image54" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                      </div>
                      <div class="preview-image">
                        <asp:Image ID="Image55" runat="server" ImageUrl="~/Content/monalisa.jpg" />
                      </div>
                    </div>
                  </div>
    
                  </div>

                </div>
        </div>
        </div>
<script>
    $(() => {

        $('.search-form-group').each((i, e) => {
            $('.search-form-control', e)
                .focus(function () {
                    e.classList.add('not-empty');
                })
                .blur(function () {
                    this.value === '' ? e.classList.remove('not-empty') : null;
                })
                ;
        });

    }); 
</script>
</asp:Content>

