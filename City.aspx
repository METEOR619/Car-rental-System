<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="City.aspx.cs" Inherits="Admin_City" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Insert City</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Add New City</div>
            <div class="card-body">
                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">Select State:</label>
				    <div class="col-sm-5" role="group">
                        <asp:DropDownList ID="DDLState" CssClass="form-control" runat="server" 
                             AppendDataBoundItems="True"  >
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="State Required" InitialValue="-- Select State --" 
                            ControlToValidate="DDLState" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
				</div>

                <div class="form-group row">
				    <label for="default-input" class="col-sm-2 col-form-label">City Name:</label>
				    <div class="col-sm-5">
                        <asp:TextBox ID="txtCity" class="form-control" placeholder="City Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="City Name Required" 
                            ControlToValidate="txtCity" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
				</div>

                <div class="form-group row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-5">
                        <div class="text-center">
                            <asp:Button ID="btnAddCity" class="btn btn-primary btn-round waves-effect waves-light m-1"  
                            runat="server" Text="Add City" onclick="btnAddCity_Click" />
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>

