﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordEncryption.aspx.cs" Inherits="Client_PasswordEncryption" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:TextBox ID="TextBox1" placeholder="Enter Normal Text" runat="server"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br /><br />

        <asp:TextBox ID="TextBox2" placeholder="Enter Encrypted Text" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <br /><br />

        <asp:Button ID="Button1" runat="server" Text="Convert" onclick="Button1_Click" />
    </div>
    </form>
</body>
</html>
