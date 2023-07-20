<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageAdmin.aspx.cs" Inherits="Admin_ManageAdmin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage Admin</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header text-uppercase">Manage Admin</div>
                <div class="card-body">
                    <div class="form-group">
                        <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="AdminID" DataSourceID="SqlDataSource1" CellPadding="4" 
                            ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="AdminID" HeaderText="AdminID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="AdminID" />
                                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" 
                                    SortExpression="Username" />
                                <asp:BoundField DataField="Email" HeaderText="Email" 
                                    SortExpression="Email" />
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile"  
                                    SortExpression="Mobile" />
                                <asp:TemplateField HeaderText="ModelImage" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate> 
                                        <asp:Image ID="imgModel" CssClass="w-50" ImageUrl='<%# "~/Admin/assets/images/AdminAvatar/" + Eval("Image") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IsSuper" HeaderText="IsSuper"  
                                    SortExpression="IsSuper" />
                                <asp:CommandField HeaderText="Edit" ShowEditButton="True" >
                                    <ControlStyle CssClass="text-success" />
                                </asp:CommandField>
                                
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
                            DeleteCommand="DELETE FROM tbl_Admin WHERE (AdminID = @AdminID) AND (IsSuper = 0)" 
                            SelectCommand="SELECT AdminID, Username, Email, Mobile, Image, IsSuper FROM tbl_Admin" 
                            UpdateCommand="UPDATE tbl_Admin SET IsSuper = @IsSuper WHERE (AdminID = @AdminID)">
                            <DeleteParameters>
                                <asp:Parameter Name="AdminID" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="IsSuper" />
                                <asp:Parameter Name="AdminID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
			        </div>
                </div>    
            </div>
        </div>
</asp:Content>

