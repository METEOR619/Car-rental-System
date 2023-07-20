<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageGearDetails.aspx.cs" Inherits="Admin_ManageGearDetails" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage Gear Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Manage Gear Details</div>
            <div class="card-body">
                <div class="form-group">
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="GearID" 
                        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="GearID" HeaderText="GearID" ReadOnly="True" SortExpression="GearID" />
                            <asp:BoundField DataField="GearType" HeaderText="GearType" SortExpression="GearType" />
                            <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="btnEdit" NavigateUrl='<%# string.Format("~/Admin/UpdateGearDetails.aspx?Gid={0}&Gtype={1}",HttpUtility.UrlEncode(Eval("GearID").ToString()),HttpUtility.UrlEncode(Eval("GearType").ToString())) %>' 
                                    CssClass="text-success" runat="server">
                                        Edit
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:Button ID="btnDelete"  CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="Delete" />
                                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnDelete" 
                                    ConfirmText="Do You Want To Delete This Record?" runat="server">
                                    </cc1:ConfirmButtonExtender>
                                </ItemTemplate>
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
                        DeleteCommand="DELETE FROM tbl_Gear WHERE (GearID = @GearID)" 
                        SelectCommand="SELECT tbl_Gear.* FROM tbl_Gear" 
                        UpdateCommand="UPDATE tbl_Gear SET GearType = @GearType WHERE (GearID = @GearID)">
                        <DeleteParameters>
                            <asp:Parameter Name="GearID"  />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="GearType" />
                            <asp:Parameter Name="GearID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

			    </div>
            </div>    
        </div>
    </div>
</asp:Content>

