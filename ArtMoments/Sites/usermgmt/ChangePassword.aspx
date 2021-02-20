<%@ Page Title="Change password" Language="C#" MasterPageFile="~/Masters/Artist1.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Change password</title>
    <link href="../../Content/css/AccountCss.css" rel="stylesheet"/>
    <link href="../../Content/css/SignUp.css" rel="stylesheet"/>
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 0px;
        }

        .row {
            position: relative;
            width: 100%;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: unset;
            margin-right: -15px;
            margin-left: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-3 ">
                <div class="list-group ">
                    <asp:LinkButton class="list-group-item list-group-item-action" ID="lbMyAcc" runat="server" OnClick="lbMyAcc_Click">My Account</asp:LinkButton>
                    <asp:LinkButton class="list-group-item list-group-item-action active" ID="lbSetting" runat="server" OnClick="lbSetting_Click">Setting</asp:LinkButton>
                    <asp:LinkButton class="list-group-item list-group-item-action" ID="lbPresentation" runat="server" OnClick="lbPresentation_Click">Presentation</asp:LinkButton>
                    <asp:LinkButton class="list-group-item list-group-item-action" ID="lbLogOut" runat="server" OnClick="lbLogOut_Click">Log out</asp:LinkButton>

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
                                        <label for="currentPw" class="col-4 col-form-label">Current password: </label>
                                        <div class="col-8">
                                            <asp:TextBox ID="tbPassword" runat="server" OnTextChanged="TextBox1_TextChanged" TextMode="Password"></asp:TextBox>
                                            <asp:Label Text="*" runat="server" ForeColor="Red"/>
                                            <asp:RegularExpressionValidator ID="revOldPassword" runat="server"
                                                                            ControlToValidate="tbPassword"
                                                                            ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 special character"
                                                                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%_*#?&])[A-Za-z\d$@$!_%*#?&]{8,}$" Font-Size="Small" Display="Dynamic"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newPw" class="col-4 col-form-label">New password: </label>
                                        <div class="col-8">
                                            <asp:TextBox ID="tbNewPassword" runat="server" OnTextChanged="TextBox2_TextChanged" TextMode="Password"></asp:TextBox>
                                            <asp:Label Text="*" runat="server" ForeColor="Red"/>
                                            <br/>
                                            <asp:RegularExpressionValidator ID="revPassword" runat="server"
                                                                            ControlToValidate="tbNewPassword"
                                                                            ErrorMessage="Minimum 8 characters at least 1 Alphabet, 1 Number and 1 special character"
                                                                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*_#?&])[A-Za-z\d$@$!%*_#?&]{8,}$" Font-Size="Small" Display="Dynamic"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="conNewPw" class="col-4 col-form-label">Confirmed password: </label>
                                        <div class="col-8">
                                            <asp:TextBox ID="tbNewConPassword" runat="server" OnTextChanged="TextBox3_TextChanged" TextMode="Password"></asp:TextBox>
                                            <asp:Label Text="*" runat="server" ForeColor="Red"/>
                                            <br/>
                                            <asp:RegularExpressionValidator ID="revConPassword" runat="server"
                                                                            ControlToValidate="tbNewConPassword"
                                                                            ErrorMessage="Minimum 8 characters at least 1 Alphabet, 1 Number and 1 special character"
                                                                            ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%_*#?&])[A-Za-z\d$@$!%_*#?&]{8,}$" Font-Size="Small" Display="Dynamic"/>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="offset-4 col-8">
                                            <asp:Button class="btn btn-primary" ID="btnSave" runat="server" Text="Save" CssClass="buttonEditStyle" OnClick="btnSave_Click"/>
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
</asp:Content>