<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style>
        body{
            background-color: burlywood;
        }
        .Auto-style1{
            margin-top: 10px;
            margin-left:95px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="form1" runat="server">
    <div>
        <asp:HiddenField ID="hfUserID" runat="server" />
        <h1 style="text-align:center; color:floralwhite">Sign Up</h1>
    <table style="margin:auto; border:5px solid white; padding:50px; color:white">
        <tr>
            <td>
                <asp:Label Text="User Name" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtUserName" runat="server" />
                <asp:Label Text="*" runat="server" ForeColor="Red" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label Text="Email" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtEmail" runat="server" />
            </td>
        </tr>    
        <tr>
            <td>
                <asp:Label Text="Password" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                 <asp:Label Text="*" runat="server" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Confirm Password" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
                <asp:Label Text="*" runat="server" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <asp:Button CssClass="Auto-style1" Text="Submit" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" />
            </td>
        </tr>

    </table>
    </div>
</div>
</asp:Content>
