<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Masters/Client1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ArtMoments.Sites.client.Cart" UnobtrusiveValidationMode="None"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    @import url('./Art_Moments/artmoments-fonts.css');

    .heading {
            margin-top: 40px;
            margin-bottom: 30px;
            color: black;
            padding-left: 17rem;
        }

    input.btnDelete {
        background-color: transparent;
        border-radius: 20px;
        background-color: red;
        color: white;
        border-color: transparent;
        font-size: 12px;
        float: right;
    }

    span.lbtnProdName {
        font-size: 20px;
        font-weight: bold;
    }

    input.txtQty {
        width: 45px;
        text-align: center;
    }

    .cartDiv {
        margin-left: 50px;
        margin-right: 50px;
    }

    td.imgTr {
        padding-right: 60px;
        text-align: center;
    }

    .rightCol {
        min-width: 300px;
    }

    #prodName {
        font-size: 23px;
        font-weight: bold;
    }

    .cartTable {
        margin-right: auto;
        margin-left: auto;
        border-bottom: groove;
    }

    div#totalPrice {
        float: right;
        margin-top: 15px;
    }

    div#btnCheckout {
        float: right;
        margin-right: -180px;
        margin-top: 50px;
    }

    input#ContentPlaceHolder1_btnCheckout {
        background-color: dodgerblue;
        color: white;
        font-weight: bold;
        border-radius: 20px;
        border-color: transparent;
        padding-left: 10px;
        padding-right: 10px;
        font-size: 16px;
        width:180px;
    }

    input.txtAvailable {
        width: 30px;
        text-align: center;
        background-color: transparent;
        border-color: transparent;
    }

    td#availableStock {
        font-size: 12px;
        color: darkgray;
        font-style: italic;

    }

    td#subtotal {
        color: orangered;
    }

    div#totalPrice {
        margin-right: 200px;
    }

    span#ContentPlaceHolder1_RepeaterCartInfo_defaultItem {
        padding-left: 17rem;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <header>
        <div class="row justify-content-center heading">
            <h1 class="orderHistoryHeader">Cart</h1>
        </div>
    </header>

    <asp:Repeater ID="RepeaterCartInfo" runat="server">
            <ItemTemplate>
                <div class="cartDiv">
                    <table class="cartTable">
                        <!-- Artwork Img -->
                        <td id="btnArtImg" rowspan="8" class="imgTr"><asp:ImageButton ID="BtnProdImg" runat="server" style="max-height:200px;max-width:200px" ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("prod_img")) %>' OnClick="viewProdDetailImg" /></td>

                        <!-- Button to delete particular artwork -->
                        <tr><td class="rightCol">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="deleteItem" CssClass="btnDelete"/></td></tr>
                        <!-- Artwork Name & Invisivible artwork id-->
                        <tr><td id="prodName" class="rightCol"><asp:LinkButton ID="lbtnProdName" runat="server" class="rightCol" OnClick="viewProdDetailName"><%#Eval("prod_name") %></asp:LinkButton><asp:TextBox ID="txtProdId" runat="server" Text='<%# Eval("prod_id").ToString()%>' Visible="false" Enabled="false" CssClass="txtProdId" ></asp:TextBox></td></tr>
                        <!-- Artwork price per piece -->
                        <tr><td id="prodPrice"  class="rightCol">RM <asp:Label ID="lblPrice" runat="server"><%#DataBinder.Eval(Container.DataItem,"prod_price","{0:f}") %></asp:Label></td></tr>
                        <!-- Artwork qty (plus, minus btn & txt box)-->
                        <tr><td id="qty"  class="rightCol">Quantity: <asp:Button ID="btnMinusQty" runat="server" Text="-" OnClick="minusQty" />
                            <asp:TextBox ID="txtQty" runat="server" Text='<%# Eval("quantity").ToString()%> ' onkeypress="numValid(event);" onfocusout="qtyValid();" CssClass="txtQty" OnTextChanged="txtQtyChg" Enabled="false"></asp:TextBox>
                            <asp:Button ID="btnPlusQty" runat="server" Text="+" OnClick="plusQty" CssClass="btnPlusQty" />                          
                           <!-- Artwork delivery method (dropdownlist) & Range validator-->
                            <tr><td  class="rightCol">Delivery Method: <asp:DropDownList ID="ddlDeliveryMethod" CssClass="ddlDeliveryMethod" runat="server" DataSourceID="SqlDataSourceDeliver" DataTextField="deliver_type" DataValueField="id" SelectedValue='<%# Bind("deliver_id") %>' OnSelectedIndexChanged="ddlDeliverChg" AutoPostBack="True" ></asp:DropDownList></td></tr>
                            <asp:SqlDataSource ID="SqlDataSourceDeliver" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security = True"
                        SelectCommand="Select id, deliver_type from delivery"></asp:SqlDataSource>
                            </td></tr>
                        <!-- Subtotal for each artwork column-->
                        <tr><td id="subtotal" class="subtotal">Subtotal: RM<asp:Label ID="lblSubtotal" runat="server"><%#DataBinder.Eval(Container.DataItem,"subtotal","{0:f}") %></asp:Label></td></tr>
                        <!-- Available stock of artwork -->
                        <tr><td id="availableStock" class="availableStock">Available Stock: <asp:TextBox ID="txtAvailable" runat="server" CssClass="txtAvailable" Text='<%# Eval("prod_stock").ToString()%>' Enabled="false" onfocusout="ValidateQty();"></asp:TextBox></td></tr>
                    </table>
                </div>
            </ItemTemplate>
       
        <FooterTemplate>
             <!-- display when no item in the cart -->
            <asp:Label ID="defaultItem" runat="server" 
                Visible='<%# RepeaterCartInfo.Items.Count == 0 %>' Text="No items found" />
        </FooterTemplate>
        </asp:Repeater>
        <!-- display total price of all item in the cart -->
        <div id="totalPrice"><b><asp:Label ID="lblTotalPriceTxt" runat="server" Text="Total Price: RM" Visible="false"></asp:Label><asp:Label ID="lblTotalPrice" runat="server" Visible="false"></asp:Label></b></div>
        <!-- checkout button -->
        <div id="btnCheckout"><asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" Visible="false" /></div>

        <br />
        <!-- restrict user input to only number-->
        <script type="text/javascript">
            function numValid(evt) {
                var ch = String.fromCharCode(evt.which);
                if (!(/[0-9]/.test(ch))) {
                    evt.preventDefault();
                }
            }

        </script>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT C.id, C.product_id, C.quantity, C.user_id, P.id AS Expr1, P.prod_name, P.prod_image, P.prod_price, P.prod_stock, P.prod_sales, P.user_id AS Expr2, U.user_name, C.delivery_id, U.id AS Expr3 FROM CartItem AS C INNER JOIN Product AS P ON P.id = C.product_id INNER JOIN [User] AS U ON U.id = C.user_id WHERE (U.id = 1)"></asp:SqlDataSource>
 </asp:Content>


