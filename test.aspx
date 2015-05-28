<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Button ID="Button1" runat="server" Text="connect to DataBase" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="close the connection" Visible="false" OnClick="Button2_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
        <asp:Button ID="Button3" runat="server" Text="Button" Width="126px" />
    </form>
</body>
</html>
