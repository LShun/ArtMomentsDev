<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerAccount.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title></title>

    <style type="text/css">
        .auto-style2 {
            height: 6px;
            width: 320px;
        }
        .auto-style3{
            margin-left:170px; 
            margin-top: 30px; 
            width: 47%;
        }
        .auto-style4 {
            height: 27px;
            width: 100%;
        }
        .auto-style5 {
            height: 27px;
            width: 320px;
        }
        .auto-style6 {
            padding:10px; 
            width:10%; 
            background-color:antiquewhite;
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
                    <td class="auto-style1"><label>Welcome</label></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        
                        <div class="auto-style3">
                            <asp:Button runat="server" class="auto-style7" id="btnHome" Text="Home" OnClick="btnHome_Click"></asp:Button>                                
                            <br /><br />
                            <asp:Button runat="server" class="auto-style8" id="btnSetting" onclick="btnOnClickSetting" Text="Setting"></asp:Button>                                
                            <br /><br />
                            <asp:Button runat="server" ID="Button1" Text="Presentation" CssClass="auto-style8" OnClick="btnPresentation_Click"></asp:Button>
                        
                        </div>
                    </td>
                    <td class="auto-style4" style="padding:0px">
                        <div style="margin-top: 0px">
                            <table style="margin:10px; width:60%">
                                <tr>
                                    <td class="auto-style6">
                                        <asp:Label runat="server" Text="Followed Artist"></asp:Label>
                                        <br/>
                                        <asp:Label runat="server" Text="Start following your favourite artist"></asp:Label>
                                    </td>
                                    <td style="width:1%"></td>
                                    <td class="auto-style6">
                                        <asp:Label runat="server" Text="My favourite"></asp:Label>
                                        <br/>
                                        <asp:Label runat="server" Text="Start collecting art"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>
