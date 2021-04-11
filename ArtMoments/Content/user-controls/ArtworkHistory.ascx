<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArtworkHistory.ascx.cs" Inherits="ArtMoments.Content.user_controls.ArtworkHistory" %>

<div class="table">
    <div class="row">
        <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
    </div>
    <asp:DetailsView ID="dvArtwork" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="dsArtSource" ForeColor="Black" GridLines="Horizontal">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" Font-Bold="true" CssClass="paginate" />
        <PagerSettings Mode="NumericFirstLast"/>
        <Fields>
            <%-- Name + link to the products --%>
            <asp:BoundField
                DataField="prod_name"
                HeaderText="Name" />
            <%-- Image of the product --%>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="imgLatestProduct" runat="server" CssClass="latest"
                        ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_image")) %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="dsArtSource" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT TOP 50 [id], SUBSTRING([prod_name], 0, 35) AS prod_name, [prod_image] FROM [Product] ORDER BY [id] DESC"></asp:SqlDataSource>
</div>
