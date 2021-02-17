﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerPresentation.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerPresentationEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <style>
        .txtBoxBio{
            width:80%;
            height:60%;
        }
    </style>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	<div class="row">
        <div class="col-md-3 ">
		        <div class="list-group ">
                    <a href="BuyerAccount.aspx"  class="list-group-item list-group-item-action">My Account</a>
                    <a href="BuyerSettingExtra.aspx" class="list-group-item list-group-item-action">Setting</a>
                    <a href="BuyerPresentation.aspx"  class="list-group-item list-group-item-action active">Presentation</a>   
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
                                <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">Bibliography</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="tbBibliography" runat="server" OnTextChanged="tbBibliography_TextChanged" BorderStyle="Solid" CssClass="txtBoxBio"></asp:TextBox>
                                  <br /><br />
                                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="buttonEditStyle"/>
                                    <br /><br />
                                </div>
                              </div>
                                <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">Profile Picture</label> 
                                <div class="col-8">
                                    <asp:FileUpload ID="FileUpload1" runat="server"/>
                                    &nbsp;
                                    <asp:Button ID="btnUpload" class="btn btn-primary" runat="server" OnClick="Upload" Text="Upload" CssClass="buttonEditStyle"/>
                                    
                                    <hr />
                                    <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound">
                                        <Columns>            
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <div id="dialog" style="display: none">
                                    </div>
                                    </div>
                                </div>
                            </div>
		                </div>
		            </div>
		            
		        </div>
		    </div>
        </div>
    </div>
</div>













    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#dialog").dialog({
                autoOpen: false,
                modal: true,
                height: 600,
                width: 600,
                title: "Zoomed Image"
            });
            $("[id*=gvImages] img").click(function () {
                $('#dialog').html('');
                $('#dialog').append($(this).clone());
                $('#dialog').dialog('open');
            });
        });
    </script>
</asp:Content>
