<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentTemp.aspx.cs" Inherits="ArtMoments.Sites.client.PaymentTemp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnPaid" runat="server" Text="Pay" OnClick="btnPaid_Click" />
            <br />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
