<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login Form Design</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="myCard">
            <div class="row">
                <div class="col-md-6">
                    <div class="myLeftCtn"> 
                        <form class="myForm text-center">
                            <header>Create new account</header>
                            <div class="form-group">
                                <i class="far fa-user"></i>                                
                                <asp:TextBox class="myInput" placeholder="Username" ID="txtUserName" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <i class="far fa-envelope"></i>
                                <asp:TextBox class="myInput" placeholder="Email" ID="txtUserEmail" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox class="myInput" placeholder="Password" ID="txtUserPassword" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-unlock"></i>
                                <asp:TextBox class="myInput" placeholder="Confirmed Password" ID="txtConfirmedPassword" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>
                                    <input id="check_1" name="check_1"  type="checkbox" required><small> I read and agree to Terms & Conditions</small></input> 
                                    <div class="invalid-feedback">You must check the box.</div>
                                </label>
                            </div>
                            <asp:Button class="butt" ID="Button1" OnClick="Button1_Click" runat="server" Text="CREATE ACCOUNT"></asp:Button>  
                            
                            <br />
                            <br />
                            
                        </form>
                        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
                    </div>
                </div> 
                <div class="col-md-6" id="loginDesc">
                    <div>
                            <div class="box" ><header style="color:antiquewhite; font-size:25px; font-family:'Book Antiqua';">Welcome to Art Moments</header>
                            <br /><br /><br /><br />
                            <p style="color:floralwhite; padding:10px">“Go and make interesting mistakes, 
                                make amazing mistakes, make glorious and fantastic mistakes. 
                                Break rules. Leave the world more interesting for your being here. 
                                Make. Good. Art.” – Neil Gaiman</p>
                               
                            </div>
                                
                    </div>
                </div>
            </div>
        </div>
</div> 

</asp:Content>
