<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Client1.Master" AutoEventWireup="true" CodeBehind="clientReceipt.aspx.cs" Inherits="ArtMoments.Sites.client.clientReceipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .heading {
            margin-top: 40px;
            margin-bottom: 30px;
            color: black;
            padding-left: 17rem;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header>
        <div class="row justify-content-center heading">
            <h1 class="clientReceiptHeader">Your Receipt<asp:DetailsView ID="TransactionIDDetailView" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="50px" Width="574px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="Transaction ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                </asp:DetailsView>

                <asp:Repeater ID="TransactionProductRepeater" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <div class="receiptDiv">
                            <table class="receiptTable">
                                <tr>
                                    <td id="receiptProdName">
                                        <asp:LinkButton ID="lbtnProdName" runat="server" class="rightCol"><%#Eval("product_id") %></asp:LinkButton><asp:TextBox ID="txtProdId" runat="server" Text='<%# Eval("product_id").ToString() %>' Visible="false" Enabled="false" CssClass="txtProdId"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT [id], [product_id], [quantity], [delivery_id] FROM [CartItems] WHERE ([user_id] = @user_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TransactionIDDetailView" Name="user_id" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [id] FROM [CartItems] WHERE ([user_id] = @user_id)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="user_id" SessionField="UserId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </h1>
        </div>
    </header>



</asp:Content>
