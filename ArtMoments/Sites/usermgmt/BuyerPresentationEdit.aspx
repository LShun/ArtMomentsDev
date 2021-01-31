<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerPresentationEdit.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerPresentationEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title></title>
        <style type="text/css">
        .auto-style1 {
            margin-left:40px;
            margin-top:90px;
                height: 6px;
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
        .auto-style9 {
            margin-left: 40px;
        }
        .auto-style10 {
            margin-left: 160px;
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
                            <br />  <br /> 
                            <asp:Button runat="server" ID="Button2" Text="Presentation" CssClass="auto-style8" OnClick="btnPresentation_Click"></asp:Button>                                 
                             
                        </div>
                    </td>
                    <td class="auto-style4" style="padding:0px">
                        
                        <asp:Label CssClass="auto-style9" ID="Label8" runat="server" Text="Bibliography"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="auto-style9" ID="tbBibliography" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Label CssClass="auto-style9" ID="Label9" runat="server" Text="Profile Picture"></asp:Label>
                        <br />
                        <asp:TextBox CssClass="auto-style9" ID="tbProfilePic" runat="server" OnTextChanged="tbProfilePic_TextChanged"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Image CssClass="auto-style9" ID="Image1" runat="server" Height="199px" Width="199px" />
                        
                        <br />
                        <br />
                        <asp:Button CssClass="auto-style10" ID="btnSave" runat="server" Text="Save" Width="80px" OnClick="Button1_Click" />
                        <br />
                        <br />
                        <asp:Label CssClass="auto-style9" ID="lblSuccessMessage" runat="server"></asp:Label>
                        
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
    </form>
</asp:Content>
