<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="UpdateModelDetails.aspx.cs" Inherits="Admin_UpdateModelDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Update Model Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Update Model Details</div>
            <div class="card-body">
                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Model Details ID:</label>
				    <div class="col-sm-5">
                        <asp:Label ID="lblMDetailsID" CssClass="form-control" style="border:0px" runat="server" Text=" ModelDetailsID"></asp:Label>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Brand Name:</label>
				    <div class="col-sm-5">
                        <asp:TextBox ID="txtCarBrand" class="form-control" placeholder="Brand Name" runat="server"></asp:TextBox>
                    </div>
			    </div>
                
                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-5">
                        <div class="text-center">
                            <asp:Button ID="btnUpdateBrand" class="btn btn-primary btn-round waves-effect waves-light m-1"  
                            runat="server" Text="Update Brand" />
                            
                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnUpdateBrand" 
                            ConfirmText="Do You Want To Update This?" runat="server">
                            </cc1:ConfirmButtonExtender>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</asp:Content>

