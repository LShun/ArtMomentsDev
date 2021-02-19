<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Artist1.Master" AutoEventWireup="true" CodeBehind="AccountSetting.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerSettingNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 183px;
        }
        .auto-style2 {
            left: 0px;
            top: 0px;
        }        
    </style>
    <link href="../../Content/css/SignUp.css" rel="stylesheet" />
    <link href="../../Content/css/AccountCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
                  <asp:LinkButton class="list-group-item list-group-item-action" ID="lbMyAcc" runat="server" OnClick="lbMyAcc_Click" >My Account</asp:LinkButton>
                  <asp:LinkButton class="list-group-item list-group-item-action active" ID="lbSetting" runat="server" OnClick="lbSetting_Click">Setting</asp:LinkButton>
                  <asp:LinkButton class="list-group-item list-group-item-action" ID="lbPresentation" runat="server" OnClick="lbPresentation_Click" >Presentation</asp:LinkButton>
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
                                                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Edit" Width="508px">
                                                        <EditItemTemplate>
                                                            <table style="width:100%;">
                                                                <tr>
                                                                    <td class="auto-style1">User ID</td>
                                                                    <td>
                                                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("id") %>' />
                                                                    </td>
    
                                                                </tr>
                                                                <tr>
                                                                    <td class="auto-style1">User Name</td>
                                                                    <td>
                                                                        <asp:TextBox ID="tbUser_name" runat="server" BorderStyle="None" ReadOnly="True" Text='<%# Bind("user_name") %>' />
                                                                    </td>           
                                                                </tr>
                                                                <tr>
                                                                    <td class="auto-style1">User Email</td>
                                                                    <td>
                                                                        <asp:TextBox ID="tbUser_email" runat="server" Text='<%# Bind("user_email") %>' />
                                                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbUser_email"
                                ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                Display="Dynamic" ErrorMessage="Invalid email address" CssClass="invalidMsgMargin"/>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbUser_email"
                                ForeColor="Red" Display="Dynamic" ErrorMessage="Required" CssClass="invalidMsgMargin"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="auto-style1">Contact No</td>
                                                                    <td>
                                                                        <asp:TextBox ID="tbUser_contactno" runat="server" Text='<%# Bind("user_contactno") %>' />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClick="UpdateButton_Click" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClick="UpdateCancelButton_Click" />
                                                            <br />                                                            
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            user_name:
                                                            <asp:TextBox ID="tbUser_name1" runat="server" Text='<%# Bind("user_name") %>' />
                                                            <br />
                                                            user_email:
                                                            <asp:TextBox ID="tbUser_email1" runat="server" Text='<%# Bind("user_email") %>' />                                                            
                                                            <br />
                                                            user_contactno:
                                                            <asp:TextBox ID="tbUser_contactno1" runat="server" Text='<%# Bind("user_contactno") %>' />
                                                            <br />

                                                            <asp:LinkButton ID="lbInsert" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            user_name:
                                                            <asp:Label ID="lblUser_name" runat="server" Text='<%# Bind("user_name") %>' />
                                                            <br />
                                                            user_email:
                                                            <asp:Label ID="lblUser_email" runat="server" Text='<%# Bind("user_email") %>' />                                                            
                                                            <br />
                                                            user_contactno:
                                                            <asp:Label ID="lblUser_contactno" runat="server" Text='<%# Bind("user_contactno") %>' />
                                                            <br />
                                                            id:
                                                            <asp:Label ID="lblID1" runat="server" Text='<%# Eval("id") %>' />
                                                            <br />
                                                            <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                                            &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                                            &nbsp;<asp:LinkButton ID="btnNew" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                                        </ItemTemplate>
                                                    </asp:FormView>
                                                    <asp:Label ID="lblSuccessMsg" runat="server"></asp:Label>

												<div />

										    </div> 
								    </div>
						    </div> 
				   </div>
			</div> 			
		</div>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtMomentsDbConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [id] = @id" InsertCommand="INSERT INTO [User] ([user_name], [user_email], [user_contactno]) VALUES (@user_name, @user_email, @user_contactno)" SelectCommand="SELECT [user_name], [user_email], [user_contactno], [id] FROM [User] WHERE ([user_name] = @user_name)" UpdateCommand="UPDATE [User] SET [user_name] = @user_name, [user_email] = @user_email, [user_contactno] = @user_contactno WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="user_name" Type="String" />
                <asp:Parameter Name="user_email" Type="String" />
                <asp:Parameter Name="user_contactno" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="user_name" SessionField="UserName" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_name" Type="String" />
                <asp:Parameter Name="user_email" Type="String" />
                <asp:Parameter Name="user_contactno" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            </asp:SqlDataSource>

        <a href="ChangePassword.aspx">Change password</a>  
	</div>
</div>
</asp:Content>
