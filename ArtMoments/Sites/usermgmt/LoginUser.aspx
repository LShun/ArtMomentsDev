<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.LoginUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login Form Design</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <link href="../../Content/css/UserMangementStyle.css" rel="stylesheet" />    
    <%--<link href="../../Content/css/LoginUser.css" rel="stylesheet" />--%>

    <style>
        .errorMsg{
            color:red;
            font-style:italic;
            font-size:15px;
        }
        body{
            background-image: url("../../Content/209971-abstract-flowers-white-pink-paint_splatter.jpg")
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ID="Content4">
    <div class="container" ID="Content6">        
        <div class="myCard">            
                <div class="col-md-10">                    
                        <div class="myLeftCtn" style="height:0px"> 
                        <form class="myForm text-center">
                            <header style="text-align:center; margin-left:30px">Login your Account</header>
                            <div class="form-group">                                                               
                                <asp:TextBox class="myInput" placeholder="Username" ID="txtUserName" runat="server" OnTextChanged="txtUserName_TextChanged" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>

                            <div class="form-group">                                
                                <asp:TextBox class="myInput" placeholder="Password" ID="txtUserPassword" runat="server" OnTextChanged="txtUserPassword_TextChanged" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:Label Text="*" runat="server" ForeColor="Red" />
                            </div>

                            <asp:Button class="butt" ID="btnLogin" runat="server" Text="LOGIN" OnClick="btnLogin_Click"></asp:Button>  
                            <br /> 
                            <br />                          
                        </form>
                        <div>
                        <asp:Label ID="lblErrorLoginMsg" runat="server" CssClass="errorMsg">Wrong User Name or Password!</asp:Label>
                        <br />
                        <asp:HyperLink ID="hlNoAccMsg" runat="server" NavigateUrl="~/Sites/usermgmt/SignUp.aspx" style="text-align:center;">No account yet? SignUp</asp:HyperLink>
                        <br />
                        <asp:HyperLink ID="hlForgetPassword" runat="server" style="text-align:center;">Forget you password?</asp:HyperLink>
                        </div>
                    </div>
                 </div>
            </div>
       </div>
    </div>
</div>
</asp:Content>
