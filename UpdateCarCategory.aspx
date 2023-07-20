<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="UpdateCarCategory.aspx.cs" Inherits="Admin_UpdateCarCategory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Update Car Category</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Update Car Category</div>
            <div class="card-body">
                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Category ID:</label>
				    <div class="col-sm-5">
                        <asp:Label ID="lblCategoryID" CssClass="form-control" style="border:0px" runat="server" Text="CategoryID"></asp:Label>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Category Name:</label>
				    <div class="col-sm-5">
                        <asp:TextBox ID="txtCategory" class="form-control" placeholder="Category Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Category Name Required" 
                            ControlToValidate="txtCategory" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>
                
                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-5">
                        <div class="text-center">
                            <asp:Button ID="btnUpdateCategory" class="btn btn-primary btn-round waves-effect waves-light m-1"  
                            runat="server" Text="Update Category" onclick="btnUpdateCategory_Click"  />
                            
                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnUpdateCategory" 
                            ConfirmText="Do You Want To Update This?" runat="server">
                            </cc1:ConfirmButtonExtender>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</asp:Content>

