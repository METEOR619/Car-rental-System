<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageBooking.aspx.cs" Inherits="Admin_ManageBooking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Manage Manage Booking</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-uppercase">Booking Details</div>
            <div class="card-body">
                <div class="form-group"  style="overflow:auto">
				    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="BookingID" DataSourceID="SqlDataSource1" 
                        AllowPaging="true" AllowSorting="true" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="BookingID" HeaderText="Booking ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="BookingID"></asp:BoundField>
                            <asp:BoundField DataField="UserName" HeaderText="User Name" 
                                SortExpression="UserName" />
                            <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" 
                                SortExpression="BookingDate" />
                            <asp:BoundField DataField="MDetailsID" HeaderText="MDetailsID" 
                                SortExpression="MDetailsID" />
                            <asp:BoundField DataField="PickUpDate" HeaderText="Pick Up Date" 
                                SortExpression="PickUpDate" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="DropOffDate" HeaderText="Drop Off Date" 
                                SortExpression="DropOffDate" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="LicenseNum" HeaderText="License Number" 
                                SortExpression="LicenseNum" />
                            <asp:BoundField DataField="Address" HeaderText="Address" 
                                SortExpression="Address" />
                            <asp:TemplateField HeaderText="Delete" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Button ID="btnDelete"  CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="Delete" />
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
			    </div>
            </div>    
        </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CarTravelConnectionString %>" 
        SelectCommand="SELECT tbl_Booking.BookingID, tbl_User.UserName, tbl_Booking.BookingDate, tbl_Booking.MDetailsID, tbl_Booking.PickUpDate, tbl_Booking.DropOffDate, tbl_Booking.LicenseNum, tbl_Booking.Address FROM tbl_Booking INNER JOIN tbl_User ON tbl_Booking.UserID = tbl_User.UserID" 
        DeleteCommand="DELETE FROM tbl_Booking WHERE (BookingID = @BookingID)">
        <DeleteParameters>
            <asp:Parameter Name="BookingID" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>

