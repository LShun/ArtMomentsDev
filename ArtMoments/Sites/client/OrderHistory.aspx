<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="ArtMoments.Sites.client.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/OrderHistoryCss.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ="history-content-left" style="width:5%;height:500px;float:left">
        </div>

        <div id="history-content-center" style="width:90%;height:500px;float:left">
            <div id="history-title" style="float:none; width: 100%; display:inline-block">
                <section id="history-art-title" class="extra-info">
                    <h1>Order History</h1>
                </section>
            </div>

            <section id="history-art-box" style="float:none; width:100%; display:inline-block">
                <ul id="history-middle-box">
                    <li>
                        <article id="orderNum-n-art" style="width: 38%; float:left; height:400px">
                               <h1 id ="orderNum">
                                   #OrderNum
                               </h1>

                               <section id ="artWork-pic">
                                   <img class="history-art-pic" src="../../Content/sea.jpg" />
                               </section>
                           </article>

                        <aside id="detail-history-info" style="width:100%; height:400px">
                            <br     />
                                <article id="history-delivery-status">
                                        <span id="delivery-status-text">&nbsp;&nbsp;Delivered&nbsp;&nbsp;</span>
                                </article>

                                <article id="history-name-year">
                                    <h1 id="history-art-name">ArtName</h1>
                                    <span id="history-art-year">YEAR</span>
                                </article>

                                <article id="history-size-material">
                                    <article id="history-art-size" class="history-art-info">
                                        <span class="artDetail">Size</span>
                                        <span class="artDetail-text">1800" x 1900"</span>
                                        <br />
                                    </article>

                                    <article id="history-art-material" class="history-art-info">
                                        <span class="artDetail">Material</span>
                                        <span class="artDetail-text">Canvas, abc, cde, efg</span>
                                        <br />
                                    </article>
                                </article>
                    
                                <article id="history-art-author" class="history-art-info">
                                    <span class="artDetail">Author</span>
                                    <span class="artDetail-text">Manolisa</span>
                                    <br />
                                </article>

                                <article id="view-moreNbtn" class="history-art-info">
                                        <span id="purchase-date">Purchased on: 18 Jan 2020</span>

                                        <button type="button" id="btn buy-again" style="font-size: 30px">&nbsp; BUY AGAIN! &nbsp;</button>
                                        <br />
                                        <br />
                                </article>

                            
                        </aside>
                    </li>

                    <li>

                    </li>
                </ul>  
            </section>
        </div>

        <div id ="history-content-right" style="width:5%;height:500px;float:left">
        </div>
</asp:Content>
