<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Client_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegExp1" runat="server"
    ErrorMessage="Password length must be between 7 to 10 characters(Without Whitespace)"
    ControlToValidate="Textbox1"
    ValidationExpression="^[\S]{8,50}$" />
    <br />

    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>--Select State--</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
    </asp:DropDownList>
<%--    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
    ErrorMessage="Select State"
    ControlToValidate="DropDownList1"
    ValidationExpression="^[--Select State--]{0,50}$" />--%>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="DropDownList1" ErrorMessage="RequiredFieldValidator"
    InitialValue="--Select State--"></asp:RequiredFieldValidator>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />

</asp:Content>

