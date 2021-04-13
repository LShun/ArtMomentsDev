<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="ArtMoments.Sites.client.Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        .summaryTable tr:nth-of-type(odd) {
            background-color: rgba(0,0,0,.05)
        }

        td {
            display: table-cell;
            vertical-align: inherit;
        }

        @media (min-width: 1200px) {
            .container {
                max-width: 1140px;
            }
        }

        .container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
            width: 45%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }

        .summaryTable {
            margin-bottom: 10px;
            display: block;
            width: 100%;
            background-color: #faf7f7;
        }

        *, ::after, ::before {
            box-sizing: border-box;
        }

        @media (min-width: 992px) {
            .col-lg-10 {
                -ms-flex: 0 0 83.333333%;
                flex: 0 0 83.333333%;
                max-width: 83.333333%;
            }
        }

        @media (min-width: 768px) {
            .col-md-9 {
                -ms-flex: 0 0 75%;
                flex: 0 0 75%;
                max-width: 75%;
            }
        }

        @media (min-width: 576px) {
            .col-sm-8 {
                -ms-flex: 0 0 66.666667%;
                flex: 0 0 66.666667%;
                max-width: 66.666667%;
            }
        }

        .col, .col-lg-10, .col-md-8, .col-sm-8, .col-6 {
            position: relative;
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
        }

        .col-6 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 50%;
            flex: 0 0 50%;
            max-width: 50%;
        }

        .col-5, .col-7 {
            position: relative;
            width: 100%;
        }

        .col-5 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 41.666667%;
            flex: 0 0 41.666667%;
            max-width: 41.666667%;
        }

        .col-7 {
            -webkit-box-flex: 0;
            -ms-flex: 0 0 58.333333%;
            flex: 0 0 58.333333%;
            max-width: 58.333333%;
        }

        a {
            text-decoration: none;
            background-color: transparent;
        }

        .companyTitle {
            padding-right: 0px;
            padding-left: 0px;
            text-align: center;
        }

        .rowHeader {
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
        }

        .row {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
        }

        .thanksMsg {
            overflow-wrap: break-word;
            word-break: break-word;
            padding: 0px 10px 15px;
            text-align: center;
            justify-content: space-between !important;
        }

        .itemTable {
            margin-bottom: 10px;
            border: 1px solid #dee2e6;
            display: block;
            width: 100%;
            overflow-x: auto;
        }

            .itemTable tr:nth-of-type(odd) {
                background-color: rgba(0,0,0,.05)
            }

        #delieryFeeDetailView {
            margin-left: 318px;
        }

        #lblTxtTotal {
            margin-left: 320px;
        }

        #lblTotal {
            margin-left: 213px;
            margin-block-start: 120px;
        }

        .deliveryTable {
            margin-bottom: 10px;
            display: block;
            width: 100%;
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="artworkListHeader">
                <div class="companyTitle">
                    <h1>ArtMoments</h1>
                </div>
            </div>

            <div class="rowHeader">
                <div class="thanksMsg">
                    <div style="color: #000000; line-height: 140%; word-wrap: break-word;">
                        <p style="font-size: 14px; line-height: 140%; text-align: center;">
                            <span style="font-family: Cabin, sans-serif; font-size: 34px; line-height: 47.6px; color: #444444;">
                                <strong><span style="line-height: 47.6px; font-size: 34px;">Thanks for your order</span></strong>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
            <!--Show Summary-->
            <div class="summaryTable">
                <div class="row">
                    <div class="col-6" style="border: 1px solid #dee2e6; padding-top: 10px; padding-bottom: 10px;">
                        <strong>
                            <asp:Label ID="lblSummary" runat="server" Text="Label">SUMMARY</asp:Label>
                        </strong>
                        <div class="row">
                            <div class="col-5">
                                <asp:Label ID="lblOrderIDTxt" runat="server" Text="Label">Transaction ID:</asp:Label>
                            </div>
                            <div class="col-7">
                                <asp:Label ID="lblOrderID" runat="server" Text='<%# Eval("id") %>' />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-5">
                                <asp:Label ID="lblOrderDateTxt" runat="server" Text="Label">Order Date:</asp:Label>
                            </div>
                            <div class="col-7">
                                <asp:Label ID="lblOrderDate" runat="server" Text='<%#DataBinder.Eval("order_date", "{0:dd/MM/yyyy}") %>' />
                            </div>
                        </div>
                    </div>

                    <div class="col-6" style="border: 1px solid #dee2e6; padding-top: 10px; padding-bottom: 10px;">
                        <strong>
                            <asp:Label ID="lblAddress" runat="server" Text="Label">Shipping Address</asp:Label>
                        </strong>
                        <div class="row">
                            <asp:Label ID="lblName" runat="server" Text="" />
                        </div>
                        <div class="row">
                            <asp:Label ID="lblShippingAddr" runat="server" Text="" />
                        </div>
                    </div>
                </div>
            </div>

            <%--item List--%>
            <div class="itemTable">
                <asp:GridView ID="itemList" runat="server" AutoGenerateColumns="False" DataSourceID="dsOrderList" OnRowCommand="itemList_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Product Name">
                            <ItemStyle Width="130" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Image ID="prodImage" runat="server" Width="97px" Height="97px" Style="padding-left: 10px" ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[]) Eval("Image")) %>' />
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="">
                            <ItemStyle Width="500" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="prodName" runat="server" Text='<%# Eval("ProdName") %>' Style="font-weight: bold; padding-left: 10px"></asp:Label>
                                <br />
                                <asp:Label ID="prodDesc" runat="server" Text='<%# Eval("Category") %>' Style="padding-left: 10px"></asp:Label>
                                <br />
                                <asp:Label ID="prodSize" runat="server" Text='<%# Eval("Size") %>' Style="padding-left: 10px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" HeaderStyle-ForeColor="White">
                            <ItemStyle Width="150" HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Price" HeaderText="Price (RM)" DataFormatString="{0:n}">
                            <ItemStyle Width="140" HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Subtotal (RM)">
                            <ItemStyle Width="200" HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="subtotal" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "subtotal", "{0:f}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="dsOrderList" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT O.transaction_id as [id], O.quantity as [Quantity], P.prod_name as [ProdName], P.prod_size as [Size], P.prod_price as [Price], P.prod_image as [Image], (O.quantity*P.prod_price) as [subtotal], C.category_name as [Category] FROM Product P , Product_Category C, [Order] O WHERE O.transaction_id = @transactionId AND P.category_id = C.id AND p.id = o.product_id" CancelSelectOnNullParameter="False">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblOrderID" Name="transactionId" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>



            </div>
            <%--delivery List--%>
            <div class="deliveryTable">
                <asp:DetailsView ID="delieryFeeDetailView" runat="server" AutoGenerateRows="False" BackColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="4" DataSourceID="dsDelivery" ForeColor="Black" GridLines="Horizontal" EnableTheming="False">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                    <Fields>
                        <asp:TemplateField HeaderText="Delivery Fees: ">
                            <HeaderStyle Width="200px" />
                            <ItemStyle Height="50px" Width="310px" HorizontalAlign="Right" />
                            <ItemTemplate>
                                <asp:Label ID="delivery_fees" runat="server" Style="padding-right: 25px" Text='<%#DataBinder.Eval(Container.DataItem, "delivery_fees", "{0:f}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Fields>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                </asp:DetailsView>
                <br />

                <asp:Label ID="lblTxtTotal" runat="server" Text="Total: "></asp:Label>

                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                <asp:SqlDataSource ID="dsDelivery" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT [delivery_fees] FROM [Transaction] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblOrderID" Name="id" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
