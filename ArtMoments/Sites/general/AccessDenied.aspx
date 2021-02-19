<%@ Page Title="Title" Language="C#" MasterPageFile="~/Masters/General.Master" CodeBehind="AccessDenied.aspx.cs" Inherits="ArtMoments.Sites.general.AccessDenied" %>

<asp:Content ID="cHead" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="cphBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 5vh 5vh; padding: 5vh 5vh">
        <h1>Access Denied</h1>
        <p>You do not have permission to access this page. Please login as the correct user to continue. </p>
        <p>You must login as a customer to browse art, and access customer-specific features</p>
        <p>You must login as a seller to access seller-specific features</p>
        <asp:Button ID="btnRedirectHome" runat="server" Text="Return to Homepage" PostBackUrl="~/Sites/general/HomePage.aspx" />
    </div>
    
</asp:Content>