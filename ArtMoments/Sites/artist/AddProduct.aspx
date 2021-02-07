﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ArtMoments.Sites.artist.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    .addArtwork input[type=text], input[type=email], input[type=tel], select, textarea{
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-top: 15px;
        margin-bottom: 15px;
        font-size: 16px;
        background-color: #EEEEEE;
        outline: none;
    }

    .addArtwork input[type=text]:focus, input[type=email]:focus, input[type=tel]:focus, select:focus, textarea:focus {
        border: 1px solid #871414;
        background-color: #ddd;
    }

    label {
        padding: 12px 12px 12px 0;
        display: inline-block;
        font-size: 16px;
    }


    input[type=submit] {
        border: none;
        color: white;
        opacity: 0.8;
        font-size: 17px;
        padding: 12px 20px;
        margin-right: 20px;
        border-radius: 4px;
        cursor: pointer;
        float: right;
    }
    input[type=submit]:hover {
        opacity: 1;
    }

    input[type='file'] {
        padding-top:10px;
    }
    .rowImgTable {
        height: 365px;
    }

    /* Clear floats after the columns */
    .addArtwork .row:after {
        content: "";
        display: table;
        clear: both;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="addArtwork">  
		<div class="container">
			<h1>Add a New Artwork</h1>
			<div class="row">
				<div class="col-2">
					<label for="artworkName">Artwork Title*:</label> </div>
				<div class="col-10">
					<asp:TextBox ID="txtArtworkName" runat="server" ></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="artworkSize">Artwork Size*:</label> </div>
				<div class="col-10">
					<asp:TextBox ID="txtArtworkSize" placeholder="122cm x 91cm" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="artworkDesc">Artwork Description*:</label> </div>
				<div class="col-10">
					<asp:TextBox id="txtArtworkDesc" TextMode="MultiLine" style="height: 200px" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="ArtworkCategory">Artwork Category*</label>
				</div>
				<div class="col-10">
					<asp:DropDownList ID="ddlArtworkCategory" runat="server" DataSourceID="test" DataTextField="category_name" DataValueField="ID">
						</asp:DropDownList>
                    <asp:SqlDataSource ID ="test" runat="server" ConnectionString="Data Source=DESKTOP-RT2Q9PA\SQLEXPRESS;Initial Catalog=ArtMomentsDb;User ID=sa;Password=1234"
                        SelectCommand="Select ID, category_name from product_category"></asp:SqlDataSource>
					</div>
				    
				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkImage">Artwork Image*:</label> 
					</div>
					<div class="col-10">	
                        <asp:fileupload id="fileUpload" accept="image/*" runat="server" />	
					</div>
					
				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkPrice">Artwork Price (RM)*:</label> </div>
					<div class="col-10">
                        <asp:TextBox ID="txtArtworkPrice" runat="server"></asp:TextBox>
					</div>

				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkStock">Artwork Stock*:</label> </div>
					<div class="col-10">
                        <asp:TextBox ID="txtArtworkStock" onkeypress="return onlyNumberKey(event)" runat="server"></asp:TextBox>
					</div>
				</div>
				<div class="row">		
					<asp:Button ID="submitAddProdBtn" class="btn btn-primary" runat="server" Text="Save & Create" OnClick="saveProdBtn_Click"/>
					<asp:Button ID="resetAddProdBtn" class="btn btn-primary" runat="server" Text="Reset" OnClick="resetProdBtn_Click"/>
				</div>
            
            </div>
        </div>
	<script> 
        function onlyNumberKey(evt) {

            // Only ASCII charactar in that range allowed 
            var ASCIICode = (evt.which) ? evt.which : evt.keyCode

            if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
                return false;
            return true;
        }
        

    </script> 
</asp:Content>

