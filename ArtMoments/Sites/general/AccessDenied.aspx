<%@ Page Title="Access Denied" Language="C#" MasterPageFile="~/Masters/General.Master" CodeBehind="AccessDenied.aspx.cs" Inherits="ArtMoments.Sites.general.AccessDenied" %>

<asp:Content ID="cHead" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/css/HomePage.css" rel="stylesheet"/>
</asp:Content>

<asp:Content ID="cphBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 5vh 5vh; padding: 5vh 5vh">
        <h1>Access Denied</h1>
        <p>You do not have permission to access this page. Please login as the correct user to continue (on the top bar). </p>
        <p>You must login <b>as a customer</b> to browse art, and access customer-specific features</p>
        <p>You must login <b>as a seller</b> to access seller-specific features. Sellers cannot browse for products.</p>
        <asp:Button ID="btnRedirectHome" runat="server" CssClass="btn btn-primary" Text="Return to Homepage" PostBackUrl="~/Sites/general/HomePage.aspx"/>
    </div>

</asp:Content>