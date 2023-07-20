<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="UpdateCarModel.aspx.cs" Inherits="Admin_UpdateCarModel" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Updae Car Model</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Update Car Model</div>
            <div class="card-body">
                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Model ID:</label>
				    <div class="col-sm-5">
                        <asp:Label ID="lblModelID" CssClass="form-control" style="border:0px" runat="server" Text="ModelID"></asp:Label>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Brand Name:</label>
				    <div class="col-sm-5">
                        <asp:DropDownList ID="DDLCarBrand" CssClass="form-control" runat="server" 
                             AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Brand Name Required" InitialValue="-- Select Car Brand --"
                            ControlToValidate="DDLCarBrand" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Category Name:</label>
				    <div class="col-sm-5">
                        <asp:DropDownList ID="DDLCarCategory" CssClass="form-control" runat="server" 
                             AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Category Name Required" InitialValue="-- Select Car Category --"
                            ControlToValidate="DDLCarCategory" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Model Name:</label>
				    <div class="col-sm-5">
                        <asp:TextBox ID="txtModelName" class="form-control" placeholder="Model Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Model Name Required" 
                            ControlToValidate="txtModelName" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
			    </div>
                
                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-5">
                        <div class="text-center">
                            <asp:Button ID="btnUpdateModel" class="btn btn-primary btn-round waves-effect waves-light m-1"  
                            runat="server" Text="Update Model" OnClick="btnUpdateModel_Click" />
                            
                            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnUpdateModel" 
                                ConfirmText="Do You Want To Update This?" runat="server">
                            </cc1:ConfirmButtonExtender>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</asp:Content>

