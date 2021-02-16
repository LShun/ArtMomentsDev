<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="ArtMoments.Sites.general.testing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" PostBackUrl="~/Sites/general/OrderArt.aspx" />
    <asp:Label ID="Label1" runat="server" Text=''></asp:Label>
    <asp:Label ID="Label2" runat="server" Text=''></asp:Label>
    <br />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="History" />
    <br />
    <asp:Button ID="CartBtn" runat="server" Text="Cart" OnClick="CartBtn_Click" />
</asp:Content>
