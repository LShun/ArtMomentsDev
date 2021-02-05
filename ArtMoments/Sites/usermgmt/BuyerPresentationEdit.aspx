<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerPresentationEdit.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerPresentationEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title></title>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
	<div class="row">
        <div class="col-md-3 ">
		        <div class="list-group ">
                    <a href="BuyerAccount.aspx"  class="list-group-item list-group-item-action">My Account</a>
                    <a href="BuyerSetting.aspx" class="list-group-item list-group-item-action ">Setting</a>
                    <a href="BuyerPresentation.aspx"  class="list-group-item list-group-item-action active">Presentation</a>            
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
                                  <asp:TextBox ID="tbBibliography" runat="server" ReadOnly="False" OnTextChanged="tbBibliography_TextChanged"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">Profile Picture</label> 
                                <div class="col-8">
                                  <asp:FileUpload ID="FileUpload1" runat="server" />

                                    <hr />
        <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="Upload">
        <Columns>
            <asp:BoundField DataField="profile_pic" HeaderText="Profile Pic" />
        </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" SelectCommand="SELECT * FROM [User] WHERE ([user_name] = @user_name)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="user_name" SessionField="UserName" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
<div id="dialog" style="display: none">
</div>

                                </div>
                              </div>                            
                             
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                    <asp:Button ID="btnUpload" runat="server" Text="Save" OnClick="Upload" CssClass="buttonEditStyle" />
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
