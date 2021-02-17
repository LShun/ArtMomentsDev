<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="ArtMoments.Sites.artist.OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        th {
            cursor: pointer;
            text-align:center;
            color:#fff;
            background-color:#343a40;
            border-color:#454d55;
        }
        table{
            border-collapse:collapse;
            color:#212529
        }
        .orderListTable tr:nth-of-type(odd){
            background-color:rgba(0,0,0,.05)
        }
        td {
            display: table-cell;
            vertical-align: inherit;
        }
        @media (min-width: 1200px){
            .container{
                max-width: 1140px;

            }
        }
        .contaner{
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
            border-radius:0;
        }
        .pagination a, .pagination span
        {
        display: block;
        height: 35px;
        width: 35px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        }
        .pagination a
        {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }
        .pagination span
        {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
            margin:5px 5px 5px 5px;
        }
        div.orderListHeader{
            margin-top:10px;
            margin-bottom:10px;
            margin-left:5px;
            display: flex;           
            flex-wrap: wrap;           
            justify-content: space-between!important;
        }
        #ContentPlaceHolder1_txtSearch{
        background-image: url('../../Content/search--v2.png'); /* Add a search icon to input */
        background-position: 10px 10px; /* Position the search icon */
        background-repeat: no-repeat; /* Do not repeat the icon image */
        background-size: 25px 25px; /*adjust background image size*/
        width: 50%; /* Full-width */
        font-size: 16px; /* Increase font-size */
        padding: 12px 20px 12px 40px; /* Add some padding */
        border: 1px solid #ddd; /* Add a grey border */
        margin-bottom: 12px; /* Add some space below the input */
		}
        .orderListTable{
            margin-bottom:10px;
            border: 1px solid #dee2e6;
            display: block;
            width: 100%;
            overflow-x: auto;
        }

        *, ::after, ::before {
            box-sizing: border-box;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-md-between orderListHeader">
			<h1>Artwork Order</h1>
	    </div>

	    <asp:TextBox ID="txtSearch" OnTextChanged="Search" AutoPostBack="true" placeholder="Search for Artwork names.." runat="server"></asp:TextBox>
        <div class="orderListTable"> 
            <asp:GridView ID="orderList" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" OnSorting="OnSorting" OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged">
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last"/>       
            <pagerstyle horizontalalign="Left" CssClass="pagination"/>
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Order ID" SortExpression="ID" HeaderStyle-ForeColor="White" >
                        <ItemStyle Width="80" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>

                    <asp:BoundField DataField="ProdName" HeaderText="Artwork Name" SortExpression="ProdName" HeaderStyle-ForeColor="White" >
                        <ItemStyle Width="250" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>

                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" HeaderStyle-ForeColor="White" >
                        <ItemStyle Width="100" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>

                    <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="Qty" HeaderStyle-ForeColor="White" >
                        <ItemStyle Width="100" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>

                    <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" HeaderStyle-ForeColor="White" >
                        <ItemStyle Width="120" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>

                    <asp:BoundField DataField="DateOrder" HeaderText="Date Ordered" SortExpression="DateOrder" HeaderStyle-ForeColor="White" DataFormatString="{0:dd/MM/yyyy}" >
                        <ItemStyle Width="120" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>

                    <asp:BoundField DataField="DeliveryChannel" HeaderText="Delivery Channel" SortExpression="DeliveryChannel" HeaderStyle-ForeColor="White" >
                        <ItemStyle Width="130" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>

                    <asp:BoundField DataField="DateDelivery" HeaderText="Date Delivery" SortExpression="DateDelivery" HeaderStyle-ForeColor="White" DataFormatString="{0:dd/MM/yyyy}" >
                        <ItemStyle Width="120" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>

                    <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" SortExpression="OrderStatus" HeaderStyle-ForeColor="White" >
                        <ItemStyle Width="100" HorizontalAlign="Center" /> 
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:boundfield>
                </Columns>
            </asp:GridView>
	    </div>
    </div>

</asp:Content>
