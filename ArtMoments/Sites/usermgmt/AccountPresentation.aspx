<%@ Page Title="Account Presentation" Language="C#" MasterPageFile="~/Masters/Artist1.Master" AutoEventWireup="true" CodeBehind="AccountPresentation.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerPresentationEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Account Presentation Design</title>

    <link href="../../Content/css/SignUp.css" rel="stylesheet"/>
    <link href="../../Content/css/AccPresentation.css" rel="stylesheet"/>
    <link href="../../Content/css/AccountCss.css" rel="stylesheet"/>
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row1">
            <div class="col-md-3 ">
                <div class="list-group ">
                    <asp:LinkButton class="list-group-item list-group-item-action" ID="lbMyAcc" runat="server" OnClick="lbMyAcc_Click">My Account</asp:LinkButton>
                    <asp:LinkButton class="list-group-item list-group-item-action " ID="lbSetting" runat="server" OnClick="lbSetting_Click">Setting</asp:LinkButton>
                    <asp:LinkButton class="list-group-item list-group-item-action active" ID="lbPresentation" runat="server" OnClick="lbPresentation_Click">Presentation</asp:LinkButton>
                    <asp:LinkButton class="list-group-item list-group-item-action" ID="lbLogOut" runat="server" OnClick="lbLogOut_Click">Log out</asp:LinkButton>

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
                                    <div class="form-group row">
                                        <label id="lblBibliography" for="website" class="col-4 col-form-label">Bibliography</label>
                                        <div class="col-8">
                                            <asp:TextBox ID="tbBibliography" runat="server" OnTextChanged="tbBibliography_TextChanged" BorderStyle="Solid" CssClass="txtBoxBio"></asp:TextBox>
                                            <br/><br/>
                                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="buttonEditStyle"/>
                                            <br/><br/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label id="lblProfilePic" for="website" class="col-4 col-form-label">Profile Picture</label>
                                        <div class="col-8">
                                            <asp:FileUpload ID="fuProfilePic" runat="server"/>
                                            &nbsp;
                                            <asp:Button ID="btnUpload" class="btn btn-primary" runat="server" OnClick="Upload" Text="Upload" CssClass="buttonEditStyle"/>

                                            <hr/>
                                            <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Image">
                                                        <ItemTemplate>
                                                            <asp:Image ID="imgProfilePic" runat="server" Width="220px" Height="250px"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:Label ID="lblSuccessMsg" runat="server" Text=""></asp:Label>
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
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#dialog").dialog({
                autoOpen: false,
                modal: true,
                height: 600,
                width: 600,
                title: "Zoomed Image"
            });
            $("[id*=gvImages] img").click(function() {
                $('#dialog').html('');
                $('#dialog').append($(this).clone());
                $('#dialog').dialog('open');
            });
        });
    </script>
</asp:Content>