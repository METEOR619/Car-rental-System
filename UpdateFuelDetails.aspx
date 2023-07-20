<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="UpdateFuelDetails.aspx.cs" Inherits="Admin_UpdateFuelDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Update Fuel Details</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Update Fuel Type</div>
            <div class="card-body">
                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Gear ID:</label>
				    <div class="col-sm-5">
                        <asp:Label ID="lblFuelID" CssClass="form-control" style="border:0px" runat="server" Text="FuelID"></asp:Label>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Fuel Type:</label>
				    <div class="col-sm-5">
                        <asp:TextBox ID="txtFuelType" class="form-control" placeholder="Fuel Type" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fuel Type Required" 
                            ControlToValidate="txtFuelType" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>
                
                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-5">
                        <div class="text-center">
                            <asp:Button ID="btnUpdateFtype" class="btn btn-primary btn-round waves-effect waves-light m-1"  
                            runat="server" Text="Update Fuel Type" onclick="btnUpdateFtype_Click" />
                            
                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnUpdateFtype" 
                                ConfirmText="Do You Want To Update This?" runat="server">
                            </cc1:ConfirmButtonExtender>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</asp:Content>

