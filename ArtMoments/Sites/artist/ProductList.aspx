<%@ Page Title="Product List" Language="C#" MasterPageFile="~/Masters/Artist1.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ArtMoments.Sites.artist.ProductList" %>

<%@ Register TagPrefix="ArtworkHistory" TagName="ArtHistory" Src="~/Content/user-controls/ArtworkHistory.ascx"%>

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
        .productListTable tr:nth-of-type(odd){
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
            border: 1px solid #3AC0F2;   /* Add a blue border */
            margin:5px 5px 5px 5px; /* Add some space outside the box */
        }
        #ContentPlaceHolder1_txtSearch{
        background-image: url('../../Content/search--v2.png'); /* Add a search icon to input */
        background-position: 10px 10px; /* Position the search icon */
        background-repeat: no-repeat; /* Do not repeat the icon image */
        background-size: 25px 25px; /*adjust background image size*/
        width: 50%; 
        font-size: 16px; /* Increase font-size */
        padding: 12px 20px 12px 40px; /* Add some padding */
        border: 1px solid #ddd; /* Add a grey border */
        margin-bottom: 12px; /* Add some space below the input */
        }

        div.artworkListHeader{
            margin-top:10px;
            margin-bottom:10px;
            margin-right:0px;
            display: flex;           
            flex-wrap: wrap;           
            margin-left: -15px;
            justify-content: space-between!important;
        }
        .productListTable{
            margin-bottom:10px;
            border: 1px solid #dee2e6;
            display: block;
            width: 100%;
            overflow-x: auto;
        }
        #ContentPlaceHolder1_lblArtworkName{
            font-weight: bold;
        }
        *, ::after, ::before {
            box-sizing: border-box;
        }
        .button:not(:disabled):not(.disabled) {
            cursor: pointer;
        }
        .button:hover{
            color: #212529;
        }
        .btn-artworkList {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
            display: inline-block;
            font-weight: 400;
            text-align: center;
            vertical-align: middle;
            user-select: none;
            border: 1px solid transparent;
            padding: .375rem .75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: .25rem;
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            float:right;
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
        .col, .col-lg-10, .col-md-8, .col-sm-8{
            position: relative;
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
        }
        a {           
            text-decoration: none;
            background-color: transparent;
        }
        
        /* latest pictures settings (in the detailsview) */
        .latest {
            height: 14rem;
            margin: 0 0;
            max-width: 18rem;
            width: auto
        }

        .dvArtwork {
            display:flex;
            justify-content:center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="artworkListHeader">
            <div class="col-lg-10 col-md-9 col-sm-8">
                <h1>Artwork List</h1>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-4">
                <asp:Panel ID="panel" runat="server" DefaultButton="addNetworkBtn">
                    <asp:Button ID="addNetworkBtn" class="button btn-artworkList" runat="server" Text="Add a New Artwork" Height="43px" OnClick="addProdBtn_Click" UseSubmitBehavior="false"/>
                </asp:Panel>
                
            </div>
         </div>    

         <%--search textbox--%>   

        <asp:TextBox ID="txtSearch" placeholder="Search for Product names.." autocomplete="off" runat="server"></asp:TextBox>


       <%--Product List--%>
        <div class="productListTable"> 
            <asp:GridView ID="productList" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True"  PageSize="5" DataSourceID="dsProdList" OnRowCommand="productList_RowCommand">
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last"/>       
            <pagerstyle horizontalalign="Left" CssClass="pagination"/>
                <Columns>
                <asp:BoundField DataField="ID" HeaderText="Product ID" SortExpression="ID" HeaderStyle-ForeColor="White" >
                    <ItemStyle Width="80" HorizontalAlign="Center" /> 
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:boundfield>

                <asp:TemplateField HeaderText="Product Name">
                    <ItemStyle Width="550" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Image ID="prodImage" runat="server" width="200px" Height="200px" ImageUrl='<%#"data:image/jpg;base64," + Convert.ToBase64String((byte[]) Eval("Image")) %>'/>
                        <br />
                        <asp:Label ID="prodName" runat="server" Text='<%# Eval("Name") %>' style="font-weight:bold"></asp:Label> 
                        <br />
                        <asp:Label ID="prodDesc" runat="server" Text='<%# Eval("Description") %>'></asp:Label> 
                        <br />
                        <asp:Label ID="prodSize" runat="server" Text='<%# Eval("Size") %>'></asp:Label> 
                    </ItemTemplate>
                </asp:TemplateField> 

                <asp:BoundField DataField="CategoryName" HeaderText="Product Category" SortExpression="CategoryName" HeaderStyle-ForeColor="White" >
                    <ItemStyle Width="150" HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:boundfield>

                <asp:BoundField DataField="Price" HeaderText="Price (RM)" DataFormatString="{0:n}" SortExpression="Price" HeaderStyle-ForeColor="White" >
                    <ItemStyle Width="140" HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:boundfield>

                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" HeaderStyle-ForeColor="White" >
                    <ItemStyle Width="100" HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" /> 
                </asp:boundfield>

                <asp:BoundField DataField="Sales" HeaderText="Sales" SortExpression="Sales" HeaderStyle-ForeColor="White" >
                    <ItemStyle Width="100" HorizontalAlign="Center" /> 
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:boundfield>

                <asp:TemplateField HeaderText="Action">
                    <ItemStyle Width="70" HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Button ID="editBtn1" class="button btn-artworkList" runat="server" Text="Edit" CausesValidation="False" CommandName="View" Width="67px" UseSubmitBehavior="false"/>
                    </ItemTemplate>
                </asp:TemplateField> 
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsProdList" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT P.id as [ID], P.prod_name as [Name], P.prod_size [Size], P.prod_description as [Description], C.category_name as [CategoryName], P.prod_image as [Image], P.prod_price as [Price] , P.prod_stock as [Stock], P.prod_sales as [Sales] from Product P , Product_Category C, [User] U WHERE U.id = P.user_id AND U.user_name = @user_name AND P.category_id = C.id AND P.prod_name LIKE CONCAT('%', @Name, '%')" CancelSelectOnNullParameter="False">
                <SelectParameters>
                    <asp:SessionParameter Name="user_name" SessionField="UserName"/>
                    <asp:ControlParameter ControlID="txtSearch" Name="Name" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <%-- Inspiration products --%>
        <div class="dvArtwork">
            <ArtworkHistory:ArtHistory ID="ahSellerLatestArt" runat="server"/>
        </div>
        
        
    </div>
   
</asp:Content>
