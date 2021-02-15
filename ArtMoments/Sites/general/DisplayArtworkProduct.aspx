﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/General.Master"  CodeBehind="DisplayArtworkProduct.aspx.cs" Inherits="ArtMoments.Sites.general.DisplayArtworkProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Display Artwork</title>
    <link href="../../Content/css/searchForm.css" rel="stylesheet" />
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
                 <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" />
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
            <asp:DataList ID="dlProd" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Height="321px" Width="1059px" OnItemCommand="dlProd_ItemCommand" >
                <ItemTemplate>
                    <table class="w-100">
                        <tr>
                            <td>
                                <asp:Image ID="ibtnCategory_img" runat="server" Height="175px" Width="193px" 
                                    ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_image")) %>'/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCategory_name" runat="server" Text='<%# Eval("prod_name") %>'></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td>

                                <asp:Button ID="btnNavOrder" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="orderProd" Text="Order"/>

                            </td>
                        </tr>
                    </table>
<br />
                </ItemTemplate>
            </asp:DataList>
            <br />
         </div>
     </div>

</asp:Content>
