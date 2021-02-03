<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ArtMoments.Sites.artist.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/css/addArtwork.css" rel="stylesheet" />
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 500px;
			
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="addArtwork">
            <h1>Add a New Artwork</h1>
				<div class="container">
					<div class="row">
						<div class="col-25">
							<label for="artworkName">Artwork Title*:</label> </div>
						<div class="col-75">
							<asp:TextBox ID="artworkName" runat="server" required="required"></asp:TextBox>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="artworkSize">Artwork Size*:</label> </div>
						<div class="col-75">
							<asp:TextBox ID="artworkSize" placeholder="122cm x 91cm" required="required" runat="server"></asp:TextBox>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="artworkDesc">Artwork Description*:</label> </div>
						<div class="col-75">
							<asp:TextBox id="artworkDesc" mode="multiline" style="height: 200px" runat="server"></asp:TextBox>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="ArtworkCategory">Artwork Category*</label>
						</div>
						<div class="col-75">
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
						<div class="col-25">
							<label for="artworkImage">Artwork Image*:</label> 
						</div>
						<div class="col-75">						
								
									<label for="fileUpload" class="custom-file-upload">
										<asp:FileUpload ID="fileUpload" style="display:none;" accept="image/*" onchange="previewFile()" runat="server" />
										<img class="img1" src="../../Content/187803-200.png" height="300" width="300" alt="image preview...">
										</label>
							
								
						
						</div>
					
					</div>
					<div class="row">
						<div class="col-25">
							<label for="artworkPrice">Artwork Price (RM)*:</label> </div>
						<div class="col-75">
							<input id="artworkPrice" name="artworkPrice" required="required" type="text"/>
						</div>

					</div>
					<div class="row">
						<div class="col-25">
							<label for="artworkStock">Artwork Stock*:</label> </div>
						<div class="col-75">
							<input id="artworkStock" name="artworkStock" required="required" type="text" onkeypress="return onlyNumberKey(event)"/>
						</div>
					</div>
					<div class="row">
					
						<input type="button" value="Cancel"/>
						<input type="submit" value="Save & Create"/> 
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

