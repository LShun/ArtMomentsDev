<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="ArtMoments.Sites.general.Display" %>
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
        .auto-style3 {
            width: 709px;
        }
        .auto-style5 {
            width: 931px;
            height: 750px;
            margin-right: 0px;
            padding-left:5px;
            margin-top: 0px;
        }
        .auto-style8 {
            height: 132px;
            width: 268px;
            text-align:center;
        }
        .auto-style9 {
            width: 1024px;
        }
        .auto-style10 {
            width: 274px;
        }
     
        .auto-style12 {
            margin-bottom: 0px;
            top: 78px;
            left: 18px;
            right: 780px;
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
     
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Artwork Display</h2>
    <table class="auto-style9">
        <tr>
             <td class="auto-style3">
                 <table class="auto-style5">
                     <tr>
                          <td class="auto-style8">
                              <asp:Image ID="Image1" class="img" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg"  style="display:flex;" CssClass="auto-style13"/>
                              <table class="auto-style12" id="Image1Table">
                                  <tr>
                                      <td><asp:Image ID="Image17" class="img" runat="server"  ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" Height="94px" Width="125px"/>
                                        </td>
                                       <td><asp:Image ID="Image18" class="img" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" Height="94px" Width="125px"/>
                                        </td>
                                  </tr>
                                  <tr>
                                      <td><asp:Image ID="Image19" class="img" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" Height="94px" Width="125px"/>
                                        </td>
                                       <td><asp:Image ID="Image20" class="img" runat="server" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" Height="94px" Width="125px"/>
                                        </td>
                                  </tr>
                              </table>
                              
                              <%-- <div class="img"><span></span><span></span><span></span><span></span></div>
                              <div class="content">
                               <asp:Image ID="Image17" runat="server" Height="98px" Width="146px" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                               <asp:Image ID="Image19" runat="server" Height="98px" Width="146px" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                               <asp:Image ID="Image18" runat="server" Height="98px" Width="146px" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />
                               <asp:Image ID="Image20" runat="server" Height="98px" Width="146px" ImageUrl="~/Content/StarryNightVanGogh-58c2d2705f9b58af5cafbd53.jpg" />

                        
                              </div>--%>
                              <br />
                              <asp:Label ID="Label1" runat="server" Text="Category 1" ></asp:Label>
                          </td>
                          <td class="auto-style8"> 
                              <asp:Image ID="Image2" runat="server"  style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/8585-mur-africa-met.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label2" runat="server" Text="Category 2"></asp:Label>
                          </td>
                          <td class="auto-style8">  
                              <asp:Image ID="Image3" runat="server"  style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/artwork-4.jpg" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label3" runat="server" Text="Category 3"></asp:Label>
                          </td>
                          <td class="auto-style8">
                               <asp:Image ID="Image4" runat="server"  style="display:flex;" CssClass="auto-style13" ImageUrl="~/Content/il_570xN.1343115773_kxun.jpg" />
                               <br />
                               <asp:Label class="ImgLabel" ID="Label4" runat="server" Text="Category 4"></asp:Label>
                          </td>
                     </tr>
                     <tr>
                          <td class="auto-style11">
                              <asp:Image ID="Image5" runat="server" Height="189px" Width="250px" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label5" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8"> 
                              <asp:Image ID="Image6" runat="server" Height="189px" Width="250px" />
                              <br />
                              <asp:Label class="ImgLabel" ID="Label6" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8">  
                              <asp:Image ID="Image7" runat="server" Height="189px" Width="250px"/>
                              <br />
                              <asp:Label class="ImgLabel" ID="Label7" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8">
                               <asp:Image ID="Image8" runat="server" Height="189px" Width="250px" />
                               <br />
                               <asp:Label class="ImgLabel" ID="Label8" runat="server" Text="Label"></asp:Label>
                          </td>
                     </tr>
                     <tr>
                          <td class="auto-style11">
                              <asp:Image ID="Image9" runat="server" Height="189px" Width="250px"/>
                              <br />
                              <asp:Label class="ImgLabel" ID="Label9" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8"> 
                              <asp:Image ID="Image10" runat="server" Height="189px" Width="250px"/>
                              <br />
                              <asp:Label class="ImgLabel" ID="Label10" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8">  
                              <asp:Image ID="Image11" runat="server" Height="189px" Width="250px"/>
                              <br />
                              <asp:Label class="ImgLabel" ID="Label11" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8">
                               <asp:Image ID="Image12" runat="server" Height="189px" Width="250px"/>
                               <br />
                               <asp:Label class="ImgLabel" ID="Label12" runat="server" Text="Label"></asp:Label>
                          </td>
                     </tr>
                     <tr>
                          <td class="auto-style11">
                              <asp:Image ID="Image13" runat="server" Height="189px" Width="250px"/>
                              <br />
                              <asp:Label class="ImgLabel" ID="Label13" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8"> 
                              <asp:Image ID="Image14" runat="server" Height="189px" Width="250px"/>
                              <br />
                              <asp:Label class="ImgLabel" ID="Label14" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8">  
                              <asp:Image ID="Image15" runat="server" Height="189px" Width="250px"/>
                              <br />
                              <asp:Label class="ImgLabel" ID="Label15" runat="server" Text="Label"></asp:Label>
                          </td>
                          <td class="auto-style8">
                               <asp:Image ID="Image16" runat="server" Height="189px" Width="250px"/>
                               <br />
                               <asp:Label class="ImgLabel" ID="Label16" runat="server" Text="Label"></asp:Label>
                          </td>
                     </tr>
                 </table>
             </td>
             <td class="auto-style10">
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
                        Type:
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="165px">
                            <asp:ListItem>Artwork</asp:ListItem>
                            <asp:ListItem>Painting</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        Artist:<asp:DropDownList ID="DropDownList2" runat="server" Width="165px">
                            <asp:ListItem>Andy Warhol</asp:ListItem>
                            <asp:ListItem>Pablo Picasso</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        Year:<asp:DropDownList ID="DropDownList3" runat="server" Width="165px">
                            <asp:ListItem>2000-2009</asp:ListItem>
                            <asp:ListItem>2010-2019</asp:ListItem>
                        </asp:DropDownList>
                        

                        <br />
                        <br />
                        <asp:Button ID="btnFilter" runat="server" Height="23px" Text="Filter" Width="59px" />
                        <asp:Button ID="btnAll" runat="server" Height="27px" Text="Select All" Width="104px" />
                    </div>

                 </div>
             </td>
        </tr>
   </table>
</asp:Content>
