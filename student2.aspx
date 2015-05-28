﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student2.aspx.cs" Inherits="Student2" %>
<%@Import Namespace="System.Data"%>
<%@Import Namespace="System.Data.SqlClient"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<script src="dist/js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="dist/css/bootstrap.min.css" />
<script src="dist/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="css/layout.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>羊咩咩作业系统</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
    
        <div class="row a">
            
            <div class="col-md-12">
            <div class="page-header" style ="height:75px" >
                     <div style ="float:left "><img  src="images/katong17.png" /></div>
                     <div style ="float:left ;margin-top:50px">Please input your homework ON TIME</div>
                </div>
            </div>
        </div> 
    </div>
    <div class="container">
        <div class="row b">
                <nav class="navbar navbar-default" role="navigation">
                <ul class="nav navbar-nav">
                     <li><a href="student.aspx" >主页</a></li>
                     <li class="active" role="presentation"><a href="student2.aspx">作业提交</a></li>
                </ul>

                </nav>
        </div>
        <div class="row c">
            <div class="d">
                <%--<p><asp:Label runat ="server" ID="N"></asp:Label>同学，欢迎来到74°作业系统。</p>--%>
                <script type="text/javascript">

                    var today = new Date();

                    var s = today.getFullYear() + "年" + today.getMonth() + "月" + today.getDate() + "日" + today.getHours() + "时" + today.getMinutes() + "分" + today.getSeconds() + "秒" + "\t星期" + today.getDay();

                    document.write("现在是：" + s);

                </script>
            </div> 
    
      
        
        </div>
        <div class="row e">
            <div class="list-group">
                 <asp:Label runat ="server" ID ="Label3"></asp:Label>
<%--                <a class="list-group-item list-group-item-success">
                    <p>软件工程的同学：</p>
                          请于12月31日前提交IT项目管理作业
                </a>--%>
                <a class="list-group-item list-group-item-info">
                    <p>数字媒体的同学：</p>
                          请于1月31日前提交PS作业
                </a>
            </div>

        </div> 
        
    </div> 
    <div  class ="container" >
    <div style="margin-left :450px;margin-top :70px;position:relative ">
         <asp:FileUpload ID="homeworkFile" runat="server" Width="432px" />
    </div>

         <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="上传" style="Width:137px"/>
        <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:Label ID="Label2" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <input id="Button3" runat="server" value="重置" style="width:135px" type="Reset"/>
     
        </p>
    </div> 
    </form>
</body>
</html>
