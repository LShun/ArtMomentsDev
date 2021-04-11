<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdRectangle.ascx.cs" Inherits="ArtMoments.Content.user_controls.AdRectangles" %>

<div class="card">
    <div class="row">
        <div class="col-4">
            <asp:Image ID="imgAdvert" runat="server" CssClass="img-benefits" />
        </div>
        <div class="col-8">
            <div class="card-body">
                <asp:Label ID="lblTitle" runat="server" Text="" CssClass="card-title"></asp:Label>
                <asp:Label ID="lblDesc" runat="server" Text="" CssClass="card-title"></asp:Label>
            </div>
        </div>
    </div>
</div>
