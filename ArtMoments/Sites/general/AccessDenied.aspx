<%@ Page Title="Title" Language="C#" MasterPageFile="~/Masters/General.Master" CodeBehind="AccessDenied.aspx.cs" Inherits="ArtMoments.Sites.general.AccessDenied" %>

<asp:Content ID="cHead" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="cphBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Access Denied</h1>
    <p>You do not have permission to access this page. </p>
    <asp:Button ID="btnRedirectHome" runat="server" Text="Return to Homepage" PostBackUrl="~/Sites/general/HomePage.aspx" />
</asp:Content>