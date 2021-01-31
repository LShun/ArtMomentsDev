<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ArtMoments.Sites.artist.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="addArtwork.css" rel="stylesheet" type="text/css"/>
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
							<table id="imgTable">
								<tr class="rowImgTable">
									<td class="auto-style1"><label for="fileUpload" class="custom-file-upload">
										<asp:FileUpload ID="fileUpload" style="display:none;" accept="image/*" onchange="previewFile()" runat="server" />
										<img class="img1" src="187803-200.png" height="300" width="300" alt="image preview...">
										</label>
									</td>
									<td class="auto-style1"><label for="fileupload1" class="custom-file-upload">
										<asp:fileupload id="fileupload1" style="display:none;" accept="image/*" onchange="previewfile()" runat="server" />
										<img class="img2" src="187803-200.png" height="300" width="300" alt="image preview..."/>
										</label>

									</td>
									<td class="auto-style1"><label for="fileupload2" class="custom-file-upload">
										<asp:fileupload id="fileupload2" style="display:none;" accept="image/*" onchange="previewfile()" runat="server" />
										<img class="img3" src="187803-200.png" height="300" width="300" alt="image preview..."/>
										</label>

									</td>
								</tr>
								<tr>
									<td class="imgLabel">Image 1</td>
									<td class="imgLabel">Image 2</td>
									<td class="imgLabel">Image 3</td>
								</tr>
								<tr class="rowImgTable">
									<td class="auto-style1"><label for="fileUpload3" class="custom-file-upload">
										<asp:FileUpload ID="fileUpload3" style="display:none;" accept="image/*" onchange="previewFile()" runat="server" />
										<img class="img4" src="187803-200.png" height="300" width="300" alt="image preview..."/>
										</label>
									</td>
									<td class="auto-style1"><label for="fileUpload4" class="custom-file-upload">
										<asp:FileUpload ID="fileUpload4" style="display:none;" accept="image/*" onchange="previewFile()" runat="server" />
										<img class="img5" src="187803-200.png" height="300" width="300" alt="image preview..."/>
										</label>

									</td>
									<td class="auto-style1"><label for="fileUpload5" class="custom-file-upload">
										<asp:FileUpload ID="fileUpload5" style="display:none;" accept="image/*" onchange="previewFile()" runat="server" />
										<img class="img6" src="187803-200.png" height="300" width="300" alt="image preview..."/>
										</label>

									</td>
								</tr>
								<tr>
									<td class="imgLabel">Image 4</td>
									<td class="imgLabel">Image 5</td>
									<td class="imgLabel">Image 6</td>
								</tr>
							</table>
						</div>
						<%--<div class="imageclass">
							

							<div class="imagelabel">image 1</div>
						
						</div>  --%>
							
					<%--<div class="imagelabel">
						
					</div>--%>
						<%--<div class="imageIcon">
							<label for="imgInp" class="custom-file-upload">  <i class="fas fa-camera"></i></label>
							<input type='file' id="imgInp2" style="display:none;"/>
							<label for="artImage2">Image 2</label>
						</div>  
						<div class="imageIcon">
							<label for="imgInp" class="custom-file-upload">  <i class="fas fa-camera"></i></label>
							<input type='file' id="imgInp3" style="display:none;"/>
							<label for="artImage3">Image 3</label>
						</div>  --%>
							<%--<i class="fas fa-camera" style="font-size:24px;"></i>
							<input type="file" id="img" name="img" accept="image/*" class="imageUpload"/>--%>
						<%--<div class="imageIcon">
							<i class="fas fa-camera" style="font-size:24px;"></i>
						</div>
						<div class="imageIcon">
							<i class="fas fa-camera" style="font-size:24px;"></i>
						</div>--%>
					<!--</form>-->
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

