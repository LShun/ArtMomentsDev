<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="PreLogin.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.PreLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <title></title>
    <script src="../../Content/scripts/PreLogin.js"></script>
    <link href="../../Content/css/PreLogin.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="container" class="container">
        <div id="left" class="split left">        
            <h1>Art Enthusiast</h1>            
            <p>Browse, collect & buy art</p>
            <a class="button" href="LoginUser.aspx">Login as Buyer</a>
        </div>
        <div id="right" class="split right">
            <h1>Artist </h1>
            <p>Sell your art</p>
            <a class="button" href="LoginUser.aspx">Login as Artist</a>
        </div>
    </form>
</asp:Content>

