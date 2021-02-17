<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerSetting.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>    
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="BuyerAccount.aspx"  class="list-group-item list-group-item-action">My Account</a>
              <a href="BuyerSettingExtra.aspx" class="list-group-item list-group-item-action active">Setting</a>
              <a href="BuyerPresentation.aspx"  class="list-group-item list-group-item-action">Presentation</a>              
               <a href="HomePage.aspx"  class="list-group-item list-group-item-action">Log out</a>  
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
                                <label for="username" class="col-4 col-form-label">User Name*</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="txtUserName" runat="server" placeholder="username" OnTextChanged="txtUserName_TextChanged" ReadOnly="True" BorderColor="White" BorderStyle="None"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Email*</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" OnTextChanged="txtEmail_TextChanged" ReadOnly="True" BorderColor="White" BorderStyle="None"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">Contact No</label> 
                                <div class="col-8">
                                    <asp:TextBox ID="txtContactNo" runat="server" placeholder="contact" OnTextChanged="txtContactNo_TextChanged" ReadOnly="True" BorderColor="White" BorderStyle="None" CssClass="hpNoTxtBox"></asp:TextBox>
                                </div>
                              </div>

                                 <asp:HyperLink ID="HyperLink1" runat="server" Font-Overline="False" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/Sites/usermgmt/ChangePassword.aspx">Change password</asp:HyperLink>
                                                              
                             
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <asp:Button class="btn btn-primary" ID="btnEdit" runat="server" Text="Edit" CssClass="buttonEditStyle" OnClick="btnEdit_Click"/>
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
