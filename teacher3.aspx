<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacher3.aspx.cs" Inherits="teacher3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<script src="dist/js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="dist/css/bootstrap.min.css" /> 
<script src="dist/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>羊咩咩作业系统</title>
<link rel="stylesheet" href="css/layout.css" />
<style >
 .container .row.f .panel-danger .table tr th {
border-color:#DDD;
}
button, input, optgroup, select, textarea {
    margin: 0px 0px 0px;
    color: inherit;
}
</style>
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
                     <li><a href="teacher.aspx" >主页</a></li>
                     <li><a href="teacher2.aspx">学生管理</a></li>
                     <li class="active" role="presentation"><a href="teacher3.aspx">添加学生</a></li>
                     <li><a href="teacher4.aspx">发布作业</a></li>
                </ul>


                </nav>
        </div>
        <div class="row c">
            <div class="d">
<%--                <p><asp:Label runat ="server" ID="N"></asp:Label>，欢迎来到74°作业系统。</p>--%>
                <script type="text/javascript">

                    var today = new Date();

                    var s = today.getFullYear() + "年" + today.getMonth() + "月" + today.getDate() + "日" + today.getHours() + "时" + today.getMinutes() + "分" + today.getSeconds() + "秒" + "\t星期" + today.getDay();

                    document.write("现在是：" + s);

                </script>

            </div> 
    
      
        
        </div>

        <div class="row f">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    添加用户
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;说明
                </div>
                <!--<div class="panel-body">
                    本次作业应交30人，实际25人
                </div>
                 -->
                <!--Table-->
                <table class="table" border="1" style="border-color: #DDD;">
                    <tr>
                        <th>学号：</th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="学号不能为空！"></asp:RequiredFieldValidator>
                        </th>
                        <th>请使用1-20位数字</th>

                        
                    </tr>
                    <tr>
                        <th>密码</th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode ="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>
                        </th>
                        <th>6-20位密码</th>

                    </tr>
                    <tr>
                        <th>确认密码</th >
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" CultureInvariantValues="true" ErrorMessage="密码输入不一致，请重新输入" ForeColor="Red" Type="String" Operator="Equal"></asp:CompareValidator>
                        </th>
                        <th>请再次输入密码</th>
                    </tr>
                    <tr>
                        <th>姓名</th >
                        <th>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>班级</th >
                        <th>
                            <asp:DropDownList ID="drop1" runat="server">
                                <asp:ListItem>软件一班</asp:ListItem>
                                <asp:ListItem>软件四班</asp:ListItem>
                                <asp:ListItem>软件五班</asp:ListItem>
                            </asp:DropDownList>
                        </th>
                        <th>设置后无法修改，请慎重</th>
                    </tr>
                    <tr>
                        <th>备注</th >
                        <th>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </th>
                        <th>可不填写</th>
                    </tr>
                </table>
            </div>
        </div>
    </div> 
     
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Submit1" runat="server" OnClick ="Submit1_Click" Text="提交" Width="137px"/>
        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Button3" runat="server" value="重置" style="width:135px" type="Reset"/>
     
    </form>
</body>
</html>
