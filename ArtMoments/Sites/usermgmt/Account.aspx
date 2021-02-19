<%@ Page Title="Account Management" Language="C#" MasterPageFile="~/Masters/Artist1.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Account Management Design</title>
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <link href="../../Content/css/BuyerAcc.css" rel="stylesheet" />
    <link href="../../Content/css/AccountCss.css" rel="stylesheet" />
	<style>
	 .row1 {
    position: relative;
    width: 100%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    margin-right: -15px;
    margin-left: 15px;
}
	 .row {
    position: relative;
    width: 100%;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    /* flex-wrap: wrap; */
    margin-right: -15px;
    margin-left: -900px;
    margin-top: 200px;
}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
	<div class="row1">
		<div class="col-md-3 ">
		     <div class="list-group ">
				  <asp:LinkButton class="list-group-item list-group-item-action active" ID="lbMyAcc" runat="server" OnClick="lbMyAcc_Click" >My Account</asp:LinkButton>
                  <asp:LinkButton class="list-group-item list-group-item-action" ID="lbSetting" runat="server" OnClick="lbSetting_Click">Setting</asp:LinkButton>
                  <asp:LinkButton class="list-group-item list-group-item-action" ID="lbPresentation" runat="server" OnClick="lbPresentation_Click" >Presentation</asp:LinkButton>
                  <asp:LinkButton class="list-group-item list-group-item-action" ID="lbLogOut" runat="server" OnClick="lbLogOut_Click" >Log out</asp:LinkButton>
               
            </div> 
		</div>
        <div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row1">
		                <div class="col-md-12">
		                    <hr>
		                </div>
		            </div>
		            <div class="row1">
		                <div class="col-md-12">
		                    <div>
                              <table>
                                    <tr>
                                        <td class="auto-style5">
                                        </td>
                                        <td class="auto-style4" style="padding:0px">
                                            <div style="margin-top: 0px">
                                                <table style="width:100%">
                                                    <tr>
                                                        
                                                        <td class="auto-style6">
                                                            <asp:Panel ID="pblShowForBuyer2" runat="server">
																<asp:Label ID="lblText3" runat="server" Text=""></asp:Label>
																<br/>
                                                                <asp:LinkButton ID="lbWishList" runat="server" OnClick="lbWishList_Click"></asp:LinkButton>
															</asp:Panel>
                                                        </td>

														<td style="width:1%"></td>
														<td class="auto-style6">
                                                            <asp:Panel ID="pnlShowForSeller" runat="server">
																<asp:Label ID="lblText5" runat="server" Text="Upload you arts"></asp:Label>
																	<br/>
																		<asp:LinkButton ID="lbUpload" runat="server" OnClick="lbUpload_Click">Upload now</asp:LinkButton>
																</asp:Panel>                                                            
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
						<button id="btnFlipcard1"></button><br><br><br>
						<p>The only thing I know is that I paint because I need to. </p>
					</div>
				</div>
			</div>
			<div class="flip-card col-25">
				<div class="flip-card-inner">
					<div class="flip-card-front">
						<img alt="Avatar" src="../../Content/panda.jpg" style="width: 200px; height: 250px;">
					</div>
					<div class="flip-card-back">
						<button id="btnFlipcard2"></button><br><br><br>
						<p>Painting is self-discovery. Every good artist paints what he is. </p>
					</div>
				</div>
			</div>
			<div class="flip-card col-25">
				<div class="flip-card-inner">
					<div class="flip-card-front">
						<img alt="Avatar" src="../../Content/colorful-street.jpg" style="width: 200px; height: 250px;">
					</div>
					<div class="flip-card-back">
						<button id="btnFlipcard3"></button><br><br><br>
						<p>To draw you must close your eyes and sing. 
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
						<button id="btnFlipcard4"></button><br><br><br>
						<p>The best reason to paint is that there is no reason to paint. </p>
					</div>
				</div>
			</div>
		</div>
   </div>
</div>
</asp:Content>


