<%@ Page Language="C#" MasterPageFile="~/Masters/General.Master"  AutoEventWireup="true" CodeBehind="DisplayArt.aspx.cs" Inherits="ArtMoments.Sites.client.DisplayArt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Display Artwork</title>
    <link href="../../Content/css/searchForm.css" rel="stylesheet" />
    <link href="../../Content/css/DLProduct.css" rel="stylesheet" />
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
        .auto-style3 {
            margin-left: 0px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Display Artwork</h2>
        <div class="container" ID="search-form-container">
            <div class="row">
             <div class="col-3 form-group search-form-group">
                <label>Category</label>
                <asp:DropDownList ID="ddlProdCat" runat="server" CssClass="form-control search-form-control">
                    <asp:ListItem>ALL</asp:ListItem> 
                </asp:DropDownList>
            </div>
            <div class="col-3 form-group search-form-group">
               <label>Artist</label>
               <asp:DropDownList ID="ddlArtist" runat="server" CssClass="form-control search-form-control">
                    <asp:ListItem>ALL</asp:ListItem>
               </asp:DropDownList>
            </div>
            <div class="col-3 form-group search-form-group">
                <label>Product Size</label>
               <asp:DropDownList ID="ddlProdSize" runat="server" CssClass="form-control search-form-control">
                   <asp:ListItem>ALL</asp:ListItem>
               </asp:DropDownList>
            </div>
             <div class="col-3 form-group search-form-group" style="margin-top:auto" >
                 <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" PostBackUrl="~/Sites/general/DisplayArtworkProduct.aspx" />
            </div>
            </div>

            <div class="row">
                <div class="col-2 form-group search-form-group">
                    <label>Price Range</label>
                </div>
                <div class="col-7 form-group">
                    <div class="slider" id="slider-distance">
                          <div>
                            <div class="inverse-left" style="width:30%;" id="LHSrange" runat="server"></div>
                            <div class="inverse-right"  style="width:70%;" id="RHSrange" runat="server"></div>
                            <div class="range" style="left:30%;right:40%;" id="Pricerange" runat="server" ></div>
                            <span class="thumb"  style="left:30%;" id="LHSthumb" runat="server"></span>
                            <span  class="thumb" style="left:60%;" id="RHSthumb" runat="server"></span>
                            <div class="sign" style="left:30%;" onchange="ChangeLabel">
                              <span class="value">30</span>
                            </div>
                            <div class="sign" style="left:60%;">
                              <span class="value">60</span>
                            </div>
                              <asp:Label ID="lblMinPRange" runat="server" Text=""></asp:Label>
                              <asp:Label ID="lblMaxPRange" runat="server" Text=""></asp:Label>
                          </div>
                           <input type="range" tabindex="0" value="30" max="100" min="0" step="1" runat="server" id="rangeMin" oninput="
                              this.value=Math.min(this.value,this.parentNode.childNodes[5].value-1);
                              var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
                              var children = this.parentNode.childNodes[1].childNodes;
                              children[1].style.width=value+'%';
                              children[5].style.left=value+'%';
                              children[7].style.left=value+'%';
                              children[11].style.left=value+'%';
                              children[11].childNodes[1].innerHTML=this.value;" />

                          <input type="range" tabindex="0" value="60" max="100" min="0" step="1" runat="server" id="rangeMax" oninput="
                              this.value=Math.max(this.value,this.parentNode.childNodes[3].value-(-1));
                              var value=(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.value)-(100/(parseInt(this.max)-parseInt(this.min)))*parseInt(this.min);
                              var children = this.parentNode.childNodes[1].childNodes;
                              children[3].style.width=(100-value)+'%';
                              children[5].style.right=(100-value)+'%';
                              children[9].style.left=value+'%';
                              children[13].style.left=value+'%';
                              children[13].childNodes[1].innerHTML=this.value;" />
                        </div>
                </div>
                <div class="col-3 form-group search-form-group" style="margin-top:auto" >
                     <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="btnClear_Click" />
                </div>
            </div>
        </div>
        <div class="container" ID="display-img-container">
           <br/>
            
            <asp:Label ID="lblRecordMsg" runat="server" Text=""></asp:Label>
            <asp:DataList ID="dlProdCat" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Height="321px" Width="1024px" OnItemCommand="dlProdCat_ItemCommand" 
                BackColor="#CCCCCC" CellPadding="2" ForeColor="Black" CssClass="auto-style3" >
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemTemplate>
                   <%-- <table class="w-100">
                        <tr>
                            <td style="text-align:center;vertical-align:middle">
                                <asp:Image ID="ibtnCategory_img" runat="server" Height="175px" Width="193px" 
                                    ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("category_image")) %>'  />
                            </td>
                        </tr>
                        <tr>
                            <td  style="text-align:center;vertical-align:middle">
                                <asp:Label ID="lblCategory_name" runat="server" Text='<%# Eval("category_name") %>' ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center;vertical-align:middle">

                                <asp:Button ID="btnNavProd" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="viewProd" Text="View Products"/>

                            </td>
                        </tr>
                    </table>
               --%>
                <div class="hovereffect">
                    <asp:Image CssClass="img-responsive" ID="imgCategory_img" runat="server" Height="175px" Width="100%" 
                            ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("category_image")) %>'  />
                            
                        <div class="overlay">
                            <h2>
                                <asp:Label ID="lblCategory_name" runat="server" Text='<%# Eval("category_name") %>' ></asp:Label>
                            </h2>
				            <p>
					            <asp:Button CssClass="btnNav" ID="btnNavProd" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="viewProd" Text="View Products"/>
				            </p>
                        </div>
                </div>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DataList>

            <table id="tbPaging" runat="server" style="width:100%; margin:2% 0% 0% 5%">  
              <tr>  
                <td>  
                    <asp:Button CssClass="btnPaging" ID="btnFirst" runat="server" Font-Bold="true" Text="First" OnClick="btnFirst_Click"/></td>  
                <td>  
                    <asp:Button CssClass="btnPaging" ID="btnPrevious" runat="server" Font-Bold="true" Text="Previous" OnClick="btnPrevious_Click"/></td>  
                <td>  
                    <asp:Button CssClass="btnPaging" ID="btnNext" runat="server" Font-Bold="true" Text="Next" OnClick="btnNext_Click" style="height: 48px"/></td>  
                <td>  
                     <asp:Button CssClass="btnPaging" ID="btnLast" runat="server" Font-Bold="true" Text="Last" OnClick="btnLast_Click"/></td>  
                </tr>  
               </table>  

            <%--  <table id="dlPaging" runat="server" style="width:100%">
               <tr>  
                <td class="btnPaging">  
                    <svg width="100%" height="62">
                    <defs>
                        <linearGradient id="grad1">
                            <stop offset="0%" stop-color="#FF8282"/>
                            <stop offset="100%" stop-color="#E178ED" />
                        </linearGradient>
                    </defs>
                     <rect x="5" y="5" rx="25" fill="none" stroke="url(#grad1)" width="95%" height="50"></rect>
                  </svg>
                  <span>
                      <asp:Button style="border:none; background-color:transparent"  ID="btnFirst" runat="server" Font-Bold="true" Text="First" OnClick="btnFirst_Click"/> 
                  </span>  
               </td> 
               <td class="btnPaging"> 
                   <svg width="100%" height="62">
                    <defs>
                        <linearGradient id="grad2">
                            <stop offset="0%" stop-color="#FF8282"/>
                            <stop offset="100%" stop-color="#E178ED" />
                        </linearGradient>
                    </defs>
                     <rect x="5" y="5" rx="25" fill="none" stroke="url(#grad1)" width="95%" height="50"></rect>
                  </svg>
                  <span>
                       <asp:Button style="border:none; background-color:transparent" ID="btnPrevious" runat="server" Font-Bold="true" Text="Previous" OnClick="btnPrevious_Click"/>
                </span> 
                </td>   
                <td class="btnPaging">  
                    <svg width="100%" height="62">
                    <defs>
                        <linearGradient id="grad3">
                            <stop offset="0%" stop-color="#FF8282"/>
                            <stop offset="100%" stop-color="#E178ED" />
                        </linearGradient>
                    </defs>
                     <rect x="5" y="5" rx="25" fill="none" stroke="url(#grad1)" width="95%" height="50"></rect>
                  </svg>
                  <span>
                       <asp:Button style="border:none; background-color:transparent" ID="btnNext" runat="server" Font-Bold="true" Text="Next" OnClick="btnNext_Click"/>
                  </span> 
                    
                </td>  
                <td class="btnPaging"> 
                    <svg width="100%" height="62">
                    <defs>
                        <linearGradient id="grad4">
                            <stop offset="0%" stop-color="#FF8282"/>
                            <stop offset="100%" stop-color="#E178ED" />
                        </linearGradient>
                    </defs>
                     <rect x="5" y="5" rx="25" fill="none" stroke="url(#grad1)" width="95%" height="50"></rect>
                  </svg>
                  <span>
                       <asp:Button style="border:none; background-color:transparent" ID="btnLast" runat="server" Font-Bold="true" Text="Last" OnClick="btnLast_Click"/>
                  </span> 
                    
                </td>  
                </tr>  
            </table> --%>

                        <br />
                     </div>
                 </div>

</asp:Content>
