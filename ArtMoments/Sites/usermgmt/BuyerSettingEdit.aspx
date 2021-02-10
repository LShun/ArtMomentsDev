<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerSettingEdit.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerSettingEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="BuyerAccount.aspx" class="list-group-item list-group-item-action">My Account</a>
              <a href="BuyerSetting.aspx" class="list-group-item list-group-item-action active">Setting</a>
              <a href="BuyerPresentation.aspx" class="list-group-item list-group-item-action">Presentation</a>              
              
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
                                  <asp:TextBox ID="txtUserName" runat="server" placeholder="username" OnTextChanged="txtUserName_TextChanged" BorderColor="#999999" BorderStyle="Solid"></asp:TextBox>
                                  <asp:Label ID="errorMsg" runat="server" Text=""></asp:Label>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Email*</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" OnTextChanged="txtEmail_TextChanged" BorderColor="#999999" BorderStyle="Solid"></asp:TextBox>
                                  <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                Display="Dynamic" ErrorMessage="Invalid email address" CssClass="invalidMsgMargin"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                                ForeColor="Red" Display="Dynamic" ErrorMessage="Required" CssClass="invalidMsgMargin"/>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">Contact No</label> 
                                <div class="col-8">
                                    <asp:TextBox ID="txtContactNo" runat="server" placeholder="contact" OnTextChanged="txtContactNo_TextChanged" BorderColor="#999999" BorderStyle="Solid"></asp:TextBox>
                                </div>
                              </div>

                                 <asp:HyperLink ID="HyperLink1" runat="server" Font-Overline="False" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/Sites/usermgmt/ChangePassword.aspx">Change password</asp:HyperLink>
                                                              
                             
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <asp:Button class="btn btn-primary" ID="btnSave" runat="server" Text="Save" CssClass="buttonEditStyle" OnClick="btnSave_Click"/>
                                  <asp:Label ID="lblSuccessMessage" runat="server" Text=""></asp:Label>
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
