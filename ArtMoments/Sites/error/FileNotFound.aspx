<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="FileNotFound.aspx.cs" Inherits="ArtMoments.Sites.error.GeneralError" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/css/HomePage.css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 5vh 5vh; padding: 5vh 5vh">
        <h1>Whoops! File Not Found. Error Number: 404</h1>
        <p>You seem to have stumbled in a page that cannot be found on our server.</p>
        <p>If you <b>entered a URL link</b>: please recheck your link, or it may have moved.</p>
        <p>If you <b>clicked a button or link</b>: please write us an email at support@artmoments.com to report the issue</p>
        <asp:Button ID="btnRedirectHome" runat="server" CssClass="btn btn-primary" Text="Return to Homepage" PostBackUrl="~/Sites/general/HomePage.aspx"/>
    </div>
</asp:Content>
