<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdRectangles.ascx.cs" Inherits="ArtMoments.Content.user_controls.AdRectangles" %>

<div class="card">
    <div class="row">
        <div class="col-4">
            <img class="img-benefits" src="../../Content/hp-wishlist-stars.jpg" />
            <asp:Image ID="imgAdvert" runat="server" />
        </div>
        <div class="col-8">
            <div class="card-body">
                <h5 ID="hCardTitle" runat="server" Text="" CssClass="card-title"></h5>
                <asp:Label ID="lblCardText" runat="server" Text="" CssClass="card-title"></asp:Label>
            </div>
        </div>
    </div>
</div>
