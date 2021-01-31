<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="HomePage2.aspx.cs" Inherits="ArtMoments.Sites.general.HomePage2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table class="auto-style6">
            <tr>
                <td class="auto-style3">
                    <asp:Panel ID="Panel1" runat="server" Width="50%">
                        <p>Welcome to ArtMoments Art Gallery</p>
                        <p>We specialize in selling &quot;interesting arts&quot;</p>
                        Etc...
                    </asp:Panel>
                </td>
                <td class="auto-style1">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" />
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton3" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton2" runat="server" />
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton4" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <h3 style="text-align: center;">Spotlight Artist</h3>
                </td>
            </tr>
        </table>

        <div style="width: 50%;">
            <h2>Benefits of Account</h2>
            <p>Description</p>
            <p>etc....</p>
        </div>
        <div style="width: 50%;">
            <div style="display: block;">
                <asp:Image ID="Image1" runat="server" /></div>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
        </div>
        <div>
            <h2>Categories</h2>
            <div style="width: 50%;">
                <asp:Image ID="Image2" runat="server" />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Button" />
            </div>
            <div style="width: 50%;">
                <asp:Image ID="Image3" runat="server" />
                <br />
                <asp:Button ID="Button2" runat="server" Text="Button" />

            </div>
        </div>
</asp:Content>
