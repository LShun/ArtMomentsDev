<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerAccount.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title></title>
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <link href="../../Content/css/BuyerAcc.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="BuyerAccount.aspx"  class="list-group-item list-group-item-action active">My Account</a>
              <a href="BuyerSettingExtra.aspx" class="list-group-item list-group-item-action">Setting</a>
              <a href="BuyerPresentation.aspx"  class="list-group-item list-group-item-action">Presentation</a>  
			  <a href="HomePage.aspx"  class="list-group-item list-group-item-action">Log out</a>               
              
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
        <br /><br />
        <div class="row">
			<div class="flip-card col-25">
				<div class="flip-card-inner">
					<div class="flip-card-front">
						<img alt="Avatar" src="../../Content/sea.jpg" style="width: 200px; height: 250px;">
					</div>
					<div class="flip-card-back">
						<button></button><br><br><br>
						<p>Best Seller --&gt; <br>Check out this picture ! ! </p>
					</div>
				</div>
			</div>
			<div class="flip-card col-25">
				<div class="flip-card-inner">
					<div class="flip-card-front">
						<img alt="Avatar" src="../../Content/panda.jpg" style="width: 200px; height: 250px;">
					</div>
					<div class="flip-card-back">
						<button></button><br><br><br>
						<p>Is this a panda or a tree??</p>
					</div>
				</div>
			</div>
			<div class="flip-card col-25">
				<div class="flip-card-inner">
					<div class="flip-card-front">
						<img alt="Avatar" src="../../Content/colorful-street.jpg" style="width: 200px; height: 250px;">
					</div>
					<div class="flip-card-back">
						<button></button><br><br><br>
						<p>Watch these beautiful and colorful leaves...imagine having this tree in you garden! 
						</p>
					</div>
				</div>
			</div>
			<div class="flip-card col-25">
				<div class="flip-card-inner">
					<div class="flip-card-front">
						<img alt="Avatar" src="../../Content/Black%20Deer2.png" style="width: 200px; height: 250px;">
					</div>
					<div class="flip-card-back">
						<button></button><br><br><br>
						<p>Wonderful art offers up for grab...You MUST NOT miss it ! 
						!</p>
					</div>
				</div>
			</div>
		</div>

        </div>
    </div>
</asp:Content>


