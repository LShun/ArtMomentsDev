<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="DisplayArtwork.aspx.cs" Inherits="ArtMoments.Sites.general.Display" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/css/DisplayArt.css" rel="stylesheet" />
    <style type="text/css">
        #Text1 {
            width: 40px;
        }
        #Text2 {
            width: 39px;
        }
        #minPrice {
            width: 40px;
        }
        #maxPrice {
            width: 36px;
        }
        .auto-style2 {
            margin-left: 428px;
            margin-right: 0px;
            width: 243px;
            height: 422px;
        }
             
        .ImgInlineTable {
            margin-bottom: 0px;
            top: 50px;
            left: 25px;
            right: 796px;
            position: absolute;
            height: 175px;
        }
     
        .auto-style13 {
            position: relative;
            z-index: 5;
            left: 0px;
            top: 0px;
            width: 264px;
            height: 204px;
        }

        .row{
            display:table;
        }
     
     
        .ImgInlineTable td{
            padding:0.2rem;
        }

        .form-group{
            margin-bottom:0rem;
        }

        .btn{
            align-content:center;
        }
     
     
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Artwork Display</h2>
    
    <table class="table table-responsive col-sm-12">
        <tbody>
        <tr class="row">
             <td class="col-sm-8">
                 <table class="table text-center">
                     <thead>
                         <tr class="row" style="width:0px">
                             <th class="col-sm-2"></th>
                             <th class="col-sm-2"></th>
                             <th class="col-sm-2"></th>
                             <th class="col-sm-2"></th>
                         </tr>
                     </thead>
                     <tbody>
                     <tr class="row">
                          <td>
                              <asp:Image ID="Image1" class="img" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg"  style="display:flex;" CssClass="auto-style13"/>
                              <table class="table ImgInlineTable" id="Image1Table" style="width:264px; height:204px">
                                  <tr class="row">
                                      <td><asp:Image ID="Image17" class="img" runat="server"  ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" Height="94px" Width="125px"/>
                                        </td>
                                       <td><asp:Image ID="Image18" class="img" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" Height="94px" Width="125px"/>
                                        </td>
                                  </tr>
                                  <tr class="row">
                                      <td><asp:Image ID="Image19" class="img" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" Height="94px" Width="125px"/>
                                        </td>
                                       <td><asp:Image ID="Image20" class="img" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" Height="94px" Width="125px"/>
                                        </td>
                                  </tr>
                              </table>
                              <br />
                              <asp:Label ID="Label1" runat="server" Text="Category 1" ></asp:Label>
                          </td>
                          <td> 
                              <asp:Image ID="Image2" runat="server"  style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label2" runat="server" Text="Category 2"></asp:Label>
                          </td>
                          <td>  
                              <asp:Image ID="Image3" runat="server"  style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/artwork-4.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label3" runat="server" Text="Category 3"></asp:Label>
                          </td>
                          <td>
                               <asp:Image ID="Image4" runat="server"  style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/il_570xN.1343115773_kxun.jpg" />
                               <br />
                               <asp:Label class="ImgLabel" ID="Label4" runat="server" Text="Category 4"></asp:Label>
                          </td>
                     </tr>
                     <tr class="row">
                          <td>
                              <asp:Image ID="Image5" runat="server"  style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg"  />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label5" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td> 
                              <asp:Image ID="Image6" runat="server"  style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg"  />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label6" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td>  
                              <asp:Image ID="Image7" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label7" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td>
                               <asp:Image ID="Image8" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg"  />
                               <br />
                               <asp:Label class="ImgLabel" ID="Label8" runat="server" Text="Label"></asp:Label>
                          </td>
                     </tr>
                     <tr class="row">
                          <td>
                              <asp:Image ID="Image9" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label9" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td> 
                              <asp:Image ID="Image10" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label10" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td>  
                              <asp:Image ID="Image11" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label11" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td>
                               <asp:Image ID="Image12" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                               <br />
                               <asp:Label class="ImgLabel" ID="Label12" runat="server" Text="Label"></asp:Label>
                          </td>
                     </tr>
                     <tr class="row">
                          <td>
                              <asp:Image ID="Image13" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label13" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td> 
                              <asp:Image ID="Image14" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label14" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td>  
                              <asp:Image ID="Image15" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label15" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td>
                               <asp:Image ID="Image16" runat="server" style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                               <br />
                               <asp:Label class="ImgLabel" ID="Label16" runat="server" Text="Label"></asp:Label>
                          </td>
                     </tr>
                    </tbody>
                 </table>
             </td>
             <td class="col-sm-4">
                 <div id="circle" class="auto-style2">
                      <div id="searchForm" runat="server" class="auto-style1" style="margin-left:110px;margin-top:250px" >
                        <h3 style="color:black">Price Range</h3>
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

                       
                        <br />
                        
                        <br />
                        <div class="form-group row">Type&nbsp;&nbsp;&nbsp; :
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="140px" CssClass="dropdown">
                            <asp:ListItem>Artwork</asp:ListItem>
                            <asp:ListItem>Painting</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        <br />
                        <br />
                        
                        <div class="form-group row">
                            Artist&nbsp;&nbsp; :
                            <asp:DropDownList ID="DropDownList2" runat="server" Width="140px" CssClass="dropdown">
                            <asp:ListItem>Andy Warhol</asp:ListItem>
                            <asp:ListItem>Pablo Picasso</asp:ListItem>
                             </asp:DropDownList>
                        </div>
                        <br />
                        <br />
                         <div class="form-group row">Year&nbsp;&nbsp;&nbsp; :
                             <asp:DropDownList ID="DropDownList3" runat="server" Width="140px" CssClass="dropdown">
                            <asp:ListItem>2000-2009</asp:ListItem>
                            <asp:ListItem>2010-2019</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        

                        <br />
                        <asp:Button ID="btnFilter" runat="server" Height="27px" Text="Filter" Width="59px" class="btn btn-primary"/>
                        <asp:Button ID="btnAll" runat="server" Height="27px" Text="Select All" Width="104px"  class="btn btn-primary"/>
                    </div>

                 </div>
             </td>
        </tr>
      </tbody>
   </table>
</asp:Content>
