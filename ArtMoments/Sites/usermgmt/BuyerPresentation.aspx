<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerPresentation.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerPresentation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	<div class="row">
        <div class="col-md-3 ">
		        <div class="list-group ">
                    <a href="BuyerAccount.aspx"  class="list-group-item list-group-item-action">My Account</a>
                    <a href="BuyerSetting.aspx" class="list-group-item list-group-item-action">Setting</a>
                    <a href="BuyerPresentation.aspx"  class="list-group-item list-group-item-action active">Presentation</a>            
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
                                <label for="website" class="col-4 col-form-label">Bibliography</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="tbBibliography" runat="server" OnTextChanged="tbBibliography_TextChanged" ReadOnly="True" BorderStyle="None"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                  <label for="website" class="col-4 col-form-label">Profile Picture</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="tbProfilePic" runat="server" OnTextChanged="tbProfilePic_TextChanged1" ReadOnly="True" BorderStyle="None"></asp:TextBox>
                                  <br /><br />
                                    <asp:Image ID="Image1" runat="server" Height="199px" Width="199px" />
                                </div>
                              </div>                            
                             
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <asp:Button class="btn btn-primary" ID="btnEdit" runat="server" Text="Edit" OnClick="Button1_Click" CssClass="buttonEditStyle" />
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
