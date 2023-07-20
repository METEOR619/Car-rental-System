<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageCarModel.aspx.cs" Inherits="Admin_ManageCarModel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage Car Model</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <div class="col-lg-12">
            <div class="card">
                <div class="card-header text-uppercase">Manage Car Model</div>
                <div class="card-body">
                    <div class="form-group">
                        <asp:GridView ID="GridView1" CssClass="table" runat="server" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ModelID" PageSize="5"
                            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ModelID" HeaderText="ModelID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ModelID" >
                                <ItemStyle VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BrandName" HeaderText="BrandName" 
                                    SortExpression="BrandName" >
                                    <ItemStyle VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" 
                                    SortExpression="CategoryName" >
                                    <ItemStyle VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ModelName" HeaderText="ModelName" 
                                    SortExpression="ModelName" >
                                    <ItemStyle VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="ModelImage" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate> 
                                        <asp:Image ID="imgModel" CssClass="w-50" ImageUrl='<%# "~/Admin/assets/images/CarModel/" + Eval("ModelImage") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="btnEdit" NavigateUrl='<%# string.Format("~/Admin/UpdateCarModel.aspx?Mid={0}",HttpUtility.UrlEncode(Eval("ModelID").ToString())) %>' 
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
			            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CarTravelConnectionString %>" 
                            DeleteCommand="DELETE FROM tbl_Model WHERE (ModelID = @ModelID)" 
                            SelectCommand="SELECT tbl_Model.ModelID, tbl_Brand.BrandName, tbl_Category.CategoryName, tbl_Model.ModelName, tbl_Model.ModelImage FROM tbl_Model INNER JOIN tbl_Brand ON tbl_Model.BrandID = tbl_Brand.BrandID INNER JOIN tbl_Category ON tbl_Model.CategoryID = tbl_Category.CategoryID" 
                            
                            UpdateCommand="UPDATE tbl_Model SET BrandID = @BrandID, ModelName = @ModelName, CategoryID = @CategoryID, ModelImage = @ModelImage ">
                            <DeleteParameters>
                                <asp:Parameter Name="ModelID" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="BrandID" />
                                <asp:Parameter Name="ModelName" />
                                <asp:Parameter Name="CategoryID" />
                                <asp:Parameter Name="ModelImage" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
			        </div>
                </div>    
            </div>
        </div>
</asp:Content>

