<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.LoginUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>

    <style>
        body{
            background-image:url(Images/5cbf9dc0bb9e6.jpg)
        }
        .Auto-style1{
            margin-top:10px;
            margin-left: 130px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="form1" runat="server">
        <div>
            <h1 style="text-align:center">Login In</h1>
            <table style="margin:auto; border:5px solid white; padding:50px">
                <%--username--%>
                <tr>
                    <td>
                        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
                </tr>
                <%--password--%>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <%--login button--%>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button CssClass="Auto-style1" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></td>
                </tr>
                <%--eror message--%>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblErrorLoginMsg" runat="server" Text="Incorrect username or password!" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a href="SignUp.aspx">No account yet? SignUp</a></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
