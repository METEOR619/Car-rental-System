<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="UpdateCity.aspx.cs" Inherits="Admin_UpdateCity" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Update City</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Update City</div>
            <div class="card-body">
                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">City ID:</label>
				    <div class="col-sm-5">
                        <asp:Label ID="lblCityID" CssClass="form-control" style="border:0px" runat="server" Text="CityID"></asp:Label>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">State Name:</label>
				    <div class="col-sm-5">
                        <asp:DropDownList ID="DDLState" CssClass="form-control" runat="server" 
                             AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="State Name Required" InitialValue="-- Select State --"
                            ControlToValidate="DDLState" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">City Name:</label>
				    <div class="col-sm-5">
                        <asp:TextBox ID="txtCityName" class="form-control" placeholder="City Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="City Name Required" 
                            ControlToValidate="txtCityName" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>
                
                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-5">
                        <div class="text-center">
                            <asp:Button ID="btnUpdateCity" class="btn btn-primary btn-round waves-effect waves-light m-1"  
                            runat="server" Text="Update City" onclick="btnUpdateCity_Click" />
                            
                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnUpdateCity" 
                                ConfirmText="Do You Want To Update This?" runat="server">
                            </cc1:ConfirmButtonExtender>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</asp:Content>

