<%@ Page Title="Home" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ArtMoments.Sites.general.HomePage2" %>
<%@ Register TagPrefix="AdRectangle" TagName="AdRect" Src="~/Content/user-controls/AdRectangle.ascx"%>
<%@ Register TagPrefix="ArtworkHistory" TagName="ArtHistory" Src="~/Content/user-controls/ArtworkHistory.ascx"%>
<asp:Content ID="cphHead" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/css/HomePage.css" rel="stylesheet" />
    <style>
        
       

    </style>

</asp:Content>
<asp:Content ID="cphBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- Welcome -->
        <div class="table">
            <div class="row">
                <div class="col-6">
                    <div class="jumbotron">
                        <h1 class="display-5">Welcome to ArtMoments Art Gallery</h1>
                        <p class="lead">We specialize in selling interesting artworks</p>
                        <hr />
                    </div>
                </div>
                <div class="col-6">
                    <ArtworkHistory:ArtHistory ID="ahLatestArt" runat="server"/>
                </div>
            </div>

            <!-- Benefits -->
            <h1>Benefits of Signing Up</h1>

            <!-- Customer Benefits -->
            <h2>Customers</h2>
            <div class="row">
                <div class="col-6">
                    <AdRectangle:AdRect ID="adRectCustomer1" runat="server" />
                </div>
                <div class="col-6">
                    <AdRectangle:AdRect ID="adRectCustomer2" runat="server" />
                </div>
            </div>
            <h2>Artists</h2>
            <div class="row">
                <div class="col-6">
                    <AdRectangle:AdRect ID="adRectArtist1" runat="server" />
                </div>
                <div class="col-6">
                    <AdRectangle:AdRect ID="adRectArtist2" runat="server" />
                </div>
            </div>
        </div>

        <!-- Sign up & Login Buttons -->
        <asp:Panel CssClass="alert alert-primary" Id="pnlInterested" RunAt="server" role="alert" Visible="true" OnLoad="pnlInterested_Load">
            <h2>Interested?
             <a href="../usermgmt/SignUp.aspx" type="button" class="btn btn-primary">Sign up!</a>
                <a href="../usermgmt/LoginUser.aspx" type="button" class="btn btn-outline-primary">Login!</a>
            </h2>
        </asp:Panel>
    </div>
</asp:Content>
