<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageCarBrand.aspx.cs" Inherits="Admin_ManageCarBrand" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage Car Brand</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Manage Car Brand</div>
            <div class="card-body">
                <div class="form-group">
				    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="BrandID" DataSourceID="SqlDataSource1" 
                    ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="BrandID" HeaderText="Brand ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="BrandID"></asp:BoundField>
                            <asp:BoundField DataField="BrandName" HeaderText="Brand Name" 
                                SortExpression="BrandName" />
                            <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="btnEdit" NavigateUrl='<%# string.Format("~/Admin/UpdateCarBrand.aspx?Bid={0}&Bname={1}",HttpUtility.UrlEncode(Eval("BrandID").ToString()),HttpUtility.UrlEncode(Eval("BrandName").ToString())) %>' 
                                    CssClass="text-success" runat="server">
                                        Edit
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
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
			    </div>
            </div>    
        </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CarTravelConnectionString %>" 
        SelectCommand="SELECT * FROM [tbl_Brand] ORDER BY [BrandID]" 
        DeleteCommand="DELETE FROM tbl_Brand WHERE (BrandID = @BrandID)" 
        UpdateCommand="UPDATE tbl_Brand SET BrandName = @BrandName WHERE (BrandID = @BrandID)">
        <DeleteParameters>
            <asp:Parameter Name="BrandName" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="BrandName" />
            <asp:Parameter Name="BrandID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

