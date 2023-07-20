<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="State.aspx.cs" Inherits="Admin_State" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Insert State</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-lg-12">
    <div class="card">
        <div class="card-header text-uppercase">Add New State</div>
        <div class="card-body">
            <div class="form-group row">
				<label for="default-input" class="col-sm-2 col-form-label">State Name:</label>
				<div class="col-sm-5">
                    <asp:TextBox ID="txtState" class="form-control" placeholder="State Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="State Name Required" 
                        ControlToValidate="txtState" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
			</div>
            <div class="form-group row">
                <div class="col-sm-2"></div>
                <div class="col-sm-5">
                    <div class="text-center">
                        <asp:Button ID="btnAddState" class="btn btn-primary btn-round waves-effect waves-light m-1"  runat="server" 
                            Text="Add State" onclick="btnAddState_Click"/>
                    </div>
                </div>
            </div>
        </div>    
    </div>
</div>
</asp:Content>

