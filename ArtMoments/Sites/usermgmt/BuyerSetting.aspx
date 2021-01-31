<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerSetting.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
        <style type="text/css">
        .auto-style1 {
            margin-left:40px;
            margin-top:90px;
        }
        .auto-style2 {
            height: 6px;
            width: 320px;
        }
        .auto-style4 {
            height: 27px;
            width: 100%;
        }
        .auto-style5 {
            height: 27px;
            width: 320px;
        }
        .auto-style7 {
            width:130px;
            height: 40px;
        }
        .auto-style8 {
            width:130px;
            height: 40px;
            background-color: #FFFFFF; 
            border-color: #FFFFFF;
        }
            .auto-style11 {
                width: 219px;
            }
            .auto-style12 {
                width: 219px;
                height: 48px;
            }
            .auto-style13 {
                height: 48px;
                width: 170px;
            }
            .auto-style14 {
                margin-left:90px;
                width:80px;
            }
            .auto-style15 {
                width: 170px;
            }
            .auto-style16{
                margin-left: 40px;
                margin-top: 40px;
            }
            .auto-style17 {
                width: 219px;
                height: 26px;
            }
            .auto-style18 {
                width: 170px;
                height: 26px;
            }
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td class="auto-style2">
                        <label style="margin-top:0px">ART_MOMENT</label>
                        <label style="margin-left: 50px">My Account</label>
                    </td>                    
                    <td class="auto-style1">
                        <asp:Label ID="Label6" runat="server" Text="Personal Information"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        
                        <div style="margin-left:170px; margin-top: 10px; width: 47%;">
                            <asp:Button runat="server" ID="btnHome" Text="Home" CssClass="auto-style8" OnClick="btnHome_Click"></asp:Button>                               
                            <br /><br />
                            <asp:Button runat="server" ID="btnSetting" Text="Setting" CssClass="auto-style7" OnClick="btnSetting_Click"></asp:Button>                                 
                            <br /><br />
                            <asp:Button runat="server" ID="btnPresentation" Text="Presentation" CssClass="auto-style8" OnClick="btnPresentation_Click"></asp:Button> 
                        </div>
                    </td>
                    <td class="auto-style4" style="padding:0px">

                        <table class="auto-style16">
                            <%--username--%>
                            <tr>
                                <td class="auto-style17">

                                    <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>

                                </td>
                                <td class="auto-style18">
                                    <asp:TextBox runat="server" ReadOnly="True" ID="tbUserName" OnTextChanged="tbUserName_TextChanged" BorderStyle="None"></asp:TextBox>

                                </td>
                            </tr>
                            <%--username--%>
                            <tr>
                                <td class="auto-style11">

                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>

                                </td>
                                <td class="auto-style15">

                                    <asp:TextBox ID="tbEmail" runat="server" ReadOnly="True" OnTextChanged="tbEmail_TextChanged" BorderStyle="None"></asp:TextBox>

                                </td>
                            </tr>
                            <%--username--%>
                            <tr>
                                <td class="auto-style11">

                                    <asp:Label ID="lblContactNo" runat="server" Text="Contact Number"></asp:Label>

                                </td>
                                <td class="auto-style15">

                                    <asp:TextBox ID="tbContactNo" runat="server" ReadOnly="True" OnTextChanged="tbContactNo_TextChanged" BorderStyle="None"></asp:TextBox>

                                </td>
                            </tr>
                            <%--username--%>
                            <tr>
                                <td class="auto-style11">

                                    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>

                                </td>
                                <td class="auto-style15">

                                    <asp:TextBox ID="tbAddress" runat="server" ReadOnly="True" OnTextChanged="tbAddress_TextChanged" BorderStyle="None"></asp:TextBox>

                                </td>
                            </tr>
                            <%--username--%>
                            <tr>
                                <td class="auto-style12">
                                    <br />
                                    <asp:HyperLink ID="hlChangePassword" runat="server" Font-Overline="False" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/Sites/usermgmt/ChangePassword.aspx">Change password</asp:HyperLink>

                                </td>
                                <td class="auto-style13">
                                    <br />
                                    <asp:Button CssClass="auto-style14" ID="btnEdit" runat="server" OnClick="Button1_Click" Text="Edit" />
                                    <br />
                                     <br />

                                </td>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>
