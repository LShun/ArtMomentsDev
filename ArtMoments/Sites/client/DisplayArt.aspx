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
                 <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="btnClear_Click" CausesValidation="false" />
                  
             </div>
            </div>

            <div class="row">
                <div class="col-3 form-group search-form-group">
                    <label>Price Range : Min (RM) </label>
                    <asp:TextBox ID="txtMinPR"  runat="server" CssClass="form-control search-form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revTxtMinPR" runat="server" 
                        ErrorMessage="Minimum Price Range only accept integer value"
                        ValidationExpression="^[1-9]\d*(\.\d+)?$" ControlToValidate="txtMinPR" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div class="col-3 form-group search-form-group">
                    <label>Price Range : Max (RM) </label>
                    <asp:TextBox ID="txtMaxPR" runat="server" CssClass="form-control search-form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revTxtMaxPR" runat="server" 
                        ErrorMessage="Maximum Price Range only accept integer value"
                        ValidationExpression="^[1-9]\d*(\.\d+)?$" ControlToValidate="txtMaxPR" ForeColor="Red"></asp:RegularExpressionValidator>
               
                </div>
                <div class="col-3 form-group search-form-group">
                    <label>Product Name </label>
                    <asp:TextBox ID="txtProdName" runat="server" CssClass="form-control search-form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revTxtProdName" runat="server" 
                        ErrorMessage="Only alphabet is allowed for Product Name"
                        ValidationExpression="^[a-zA-Z]+$" ControlToValidate="txtProdName" ForeColor="Red"></asp:RegularExpressionValidator>
               
                </div>
          
                <div class="col-3 form-group search-form-group" >
                     <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" PostBackUrl="~/Sites/client/DisplayArtProduct.aspx" />
                     <asp:ValidationSummary ID="revSummary" runat="server"  ShowMessageBox="true" ShowSummary="false" ForeColor="Red"/>
               </div>
            </div>
        </div>
        <div class="container" ID="display-img-container">
           <br/>
            
            <asp:Label ID="lblRecordMsg" runat="server" Text=""></asp:Label>
            <asp:DataList ID="dlProdCat" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Height="100%" Width="1024px" OnItemCommand="dlProdCat_ItemCommand" 
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
                    <asp:Image CssClass="img-responsive" ID="imgCategory_img" runat="server" Height="100%" Width="340px" 
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
