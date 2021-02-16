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

    <asp:Repeater ID="RepeaterCartInfo" runat="server">
            <ItemTemplate>
                <div>
                    <table>
                        <tr><th id="author"><asp:Label ID="lblAuthor" runat="server" ><%#Eval ("author_id") %></asp:Label></th></tr>
                        
                        <td id="btnArtImg" rowspan="6"><asp:ImageButton ID="BtnProdImg" runat="server" style="max-height:200px;max-width:200px" ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_img")) %>'/></td>

                        <tr><td>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="deleteItem"/></td></tr>
                        <tr><td id="prodName">ProdName <asp:Label ID="lblProdName" runat="server"><%#Eval("prod_name") %></asp:Label><asp:TextBox ID="txtProdId" runat="server" Text='<%# Eval("prod_id").ToString()%>' Visible="false" Enabled="false"></asp:TextBox></td></tr>
                        <tr><td id="prodPrice">RM <asp:Label ID="lblPrice" runat="server"><%#Eval ("prod_price") %></asp:Label></td></tr>
                        <tr><td id="qty">Qty: <asp:Button ID="btnMinusQty" runat="server" Text="-" OnClick="minusQty" /><asp:TextBox ID="txtQty" runat="server" Text='<%# Eval("quantity").ToString()%> ' onkeypress="numValid(event);" onfocusout="qtyValid();"></asp:TextBox> <asp:Button ID="btnPlusQty" runat="server" Text="+" OnClick="plusQty"/>
                            <asp:DropDownList ID="ddlDeliveryMethod" runat="server" DataSourceID="SqlDataSourceDeliver" DataTextField="deliver_type" DataValueField="id" SelectedValue='<%# Bind("deliver_id") %>' OnSelectedIndexChanged="ddlDeliverChg" AutoPostBack="True"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceDeliver" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security = True"
                        SelectCommand="Select id, deliver_type from delivery"></asp:SqlDataSource>
                            </td></tr>
                        <tr><td id="subtotal">Subtotal: RM <asp:Label ID="lblSubtotal" runat="server"><%#Eval ("subtotal") %></asp:Label></td></tr>
                        <tr><td id="availableStock">Available Stock: <asp:TextBox ID="txtAvailable" runat="server" Text='<%# Eval("prod_stock").ToString()%>' Enabled="false"></asp:TextBox></td></tr>

                    </table>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        Total Price: <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>

        <br />

        <script type="text/javascript">
            function numValid(evt) {
                var ch = String.fromCharCode(evt.which);
                if (!(/[0-9]/.test(ch))) {
                    evt.preventDefault();
                }
            }
            ContentPlaceHolder1_Repeater1_txtQty_0
            function qtyValid(qtyTextBox) {
                var qtyElement = evt.which
                var qtyInput = parseInt(qtyElement.value);
                var qtyAvailable = document.getElementsByName("txtAvailable");
                var maxQty = parseInt(qtyAvailable.textContent);

                if (qtyInput > 1) {
                    if (qtyInput > maxQty) {
                        qtyInput = maxQty;
                        qtyElement.value = qtyInput.toString();
                        calcMax(maxQty);
                        alert("The current available stock of this artwork is only " + maxQty + " pieces.");
                    }
                }
                else {
                    qtyInput = 1;
                    qtyElement.value = qtyInput.toString();
                    calcMin();
                    alert("Min stock = 1");
                }
                var onePiecePrice = document.getElementsByClassName("artworkPricePerPiece")[0];
                var artPiecePrice = parseFloat(onePiecePrice.textContent);
                var subtotal = artPiecePrice * qtyInput;
                document.getElementsByClassName("lblartworkPrice")[0].textContent = subtotal.toString();

            }

            function calcMin() {
                var onePiecePrice = document.getElementsByClassName("artworkPricePerPiece")[0];
                var artPiecePrice = parseFloat(onePiecePrice.textContent);
                var subtotal = artPiecePrice * 1;
                document.getElementsByClassName("lblartworkPrice")[0].textContent = subtotal.toString();
            }

            function calcMax(maxQty) {
                var onePiecePrice = document.getElementsByClassName("artworkPricePerPiece")[0];
                var artPiecePrice = parseFloat(onePiecePrice.textContent);
                var subtotal = artPiecePrice * maxQty;
                document.getElementsByClassName("lblartworkPrice")[0].textContent = subtotal.toString();
            }

        </script>
    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT C.id, C.product_id, C.quantity, C.user_id, P.id AS Expr1, P.prod_name, P.prod_image, P.prod_price, P.prod_stock, P.prod_sales, P.user_id AS Expr2, U.user_name, C.delivery_id, U.id AS Expr3 FROM CartItem AS C INNER JOIN Product AS P ON P.id = C.product_id INNER JOIN [User] AS U ON U.id = C.user_id WHERE (U.id = 1)"></asp:SqlDataSource>
 </asp:Content>
