<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageModelDetails.aspx.cs" Inherits="Admin_ManageModelDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage Model Details</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>

    <div class="col-lg-12">
            <div class="card">
                <div class="card-header text-uppercase">Manage Model Details</div>
                <div class="card-body">
                    <div class="form-group" style="overflow:auto">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table"
                            DataKeyNames="MDetailsID" DataSourceID="SqlDataSource1" CellPadding="4" 
                            ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <%--<asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="btnEdit" NavigateUrl='<%# string.Format("~/Admin/UpdateModelDetails.aspx?MDid={0}",HttpUtility.UrlEncode(Eval("MDetailsID").ToString())) %>' 
                                        CssClass="text-success" runat="server">
                                            Edit
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:BoundField DataField="MDetailsID" HeaderText="MDetailsID" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="MDetailsID" />
                                <asp:BoundField DataField="ModelName" HeaderText="ModelName" 
                                    SortExpression="ModelName" />
                                <asp:BoundField DataField="Seats" HeaderText="Seats" SortExpression="Seats" />
                                <asp:BoundField DataField="BagSpace" HeaderText="BagSpace" 
                                    SortExpression="BagSpace" />
                                <asp:BoundField DataField="GearType" HeaderText="GearType" 
                                    SortExpression="GearType" />
                                <asp:BoundField DataField="FuelType" HeaderText="FuelType" 
                                    SortExpression="FuelType" />
                                <asp:BoundField DataField="AirCondition" HeaderText="AirCondition" 
                                    SortExpression="AirCondition" />
                                <asp:BoundField DataField="Airbag" HeaderText="Airbag" 
                                    SortExpression="Airbag" />
                                <asp:BoundField DataField="StateName" HeaderText="StateName" 
                                    SortExpression="StateName" />
                                <asp:BoundField DataField="CityName" HeaderText="CityName" 
                                    SortExpression="CityName" />
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                <asp:BoundField DataField="IsActive" HeaderText="IsActive" 
                                    SortExpression="IsActive" />
                                <asp:CommandField HeaderText="Edit" ShowEditButton="True">
                                    <ControlStyle CssClass="text-success" />
                                </asp:CommandField>
                                <asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="Delete" />
                                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnDelete" 
                                        ConfirmText="Do You Want To Delete This Record?" runat="server">
                                        </cc1:ConfirmButtonExtender>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="text-center"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                            <PagerStyle BackColor="#2461BF" CssClass="pagination-pvt" ForeColor="White" HorizontalAlign="Center" 
                            BorderStyle="None" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
			            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CarTravelConnectionString %>"                             
                            SelectCommand="SELECT tbl_ModelDetails.MDetailsID, tbl_Model.ModelName, tbl_ModelDetails.Seats, tbl_ModelDetails.BagSpace, tbl_Gear.GearType, tbl_Fuel.FuelType, tbl_ModelDetails.AirCondition, tbl_ModelDetails.Airbag, tbl_State.StateName, tbl_City.CityName, tbl_ModelDetails.Price, tbl_ModelDetails.IsActive FROM tbl_ModelDetails INNER JOIN tbl_Model ON tbl_ModelDetails.ModelID = tbl_Model.ModelID INNER JOIN tbl_Gear ON tbl_ModelDetails.GearID = tbl_Gear.GearID INNER JOIN tbl_Fuel ON tbl_ModelDetails.FuelID = tbl_Fuel.FuelID INNER JOIN tbl_State ON tbl_ModelDetails.StateID = tbl_State.StateID INNER JOIN tbl_City ON tbl_ModelDetails.CityID = tbl_City.CityID" 
                            
                            UpdateCommand="UPDATE tbl_ModelDetails SET IsActive = @IsActive WHERE (MDetailsID = @MdetailsID)" 
                            DeleteCommand="DELETE FROM tbl_ModelDetails WHERE (MDetailsID = @MDetailsID)">
                            <DeleteParameters>
                                <asp:Parameter Name="MDetailsID" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="IsActive" />
                                <asp:Parameter Name="MdetailsID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
			        </div>
                </div>    
            </div>
        </div>
</asp:Content>


