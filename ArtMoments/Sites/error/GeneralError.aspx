<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="GeneralError.aspx.cs" Inherits="ArtMoments.Sites.error.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 5vh 5vh; padding: 5vh 5vh">
        <h1>Whoops! Something is wrong.</h1>
        <p>Don't worry, it is logged on our server, and we will try and fix it.</p>
        <p>If the issue still persist for 24 hours, send us an email at: support@artmoments.com</p>
        <p>In the mean time, you may continue using other parts of the side as per usual: </p>
        <asp:Button ID="btnRedirectHome" runat="server" CssClass="btn btn-primary" Text="Return to Homepage" PostBackUrl="~/Sites/general/HomePage.aspx"/>
    </div>
</asp:Content>
