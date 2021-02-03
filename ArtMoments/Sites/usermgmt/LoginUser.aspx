﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.LoginUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login Form Design</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <link href="https://mdbootstrap.com/docs/b4/jquery/content/icons-list/" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ID="Content4">
    <div class="container" ID="Content5">
        
        <div class="myCard">
            <div class="row">
                <div class="col-md-10">
                    <i class="fas fa-times"></i>
                    <div class="myLeftCtn"> 
                        <form class="myForm text-center">
                            <header style="text-align:center; margin-left:30px">Login your Account</header>
                            <div class="form-group">
                                <i class="far fa-user"></i>                                
                                <asp:TextBox class="myInput" placeholder="Username" ID="txtUserName" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox class="myInput" placeholder="Password" ID="txtUserPassword" runat="server"></asp:TextBox>
                            </div>

                            <asp:Button class="butt" ID="Button1" OnClick="Button1_Click" runat="server" Text="LOGIN"></asp:Button>  
                            
                            <br />
                            <br />                            
                        </form>
                        <div>
                        <asp:Label ID="lblErrorLoginMsg" runat="server"></asp:Label>
                        <br />
                        <asp:HyperLink ID="noAccMsg" runat="server" NavigateUrl="~/Sites/usermgmt/SignUp.aspx" style="text-align:center;">No account yet? SignUp</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="forgetPassword" runat="server" style="text-align:center;">Forget you password?</asp:HyperLink>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</div> 
</asp:Content>
