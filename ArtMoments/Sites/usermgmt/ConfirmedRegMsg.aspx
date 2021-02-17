<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="ConfirmedRegMsg.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.ConfirmedRegMsg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <link href="https://mdbootstrap.com/docs/b4/jquery/content/icons-list/" rel="stylesheet"/>

    <style>
        body{
            background-color:blanchedalmond
        }
        .auto-style1 {
            width: 188px;
            margin:auto; 
            text-align:center;
            border-color: black;
            border-width: 1px;
        }
        makecenter{
            width:200px;
            align-content:center;
            text-align:center; 
            margin-left:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id ="Content8">
    <div class="container" id="Content7" >  
                    <div class="myLeftCtn" style="padding-left: 25px; text-align: center;"> 
                        <form class="myForm text-center">
                            <div class="form-group">
                                <asp:Label ID="lblRegSuccess" runat="server" Text="Registration successful!" CssClass="makecenter"></asp:Label>
                               </div>

                            <asp:Button class="butt" ID="btnLogin" runat="server" Text="Go to Login" OnClick="btnLogin_Click"></asp:Button>  
                            
                            <br />
                            <br />                            
                        </form>
                    </div>
                </div> 
            </div>     

</div> 
</asp:Content>
