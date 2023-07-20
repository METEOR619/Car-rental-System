<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageCity.aspx.cs" Inherits="Admin_ManageCity" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage City</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header text-uppercase">Manage City</div>
                <div class="card-body">
                    <div class="form-group">
                        <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="CityID" DataSourceID="SqlDataSource1" CellPadding="4" 
                            ForeColor="#333333" GridLines="None" AllowSorting="True" AllowPaging="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="CityID" HeaderText="CityID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="CityID" />
                                <asp:BoundField DataField="StateName" HeaderText="StateName" 
                                    SortExpression="StateName" />
                                    <asp:BoundField DataField="CityName" HeaderText="CityName" 
                                    SortExpression="CityName" />
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="btnEdit" NavigateUrl='<%# string.Format("~/Admin/UpdateCity.aspx?Cid={0}",HttpUtility.UrlEncode(Eval("CityID").ToString())) %>' 
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
                            DeleteCommand="DELETE FROM tbl_City WHERE (CityID = @CityID)" 
                            SelectCommand="SELECT tbl_City.CityID, tbl_State.StateName, tbl_City.CityName FROM tbl_City INNER JOIN tbl_State ON tbl_City.StateID = tbl_State.StateID" 
                            
                            UpdateCommand="UPDATE tbl_City SET CityName = @CityName WHERE (CityID = @CityID)">
                            <DeleteParameters>
                                <asp:Parameter Name="CityID" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CityName" />
                                <asp:Parameter Name="CityID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
			        </div>
                </div>    
            </div>
        </div>
</asp:Content>

