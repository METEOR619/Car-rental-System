<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="Admin_AddAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Add Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Add New Admin</div>
            <div class="card-body">
                <div class="form-group row">
				    <label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Username</label>
				    <div class="col-xl-5 col-sm-6" role="group">
                        <asp:TextBox ID="txtUsername" class="form-control" placeholder="Username" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required" 
                            ControlToValidate="txtUsername" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Password</label>
				    <div class="col-xl-5 col-sm-6" role="group">
                        <asp:TextBox ID="txtPassword" class="form-control" placeholder="Password" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Required" 
                            ControlToValidate="txtPassword" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ErrorMessage="Password length must be between 8 to 50 characters(Without Whitespace)" ControlToValidate="txtPassword"
                            SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic" ValidationExpression="^[\S]{8,50}$"></asp:RegularExpressionValidator>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Confirm Password:</label>
				    <div class="col-xl-5 col-sm-6">
                        <asp:TextBox ID="txtCPassword" class="form-control" 
                            placeholder="Confirm Password" runat="server" TextMode="Password" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm Password Required" 
                            ControlToValidate="txtCPassword" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Mismatch!"
                            ControlToValidate="txtCPassword" ControlToCompare="txtPassword" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:CompareValidator>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Email ID:</label>
				    <div class="col-xl-5 col-sm-6">
                        <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" type="email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email Required" 
                            ControlToValidate="txtEmail" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="Invalid Email ID" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Mobile:</label>
				    <div class="col-xl-5 col-sm-6">
                        <asp:TextBox ID="txtMobile" class="form-control" placeholder="Mobile" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mobile Required" 
                            ControlToValidate="txtMobile" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobile"
                            ErrorMessage="Invalid Mobile Number" ValidationExpression="^([6-9]{1})([0-9]{9})$"
                            SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
			    </div>
            
                <div class="form-group row">
				    <label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Upload Admin Image:</label>
				    <div class="col-xl-5 col-sm-6" role="group">
                        <asp:FileUpload ID="FUAdmin" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Admin Image Required" 
                            ControlToValidate="FUAdmin" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Select Type:</label>
				    <div class="col-xl-5 col-sm-6" role="group">
                        <asp:DropDownList ID="DDLAdminType" CssClass="form-control" runat="server">
                            <asp:ListItem Value="-1">-- Select Admin Type --</asp:ListItem>
                            <asp:ListItem Value="0">Sub Admin</asp:ListItem>
                            <asp:ListItem Value="1">Super Admin</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Admin Type Required" InitialValue="-1"
                            ControlToValidate="DDLAdminType" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>

                <div class="form-group row">
                    <div class="col-xl-2 col-sm-5"></div>
                    <div class="col-xl-5 col-sm-6">
                        <div class="text-center">
                            <asp:Button ID="btnAddAdmin" 
                                class="btn btn-primary btn-round waves-effect waves-light m-1"  runat="server" 
                                Text="Add Admin" onclick="btnAddAdmin_Click"/>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>

