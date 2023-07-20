<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="CarModel.aspx.cs" Inherits="Admin_CarModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Insert Car Model</title>
</asp:Content>

<%--CSS Not Working in DDL First Time. After Postback its work.--%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-lg-12">
    <div class="card">
        <div class="card-header text-uppercase">Add New Car Model</div>
        <div class="card-body">
            <div class="form-group row">
				<label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Select Brand:</label>
				<div class="col-xl-5 col-sm-6" role="group">
                    <asp:DropDownList ID="DDLCarBrand" CssClass="form-control" runat="server" 
                            AppendDataBoundItems="True"  >
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Car Brand Required" InitialValue="-- Select Car Brand --" 
                    ControlToValidate="DDLCarBrand" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
			</div>

            <div class="form-group row">
				<label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Select Category:</label>
				<div class="col-xl-5 col-sm-6" role="group">
                    <asp:DropDownList ID="DDLCarCategory" CssClass="form-control" runat="server" 
                            AppendDataBoundItems="True" >
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Car Category Required" InitialValue="-- Select Car Category --" 
                            ControlToValidate="DDLCarCategory" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
			</div>

            <div class="form-group row">
				<label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Car Model Name:</label>
				<div class="col-xl-5 col-sm-6">
                    <asp:TextBox ID="txtCarModel" class="form-control" placeholder="Car Model Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Car Model Name Required" 
                        ControlToValidate="txtCarModel" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
			</div>
            
            <div class="form-group row">
				<label for="default-input" class="col-xl-2 col-sm-5 col-form-label">Upload Model Image:</label>
				<div class="col-xl-5 col-sm-6" role="group">
                    <asp:FileUpload ID="FUCarModel" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Model Image Required" 
                        ControlToValidate="FUCarModel" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
			</div>

            <div class="form-group row">
                <div class="col-xl-2 col-sm-5"></div>
                <div class="col-xl-5 col-sm-6">
                    <div class="text-center">
                        <asp:Button ID="btnAddCarModel" class="btn btn-primary btn-round waves-effect waves-light m-1"  runat="server" 
                            Text="Add Car Model" onclick="btnAddCarModel_Click"  />
                    </div>
                </div>
            </div>
        </div>
            
    </div>
</div>
</asp:Content>

