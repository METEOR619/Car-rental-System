<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageContactUs.aspx.cs" Inherits="Admin_ManageContactUs" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Manage Contact Us</div>
            <div class="card-body">
                <div class="form-group">
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" 
                        AutoGenerateColumns="False" DataKeyNames="ContactUsID" 
                        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ContactUsID" HeaderText="ContactUsID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="ContactUsID" />
                            <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                            <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                                SortExpression="Mobile" />
                            <asp:BoundField DataField="Message" HeaderText="Message" 
                                SortExpression="Message" />
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <%--<asp:Button ID="btnDelete"  CssClass="btn btn-danger" runat="server" Text="Button" OnClick="btnDelete_Click" CommandName="Delete" />--%>
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
                        DeleteCommand="DELETE FROM tbl_ContactUs WHERE (ContactUsID = @ContactUsID)" 
                        SelectCommand="SELECT tbl_ContactUs.* FROM tbl_ContactUs">
                        <DeleteParameters>
                            <asp:Parameter Name="ContactUsID"  />
                        </DeleteParameters>
                    </asp:SqlDataSource>

			    </div>
            </div>    
        </div>
    </div>
</asp:Content>

