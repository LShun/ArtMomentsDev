<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerAccount.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title></title>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style2 {
            height: 6px;
            width: 320px;
        }
        .auto-style3{
            margin-left:170px; 
            margin-top: 30px; 
            width: 47%;
        }
        .auto-style4 {
            height: 27px;
            width: 100%;
        }
        .auto-style5 {
            height: 27px;
            width: 320px;
        }
        .auto-style6 {
            padding:10px; 
            width:10%; 
            background-color:antiquewhite;
        }
        .auto-style7 {
            width:130px;
            height: 40px;
        }
        .auto-style8 {
            width:130px;
            height: 40px;
            background-color: #FFFFFF; 
            border-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="BuyerAccount.aspx"  class="list-group-item list-group-item-action active">My Account</a>
              <a href="BuyerSetting.aspx" class="list-group-item list-group-item-action">Setting</a>
              <a href="BuyerPresentation.aspx"  class="list-group-item list-group-item-action">Presentation</a>              
              
            </div> 
		</div>
        <div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <div>
                              <table>
                                    <tr>
                                        <td class="auto-style5">
                                        </td>
                                        <td class="auto-style4" style="padding:0px">
                                            <div style="margin-top: 0px">
                                                <table style="margin:10px; width:60%">
                                                    <tr>
                                                        <td class="auto-style6">
                                                            <asp:Label runat="server" Text="Followed Artist"></asp:Label>
                                                            <br/>
                                                            <asp:Label runat="server" Text="Start following your favourite artist"></asp:Label>
                                                        </td>
                                                        <td style="width:1%"></td>
                                                        <td class="auto-style6">
                                                            <asp:Label runat="server" Text="My favourite"></asp:Label>
                                                            <br/>
                                                            <asp:Label runat="server" Text="Start collecting art"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>       
        </div>
    </div>
</asp:Content>


