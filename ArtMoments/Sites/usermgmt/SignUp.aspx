<%@ Page Title="Sign-Up" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login Form Design</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <link href="../../Content/css/LoginUser.css" rel="stylesheet" />
    <link href="../../Content/css/UserMgmtSignUp.css" rel="stylesheet" />

    <style>
        .radioButtonStyle{
            padding:2em;
        }
        .invalidMsgMargin{
            margin-left:2em;
        }
        .ErrorMsgColor{
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="myCard">
            <div class="row">
                <div class="col-md-6" id="Content9">
                    <div class="myLeftCtn"> 
                        <form class="myForm text-center">
                            <header>Create new account</header>

                            <div class="form-group">
                                <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" CellPadding="0" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="212px">
                                    <asp:ListItem>   Buyer</asp:ListItem>
                                    <asp:ListItem>   Seller</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-user"></i>                                
                                <asp:TextBox class="myInput" placeholder="Username" ID="txtUserName" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-envelope"></i>
                                <asp:TextBox class="myInput" placeholder="Email" ID="txtUserEmail" runat="server"></asp:TextBox>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserEmail"
                                ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                Display="Dynamic" ErrorMessage="Invalid email address" CssClass="invalidMsgMargin"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserEmail"
                                ForeColor="Red" Display="Dynamic" ErrorMessage="Required" CssClass="invalidMsgMargin"/>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox class="myInput" placeholder="Password" ID="txtUserPassword" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:Label Text="*" runat="server" ForeColor="Red" />
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="txtUserPassword"
                                ErrorMessage="Minimum 8 characters at least 1 Alphabet, 1 Number and 1 special character"
                                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%_*#?&])[A-Za-z\d$@$!%_*#?&]{8,}$" Font-Size="Small" Display="Dynamic"/>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-unlock"></i>
                                <asp:TextBox class="myInput" placeholder="Confirm Password" ID="txtConfirmedPassword" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:Label Text="*" runat="server" ForeColor="Red" />  
                                <br />
                                <asp:RegularExpressionValidator ID="rev1" runat="server" 
                                ControlToValidate="txtConfirmedPassword"
                                ErrorMessage="Minimum 8 characters at least 1 Alphabet, 1 Number and 1 special character"
                                ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*_#?&])[A-Za-z\d$@$!%_*#?&]{8,}$" Font-Size="Small" Display="Dynamic"/>
                            </div>                            

                            <div class="form-group" id="textRemoveMargin">
                                <label>
                                    <input id="check_1" name="check_1"  type="checkbox" required><small> I agree to the Terms & Conditions</small></input> 
                                    <div class="invalid-feedback">You must check the box.</div>
                                </label>
                            </div>
                            <asp:Button class="butt" ID="btnCreateAcc" runat="server" Text="CREATE ACCOUNT" OnClick="btnCreateAcc_Click"></asp:Button>  
                            
                            <br />                            
                        </form>
                        <asp:Label ID="lblMessage" runat="server" CssClass="ErrorMsgColor"></asp:Label>
                        <br />
                    </div>
                </div> 
                <div class="col-md-6" id="loginDesc">
                    <div>
                            <div class="box" ><header style="color:antiquewhite; font-size:25px; font-family:'Book Antiqua';">Welcome to Art Moments</header>
                            <br /><br /><br /><br />
                            <p style="color:floralwhite; padding:10px">“Go and make interesting mistakes, 
                                make amazing mistakes, make glorious and fantastic mistakes. 
                                Break rules. Leave the world more interesting for your being here. 
                                Make. Good. Art.” – Neil Gaiman</p>                               
                            </div>                                
                    </div>
                </div>
            </div>
        </div>
</div> 

</asp:Content>
