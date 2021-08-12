<%@ Page Title="Order List" Language="C#" MasterPageFile="~/Masters/Artist1.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="ArtMoments.Sites.artist.OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        th {
            cursor: pointer;
            text-align: center;
            color: #fff;
            background-color: #343a40;
            border-color: #454d55;
        }

        table {
            border-collapse: collapse;
            color: #212529
        }

        .orderListTable tr:nth-of-type(odd) { background-color: rgba(0, 0, 0, .05) }

        td {
            display: table-cell;
            vertical-align: inherit;
        }

        @media (min-width: 1200px) {
            .container { max-width: 1140px; }
        }

        .container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }

        .pagination {
            display: flex;
            padding-left: 0;
            list-style: none;
            border-radius: 0;
        }

        .pagination a, .pagination span {
            display: block;
            height: 35px;
            width: 35px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .pagination a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696; /* Add a grey border */
        }

        .pagination span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2; /* Add a blue border */
            margin: 5px 5px 5px 5px; /* Add some space outside the box */
        }

        div.orderListHeader {
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 5px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between !important;
        }

        #ContentPlaceHolder1_txtSearch {
            background-image: url('../../Content/search--v2.png'); /* Add a search icon to input */
            background-position: 10px 10px;
            background-repeat: no-repeat; /* Do not repeat the icon image */
            background-size: 25px 25px; /*adjust background image size*/
            width: 50%;
            font-size: 16px; /* Increase font-size */
            padding: 12px 20px 12px 40px; /* Add some padding */
            border: 1px solid #ddd;
            margin-bottom: 12px; /* Add some space below the input */
        }

        .orderListTable {
            margin-bottom: 10px;
            border: 1px solid #dee2e6;
            display: block;
            width: 100%;
            overflow-x: auto;
        }

        *, ::after, ::before { box-sizing: border-box; }

        a {
            text-decoration: none;
            background-color: transparent;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-md-between orderListHeader">
            <h1>Artwork Order<asp:GridView ID="orderList" OnRowDataBound="orderList_RowDataBound" OnRowCommand="orderList_RowCommand" runat="server" DataSourceID="dsOrderList" DataKeyNames="ID" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True">
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last"/>
                <pagerstyle horizontalalign="Left" CssClass="pagination"/>
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID" HeaderStyle-ForeColor="White">
                        <ItemStyle Width="80" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

                    <asp:BoundField DataField="ProdName" HeaderText="Artwork Name" SortExpression="ProdName" HeaderStyle-ForeColor="White">
                        <ItemStyle Width="250" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" HeaderStyle-ForeColor="White">
                        <ItemStyle Width="100" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

                    <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="Qty" HeaderStyle-ForeColor="White">
                        <ItemStyle Width="100" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

                    <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" HeaderStyle-ForeColor="White">
                        <ItemStyle Width="120" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

                    <asp:BoundField DataField="DateOrder" HeaderText="Date Ordered" SortExpression="DateOrder" HeaderStyle-ForeColor="White" DataFormatString="{0:dd/MM/yyyy}">
                        <ItemStyle Width="120" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

                    <asp:BoundField DataField="DeliveryChannel" HeaderText="Delivery Channel" SortExpression="DeliveryChannel" HeaderStyle-ForeColor="White">
                        <ItemStyle Width="130" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

                    <asp:BoundField DataField="DateDelivery" HeaderText="Date Delivery" SortExpression="DateDelivery" HeaderStyle-ForeColor="White" DataFormatString="{0:dd/MM/yyyy}">
                        <ItemStyle Width="120" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

                    <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" SortExpression="OrderStatus" HeaderStyle-ForeColor="White">
                        <ItemStyle Width="100" HorizontalAlign="Center"/>
                        <HeaderStyle HorizontalAlign="Center"/>
                    </asp:boundfield>

            <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnStatus" runat="server" CommandName="handleStatus" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Test" CssClass="btn" Enabled="False" />
                    </ItemTemplate>
                </asp:TemplateField>


                </Columns>
            </asp:GridView>

            </h1>
        </div>
        <%--search textbox--%>
        <asp:TextBox ID="txtSearch" autocomplete="off" placeholder="Search for Artwork names.." runat="server"
            ></asp:TextBox>
        <%--OrderList--%>
        <div class="orderListTable">

            <asp:SqlDataSource ID="dsOrderList" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT O.id as [ID], P.prod_name as [ProdName], C.category_name as [Category], O.quantity as [Qty], U.user_name as [Customer], T.date_order as [DateOrder], D.deliver_type as [DeliveryChannel], O.date_delivery as [DateDelivery], O.order_status as [OrderStatus] FROM[ArtMomentsDb].[dbo].[Product] P, [ArtMomentsDb].[dbo].[Delivery] D, [ArtMomentsDb].[dbo].[Product_Category] C, [ArtMomentsDb].[dbo].[Order] O, [ArtMomentsDb].[dbo].[User] A, [ArtMomentsDb].[dbo].[User] U,[ArtMomentsDb].[dbo].[Transaction] T WHERE P.category_id = C.id AND O.product_id = P.id AND T.id = O.transaction_id AND O.delivery_id = D.id AND T.user_id = u.id AND A.id = P.user_id AND A.user_name = @user_name AND P.prod_name LIKE CONCAT('%', @ProdName, '%')" CancelSelectOnNullParameter="False">
                <SelectParameters>
                    <asp:SessionParameter Name="user_name" SessionField="UserName"/>
                    <asp:ControlParameter ControlID="txtSearch" DefaultValue="" Name="ProdName" PropertyName="Text"/>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

</asp:Content>