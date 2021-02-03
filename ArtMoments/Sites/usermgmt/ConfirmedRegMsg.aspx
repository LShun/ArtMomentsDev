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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ID="Content5">
    <div class="container" >
        
        <div class="myCard" id="Content5">
            <div class="row">
                <div class="col-md-10">
                    <i class="fas fa-times"></i>
                    <div class="myLeftCtn"> 
                        <form class="myForm text-center">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Registration successful!" style="text-align:center; margin-left:20px"></asp:Label>
                               </div>

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Take a tour?" style="text-align:center; margin-left:20px"></asp:Label> 
                            </div>
                            <asp:Button class="butt" ID="Button2" OnClick="Button1_Click" runat="server" Text="Go to Login"></asp:Button>  
                            
                            <br />
                            <br />                            
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</div> 
</asp:Content>
