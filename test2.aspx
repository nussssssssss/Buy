<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test2.aspx.cs" Inherits="test2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:FileUpload ID="homeworkFile" runat="server" />
    <asp:Button ID="btnAdd" runat="server" Text="上传"  OnClick="btnAdd_Click"/>
    <asp:Button ID="btndownfile" runat="server" Text="下载方法一：TransmitFile" 
        onclick="btndownfile_Click" />
       <asp:Button ID="btndownfilebyWriteFile" runat="server" 
        Text="下载方法二：WriteFile" onclick="btndownfilebyWriteFile_Click" />
        <asp:Button ID="btndownfilebyWriteFile2" runat="server" 
        Text="下载方法三：WriteFile分块" onclick="btndownfilebyWriteFile2_Click" /><br />
        <asp:Button ID="btndownfilebystream" runat="server" Text="下载方法四：流方式下载" 
        onclick="btndownfilebystream_Click" />
    </form>
</body>
</html>
