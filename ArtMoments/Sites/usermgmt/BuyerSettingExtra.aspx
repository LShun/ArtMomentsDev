<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="BuyerSettingExtra.aspx.cs" Inherits="ArtMoments.Sites.usermgmt.BuyerSettingNew" %>
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
                                                                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                                                    </td>
    
                                                                </tr>
                                                                <tr>
                                                                    <td class="auto-style1">User Name</td>
                                                                    <td>
                                                                        <asp:TextBox ID="user_nameTextBox" runat="server" BorderStyle="None" ReadOnly="True" Text='<%# Bind("user_name") %>' />
                                                                    </td>           
                                                                </tr>
                                                                <tr>
                                                                    <td class="auto-style1">User Email</td>
                                                                    <td>
                                                                        <asp:TextBox ID="user_emailTextBox" runat="server" Text='<%# Bind("user_email") %>' />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="auto-style1">Contact No</td>
                                                                    <td>
                                                                        <asp:TextBox ID="user_contactnoTextBox" runat="server" Text='<%# Bind("user_contactno") %>' />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            user_name:
                                                            <asp:TextBox ID="user_nameTextBox" runat="server" Text='<%# Bind("user_name") %>' />
                                                            <br />
                                                            user_email:
                                                            <asp:TextBox ID="user_emailTextBox" runat="server" Text='<%# Bind("user_email") %>' />
                                                            <br />
                                                            user_contactno:
                                                            <asp:TextBox ID="user_contactnoTextBox" runat="server" Text='<%# Bind("user_contactno") %>' />
                                                            <br />

                                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            user_name:
                                                            <asp:Label ID="user_nameLabel" runat="server" Text='<%# Bind("user_name") %>' />
                                                            <br />
                                                            user_email:
                                                            <asp:Label ID="user_emailLabel" runat="server" Text='<%# Bind("user_email") %>' />
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="user_emailLabel"
                                ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                Display="Dynamic" ErrorMessage="Invalid email address" CssClass="invalidMsgMargin"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="user_emailLabel"
                                ForeColor="Red" Display="Dynamic" ErrorMessage="Required" CssClass="invalidMsgMargin"/>
                                                            <br />
                                                            user_contactno:
                                                            <asp:Label ID="user_contactnoLabel" runat="server" Text='<%# Bind("user_contactno") %>' />
                                                            <br />
                                                            id:
                                                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                                            <br />
                                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                                        </ItemTemplate>
                                                    </asp:FormView>

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
