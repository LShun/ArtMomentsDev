<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ArtMoments.Sites.client.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .heading {
            margin-top: 40px;
            margin-bottom: 30px;
            background-color: paleturquoise;
            color: white;
            text-shadow: 1px 1px black;
        }

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <header>
        <div class="row justify-content-center heading">
            <h1 class="orderHistoryHeader">Order History</h1>
        </div>
    </header>

    <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div>
                    <table>
                        <tr><th id="author"><asp:Label ID="lblAuthor" runat="server" ><%#Eval ("user_name") %></asp:Label></th></tr>
                        
                        <td id="btnArtImg" rowspan="5"><asp:ImageButton ID="BtnProdImg" runat="server" style="max-height:200px;max-width:200px" ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_image")) %>'/></td>

                        <tr><td id="prodName">ProdName <asp:Label ID="lblProdName" runat="server"><%#Eval("prod_name") %></asp:Label><asp:TextBox ID="txtProdId" runat="server" Text='<%# Eval("prod_id").ToString()%>' Visible="false" Enabled="false"></asp:TextBox></td></tr>
                        <tr><td id="prodPrice">RM <asp:Label ID="lblPrice" runat="server"><%#Eval ("prod_price") %></asp:Label></td></tr>
                        <tr><td id="qty">Qty: <asp:Button ID="btnMinusQty" runat="server" Text="-" OnClick="minusQty"/><asp:TextBox ID="txtQty" runat="server" Text='<%# Eval("cart_quantity").ToString()%> '></asp:TextBox> <asp:Button ID="btnPlusQty" runat="server" Text="+" OnClick="plusQty"/></td></tr>
                        <tr><td id="subtotal">Subtotal: <asp:Label ID="lblSubtotal" runat="server" Text=""></asp:Label></td></tr>
                        <tr><td id="availableStock">Available Stock: <asp:TextBox ID="txtAvailable" runat="server" Text='<%# Eval("available_stock").ToString()%>' Enabled="false"></asp:TextBox></td></tr>

                    </table>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <script type="text/javascript">

        </script>
 </asp:Content>
