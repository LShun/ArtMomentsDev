<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderArtExtra.aspx.cs" Inherits="ArtMoments.Sites.general.OrderArtExtra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        div#authorpicDivision {
            float: right;
        }

        div#authorInfoDivision {
            margin-top: 20px;
        }

        img#ContentPlaceHolder1_authorImage {
        max-width: 200px;
        max-height: 200px;
        object-fit: cover;
        border: 2px solid black;
        }

        div#artworkNameDivision {
            margin-top: 20px;
        }

        .artwork-image-division img {
            max-width: 400px;
            max-height: 400px;
            object-fit: cover;
            cursor: pointer;
            border: 2px solid black;
            text-align: center;
            align-items: center;
        }

        div#wishlistOff,  div#wishlistOn{
            position: absolute;
            top: -20px;
            right: 0;
        } 

        input#ContentPlaceHolder1_btnwishlistOff:hover {
            -webkit-text-fill-color:red;
        }

        .heading {
            margin-top: 40px;
            margin-bottom: 30px;
            background-color: paleturquoise;
            color: white;
            text-shadow: 1px 1px black;
        }

        .row.sizeCategoryAuthor, .row.descriptionDevision, .row.sizeCategoryAuthor {
            font-size: 13px;
            color: darkgray;
            padding-top: 8px;
        }

        .row.sizeCategoryAuthorDB, .row.lbldescriptionDivision {
           margin-top: -5px;
            font-size: 18px;
        }

        input#ContentPlaceHolder1_txtboxQty {
            text-align: center;
        }

        div#btnBuyNowDivision {
            margin-top: 20px;
        }

        .row.justify-content-center.align-self-center {
            margin-bottom: 30px;
            background-color: gainsboro;
            text-shadow: 1px 1px black;
            color: white;
            margin-top: 30px;
        }
        
        div#authorName {
            font-size: 20px;
        }

       .col-xl-6, .col-sm-12, .col-md-12, col-12,col-4, col-5, col-7, col-6{
            position:relative;
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
        }

       div{
           display:block;
       }

        .btn-primary{
            color:#fff;
            background-color:#007bff;
            border-color:#007bff
        }

        .btn-block{
            display:block;
            width:100%;
        }

        .float-right{
            float:right!important;
        }

        .row {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
        }

        .rounded {
            border-radius: .25rem!important;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }

        .justify-content-center {
            justify-content: center!important;
        }

        .align-content-sm-center {
            align-content: center!important;
            min-width: 576px;
        }

        .col-4{-ms-flex:0 0 33.333333%;flex:0 0 33.333333%;max-width:33.333333%}

        .col-xl-6{-ms-flex:0 0 50%;flex:0 0 50%;max-width:50%}

        .col-sm-12{-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}

        .col-md-12{-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}

        .col-12{-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}

        .col-5{-ms-flex:0 0 41.666667%;flex:0 0 41.666667%;max-width:41.666667%}

        .col-6{-ms-flex:0 0 50%;flex:0 0 50%;max-width:50%}

        .col-7{-ms-flex:0 0 58.333333%;flex:0 0 58.333333%;max-width:58.333333%}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <header>
        <div class="row justify-content-center heading">
            <h1 class="orderHistoryHeader">Order History</h1>
        </div>
    </header>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="prod-id" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="prod-id" HeaderText="prod-id" InsertVisible="False" ReadOnly="True" SortExpression="prod-id" />
            <asp:BoundField DataField="prod-name" HeaderText="prod-name" SortExpression="prod-name" />
            <asp:BoundField DataField="prod-size" HeaderText="prod-size" SortExpression="prod-size" />
            <asp:BoundField DataField="prod-descrip" HeaderText="prod-descrip" SortExpression="prod-descrip" />
            <asp:BoundField DataField="prod-price" HeaderText="prod-price" SortExpression="prod-price" />
            <asp:BoundField DataField="prod-stock" HeaderText="prod-stock" SortExpression="prod-stock" />
            <asp:BoundField DataField="prod-sales" HeaderText="prod-sales" SortExpression="prod-sales" />
            <asp:BoundField DataField="category-name" HeaderText="category-name" SortExpression="category-name" />
            <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
            <asp:BoundField DataField="bibliography" HeaderText="bibliography" SortExpression="bibliography" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT P.id AS [prod-id], P.prod_name AS [prod-name], P.prod_size AS [prod-size], P.prod_description AS [prod-descrip], P.prod_image AS [prod-image], P.prod_price AS [prod-price], P.prod_stock AS [prod-stock], P.prod_sales AS [prod-sales], C.category_name AS [category-name], U.user_name AS author, U.bibliography, U.profile_pic AS author_profilePic FROM Product AS P LEFT OUTER JOIN Product_Category AS C ON C.id = P.category_id LEFT OUTER JOIN [User] AS U ON U.id = P.user_id WHERE (P.id LIKE 8)">
    </asp:SqlDataSource>
</asp:Content>
