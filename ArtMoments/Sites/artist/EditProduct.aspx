<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Artist1.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="ArtMoments.Sites.artist.EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
     .h1, h1 {
        font-size: 2.5rem;
    }
    .editArtwork input[type=text], input[type=email], input[type=tel], select, textarea{
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

    .editArtwork input[type=text]:focus, input[type=email]:focus, input[type=tel]:focus, select:focus, textarea:focus {
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
        opacity: 0.8;   /*the opacity of button is 0.8*/
        font-size: 17px;
        padding: 12px 20px;   /*top and bottom are 12px, right and left are 20px*/
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
    .editArtwork .row:after {
        content: "";
        display: table;
        clear: both;
    }
    .col-2{ 
        position:relative;         /*relative position*/
        width:100%;
        padding-right:15px;
        padding-left:15px;
        -ms-flex:0 0 16.666667%;
        flex:0 0 16.666667%;
        max-width:16.666667%
    }
    .col-4{
        position:relative;        /*relative position*/
        width:100%;
        padding-right:15px;
        padding-left:15px;
        -ms-flex:0 0 33.333333%;
        flex:0 0 33.333333%;
        max-width:33.333333%;
    }
    .col-10{
        position:relative;        /*relative position*/
        width:100%;
        padding-right:15px;
        padding-left:15px;
        -ms-flex:0 0 83.333333%;
        flex:0 0 83.333333%;
        max-width:83.333333%
    }
    .row{
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin-right: -15px;
        margin-left: -15px;
    }
    .button:not(:disabled):not(.disabled) {
        cursor: pointer;
    }
    .button:hover{
        color: #212529;
    }
    .btn-artwork {
        color: #fff;
        background-color: #007bff;  /*blue color*/
        border-color: #007bff;     /*blue color*/
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
    }
    .artworkWidth{
       padding-right:0;
    }
    *, ::after, ::before {
    box-sizing: border-box;
    }

    .container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="editArtwork">  
		<div class="container">
			<h1>Edit Artwork</h1>
			<div class="row">
				<div class="col-2">
					<label for="artworkName">Artwork Title*:</label> </div>
				<div class="col-10">
					<asp:TextBox ID="txtArtworkName" runat="server" MaxLength="50" autocomplete="off"></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="artworkHeight">Artwork Height (cm)*:</label> </div>
				<div class="col-4">
					<asp:TextBox ID="txtArtworkHeight" MaxLength="4" onkeypress="return onlyNumberKey(event)" runat="server" autocomplete="off"></asp:TextBox>
                </div>
                <div class="col-2">
					<label for="artworkWidth" class="artworkWidth">Artwork Width (cm)*:</label> </div>
                <div class="col-4">
                    <asp:TextBox ID="txtArtworkWidth" MaxLength="4" onkeypress="return onlyNumberKey(event)" runat="server" autocomplete="off"></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="artworkDesc">Artwork Description*:</label> </div>
				<div class="col-10">
					<asp:TextBox id="txtArtworkDesc" TextMode="MultiLine" style="height: 200px" runat="server" autocomplete="off"></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="ArtworkCategory">Artwork Category*</label>
				</div>
				<div class="col-10">
					<asp:DropDownList ID="ddlArtworkCategory" runat="server" DataSourceID="test" DataTextField="category_name" DataValueField="ID">
						</asp:DropDownList>
                    <asp:SqlDataSource ID ="test" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ArtMomentsDb;Integrated Security = True"
                        SelectCommand="Select ID, category_name from product_category"></asp:SqlDataSource>
					</div>
				    
				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkImage">Artwork Image*:</label> 
					</div>
					<div class="col-10">	
                        <asp:fileupload id="fuProdImage" accept="image/*" runat="server" />	
					</div>
					
				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkPrice">Artwork Price (RM)*:</label> </div>
					<div class="col-10">
                        <asp:TextBox ID="txtArtworkPrice" MaxLength="20" runat="server" autocomplete="off"></asp:TextBox>
					</div>

				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkStock">Artwork Stock*:</label> </div>
					<div class="col-10">
                        <asp:TextBox ID="txtArtworkStock" MaxLength="20" autocomplete="off" onkeypress="return onlyNumberKey(event)" runat="server"></asp:TextBox>
					</div>
				</div>
             <div class="row">
                <asp:Label ID="lblErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>

            </div>
				<div class="row">		
					<asp:Button ID="submitAddProdBtn" class="btn btn-primary" runat="server" Text="Save & Create" OnClientClick="return validate()" OnClick="saveProdBtn_Click"/>
					<asp:Button ID="cancelAddProdBtn" class="btn btn-primary" runat="server" Text="Cancel" OnClick="cancelProdBtn_Click"/>
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

        //alert message when the form is not completed
        function alertMsg() {
            alert("The form is not completed!!!")

        }

    </script> 
</asp:Content>
