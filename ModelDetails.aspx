<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ModelDetails.aspx.cs" Inherits="Admin_ModelDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Insert Model Deatils</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <div class="col-lg-12">
    <div class="card">
        <div class="card-header text-uppercase">Add New Model Details</div>
        <div class="card-body">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select Brand:</label>
				        <div class="col-sm-5" role="group">
                            <asp:DropDownList ID="DDLCarBrand" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True"  AutoPostBack="True" 
                                onselectedindexchanged="DDLCarBrand_SelectedIndexChanged" >
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Car Brand Required" InitialValue="-- Select Car Brand --" 
                            ControlToValidate="DDLCarBrand" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select Model:</label>
				        <div class="col-sm-5" role="group">
                            <asp:DropDownList ID="DDLCarModel" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True"  >
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Car Model Required" InitialValue="-- Select Car Model --" 
                            ControlToValidate="DDLCarModel" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select Seats:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLSelectSeats" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True"  >
                                <asp:ListItem Value="0">-- Select no of Seats --</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="No. of Seats Required" InitialValue="0" 
                            ControlToValidate="DDLSelectSeats" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select Bag Spaces:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLSelectBagSpace" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True"  >
                                <asp:ListItem Value="0">-- Select no of Bag Space --</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="No. of Bag Space Required" InitialValue="0" 
                            ControlToValidate="DDLSelectBagSpace" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select Gear:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLSelectGear" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Gear Type Required" InitialValue="-- Select Gear Type --" 
                            ControlToValidate="DDLSelectGear" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select Fuel Type:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLSelectFuel" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Fuel Type Required" InitialValue="-- Select Fuel Type --" 
                                ControlToValidate="DDLSelectFuel" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select AC:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLSelectAC" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True"  >
                                <asp:ListItem Value="0">-- Select Air Condition --</asp:ListItem>
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="2">No</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Air Condition Type Required" InitialValue="0" 
                                ControlToValidate="DDLSelectAC" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select Airbag:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLSelectAirBag" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True"  >
                                <asp:ListItem Value="0">-- Select no of Airbag --</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="No. of Airbag Required" InitialValue="0" 
                                ControlToValidate="DDLSelectAirBag" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>
            
                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select State:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLSelectState" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True" AutoPostBack="True"
                                onselectedindexchanged="DDLSelectState_SelectedIndexChanged" >
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="State Required" InitialValue="-- Select State --" 
                                ControlToValidate="DDLSelectState" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select City:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLSelectCity" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="City Required" InitialValue="-- Select City --" 
                                ControlToValidate="DDLSelectCity" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Enter Price:</label>
				        <div class="col-sm-5">
                            <asp:TextBox ID="txtPrice" CssClass="form-control" placeholder="Enter Price Per Day" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Price Per Day Required" 
                                ControlToValidate="txtPrice" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>

                    <div class="form-group row">
				        <label for="default-input" class="col-sm-2 col-form-label">Select Is Active:</label>
				        <div class="col-sm-5">
                            <asp:DropDownList ID="DDLIsActive" CssClass="form-control" runat="server" 
                                    AppendDataBoundItems="True"  >
                                <asp:ListItem Value="-1">-- Select Active Status --</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Active Status Required" InitialValue="-1" 
                                ControlToValidate="DDLIsActive" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
			        </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            
                
            <div class="form-group row">
                <div class="col-sm-2"></div>
                <div class="col-sm-5">
                    <div class="text-center">
                        <asp:Button ID="btnAddModelDetails" class="btn btn-primary btn-round waves-effect waves-light m-1"  
                        runat="server" Text="Add Model Details" onclick="btnAddModelDetails_Click"  />
                    </div>
                </div>
            </div>
        </div>
            
    </div>
</div>
</asp:Content>

