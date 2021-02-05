<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ArtMoments.Sites.artist.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    .auto-style1 {
        width: 500px;

    }
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
        border: 3px dashed #999;
        cursor: move;
        display: block;
        font-size: 0px;
        filter: alpha(opacity=0);
        min-height: 160px;
        min-width: 300px;
        opacity: 1;
        position: absolute;
        right: 0;
        text-align: right;
        top: 0;
        background: transparent;
        z-index: -99999999999999;
    }
    .rowImgTable {
        height: 365px;
    }

    .custom-file-upload {
        border: 1px solid #ccc;
        display: inline-block;
        /*padding: 75px 75px 75px 75px;*/
        width: 300px;
        height: 300px;
        cursor: pointer;
        /*position: absolute;*/
        /*top: 83px;
        left: 50%;*/
        z-index: 9999;
        margin-top: 15px;
        margin-bottom: 15px;
    }
    .custom-file-upload::after {
        display: none;
    }

/*.imageLabel {
    align-self: flex-end;
    margin-top: 6px;
    margin-bottom: 6px;
}*/

    #imgTable {
        position: relative;
        width: 1050px;
        float: left;
        height: 800px;
        display: flex;
    }
    .imgLabel {
        text-align:center;
    
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
					<asp:TextBox ID="artworkName" runat="server" ></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="artworkSize">Artwork Size*:</label> </div>
				<div class="col-10">
					<asp:TextBox ID="artworkSize" placeholder="122cm x 91cm" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="artworkDesc">Artwork Description*:</label> </div>
				<div class="col-10">
					<asp:TextBox id="artworkDesc" mode="multiline" style="height: 200px" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<label for="ArtworkCategory">Artwork Category*</label>
				</div>
				<div class="col-10">
					<asp:DropDownList ID="ArtworkCategory" runat="server">
						<asp:ListItem>Photography</asp:ListItem>
                        <asp:ListItem>Drawings</asp:ListItem>
                        <asp:ListItem>Sculptures</asp:ListItem>
                        <asp:ListItem>Paintings</asp:ListItem>
                        <asp:ListItem>Prints</asp:ListItem>
						</asp:DropDownList>
					</div>
				    
				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkImage">Artwork Image*:</label> 
					</div>
					<div class="col-10">									
						<label for="fileUpload" class="custom-file-upload">
						<asp:FileUpload ID="fileUpload" style="display:none;" accept="image/*" onchange="previewFile()" runat="server" />
						<img class="img1" src="../../Content/187803-200.png" height="300" width="300" alt="image preview...">
						</label>		
					</div>
					
				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkPrice">Artwork Price (RM)*:</label> </div>
					<div class="col-10">
						<input id="artworkPrice" name="artworkPrice" type="text"/>
					</div>

				</div>
				<div class="row">
					<div class="col-2">
						<label for="artworkStock">Artwork Stock*:</label> </div>
					<div class="col-10">
						<input id="artworkStock" name="artworkStock" type="text" onkeypress="return onlyNumberKey(event)"/>
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
        function previewFile() {
            const preview = document.querySelector('img');
            const file = document.querySelector('input[type=file]').files[0];
            const reader = new FileReader();

            reader.addEventListener("load", function () {
                // convert image file to base64 string
                preview.src = reader.result;
            }, false);

            if (file) {
                reader.readAsDataURL(file);
            }
        }
  //  function previewFile() {
		//const preview = document.querySelector("img");
		//const file = document.querySelector('input[type=file]').file[0];
  //      const reader = new FileReader();
		//var index = 0;

		//if (n == 0) {
		//	index = 0;
		//}
		//else if (n == 1)
  //      {
  //          index = 1;
		//}
  //      else if (n == 2) {
  //          index = 2;
		//}
  //      else if (n == 3) {
  //          index = 3;
		//}
  //      else if (n == 4) {
  //          index = 4;
		//}
  //      else {
  //          index = 5;
  //      }
    //    reader.addEventListener("load", function () {
    //        // convert image file to base64 string
    //        preview.src = reader.result;
    //    }, false);

    //    if (file) {
    //        reader.readAsDataURL(file);
    //    }
    //}

    </script> 
</asp:Content>

