<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageCarCategory.aspx.cs" Inherits="Admin_ManageCarCategory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage Car Category</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="col-lg-12">
            <div class="card">
                <div class="card-header text-uppercase">Manage Car Category</div>
                <div class="card-body">
                    <div class="form-group">
                        <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1" 
                            ForeColor="#333333" GridLines="None" AllowSorting="True" AllowPaging="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="CategoryID" HeaderText="Category ID" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
                                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" 
                                    SortExpression="CategoryName" />
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="btnEdit" NavigateUrl='<%# string.Format("~/Admin/UpdateCarCategory.aspx?Cid={0}&Cname={1}",HttpUtility.UrlEncode(Eval("CategoryID").ToString()),HttpUtility.UrlEncode(Eval("CategoryName").ToString())) %>' 
                                    CssClass="text-success" runat="server">
                                        Edit
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Button ID="btnDelete"  CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="Delete" />
                                    <%--<cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btnDelete" 
                                    ConfirmText="Do You Want To Delete This Record?" runat="server">
                                    </cc1:ConfirmButtonExtender>--%>
                                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" TargetControlID="btnDelete" 
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
                            DeleteCommand="DELETE FROM tbl_Category WHERE (CategoryID = @CategoryID)" 
                            SelectCommand="SELECT * FROM tbl_Category ORDER BY CategoryName">
                            <DeleteParameters>
                                <asp:Parameter Name="CategoryID" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
			            
			        </div>
                </div>    
            </div>
        </div>
</asp:Content>

