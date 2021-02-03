<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerPresentation.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerPresentation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style type="text/css">
        .auto-style1 {
            margin-left:40px;
            margin-top:90px;
                height: 6px;
            }
        .auto-style2 {
            height: 6px;
            width: 320px;
        }
        .auto-style4 {
            height: 27px;
            width: 100%;
        }
        .auto-style5 {
            height: 27px;
            width: 320px;
        }
        .auto-style7 {
            width:130px;
            height: 40px;
        }
        .auto-style8 {
            width:130px;
            height: 40px;
            background-color: #FFFFFF; 
            border-color: #FFFFFF;
        }
        .auto-style9 {
            margin-left: 40px;
        }
        .auto-style10 {
            margin-left: 160px;
        }
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
	<div class="row">
        <div class="col-md-3 ">
		        <div class="list-group ">
                    <a href="BuyerAccount.aspx"  class="list-group-item list-group-item-action">My Account</a>
                    <a href="BuyerSetting.aspx" class="list-group-item list-group-item-action active">Setting</a>
                    <a href="BuyerPresentation.aspx"  class="list-group-item list-group-item-action">Presentation</a>            
                </div> 
		   </div>
           <div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <div>
                              <div class="form-group row">
                                <asp:Label CssClass="auto-style9" ID="Label8" runat="server" Text="Bibliography"></asp:Label>
                                <div class="col-8">
                                  <asp:TextBox CssClass="auto-style9" ID="tbBibliography" runat="server" OnTextChanged="tbBibliography_TextChanged" ReadOnly="True"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <asp:Label CssClass="auto-style9" ID="Label9" runat="server" Text="Profile Picture"></asp:Label>
                                <div class="col-8">
                                  <asp:TextBox CssClass="auto-style9" ID="tbProfilePic" runat="server" OnTextChanged="tbProfilePic_TextChanged1" ReadOnly="True"></asp:TextBox>
                                  <br /><br />
                                    <asp:Image CssClass="auto-style9" ID="Image1" runat="server" Height="199px" Width="199px" />
                                </div>
                              </div>                            
                             
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <asp:Button class="btn btn-primary" ID="btnEdit" runat="server" Text="Edit" OnClick="Button1_Click" CssClass="buttonEditStyle"/>
                                </div>
                              </div>
                            </div>
		                </div>
		            </div>
		            
		        </div>
		    </div>
        </div>
    </div>
</div>
</asp:Content>
