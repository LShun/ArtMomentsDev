<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 309px;
        }
        .auto-style2 {
            width: 309px;
            height: 29px;
        }
        .auto-style3 {
            height: 29px;
        }
        .auto-style4 {
            margin-left: 400px;
            width: 90px;
            height: 40px;
        }
        .auto-style5 {
            width: 490px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label1" runat="server" Text="Change Password"></asp:Label>
                        <table>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label2" runat="server" Text="Enter current password: "></asp:Label>

                                </td>
                                <td>
                                    <asp:TextBox ID="tbPassword" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label3" runat="server" Text="Enter new password: "></asp:Label>

                                </td>
                                <td>
                                    <asp:TextBox ID="tbNewPassword" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2"> 
                                    <asp:Label ID="Label4" runat="server" Text="Confirmed new password: "></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="tbNewConPassword" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>

                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
                        <br />
                        <asp:Button class="auto-style4" ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>
