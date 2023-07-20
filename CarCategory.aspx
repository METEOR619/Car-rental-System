<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="CarCategory.aspx.cs" Inherits="Admin_CarCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Insert Category</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-lg-12">
    <div class="card">
        <div class="card-header text-uppercase">Add New Category</div>
        <div class="card-body">
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
                        <asp:Button ID="btnAddCategory" 
                            class="btn btn-primary btn-round waves-effect waves-light m-1"  runat="server" 
                            Text="Add Category" onclick="btnAddCategory_Click"/>
                    </div>
                </div>
            </div>
        </div>    
    </div>
</div>
</asp:Content>

