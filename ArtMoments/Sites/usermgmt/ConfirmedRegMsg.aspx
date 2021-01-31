<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="ConfirmedRegMsg.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.ConfirmedRegMsg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>

    <style>
        body{
            background-color:blanchedalmond
        }
        .auto-style1 {
            width: 188px;
            margin:auto; 
            text-align:center;
            border-color: black;
            border-width: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div style="margin:auto; text-align:center">
            <table style="text-align:center; align-content:center">
                <tr>
                    <td class="auto-style1">
                        <asp:Label runat="server" Text="Registration successful!"></asp:Label>
                        <br /><br />
                        <asp:Label runat="server" Text="Take a tour?"></asp:Label>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Go to Login" OnClick="Button1_Click"/>
                    </td>
                </tr>                
            </table>            
        </div>
    </form>
</asp:Content>
