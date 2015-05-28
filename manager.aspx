<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script src="dist/js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="dist/css/bootstrap.min.css" /> 
<script src="dist/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>74°作业系统</title>
<link rel="stylesheet" href="css/layout.css" />
<style >
 .container .row.f .panel-danger .table tr th {
    border-color:#DDD;
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
                     <li class="active" role="presentation"><a href="manager.aspx" >主页</a></li>
                     <li><a href="manager2.aspx">添加用户</a></li>
                </ul>

                </nav>
        </div>
        <div class="row c">
            <div class="d">
                <p><asp:Label runat ="server" ID="N"></asp:Label>，欢迎来到羊咩咩作业系统。</p>
                <script type="text/javascript">

                    var today = new Date();

                    var s = today.getFullYear() + "年" + today.getMonth() + "月" + today.getDate() + "日" + today.getHours() + "时" + today.getMinutes() + "分" + today.getSeconds() + "秒" + "\t星期" + today.getDay();

                    document.write("现在是：" + s);

                </script>
            </div> 
    
      
        
        </div>    

        <div class="row f">
            <%--<div class="panel panel-danger">
                <div class="panel-heading">
                    姓名：
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>权限：
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    用户名：
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    操作
                </div>
                <!--<div class="panel-body">
                    本次作业应交30人，实际25人
                </div>
                 -->
                <!--Table-->
                <table class="table" border="1" style="border-color: #DDD;">
                    <tr>
                        <th>李红</th>
                        <th>教师</th>
                        <th>ss789456</th>
                        <th>修改 删除</th>
                        
                    </tr>
                    <tr>
                        <th>张小三</th>
                        <th>学生</th>
                        <th>cn8521147</th>
                        <th>修改 删除</th>
                    </tr>
                    <tr>
                        <th>李小四</th >
                        <th>学生</th>
                        <th>软ksn963852</th>
                        <th>修改 删除</th>
                    </tr>
                </table>
            </div>
               <div>--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1170px" Font-Size="20px" OnRowCancelingEdit ="GridView1_RowCancelingEdit" OnRowDeleting ="GridView1_RowDeleting" OnRowEditing ="GridView1_RowEditing" OnRowUpdating ="GridView1_RowUpdating" >
            <FooterStyle BackColor ="#5D7B9D" Font-Bold ="true" ForeColor ="White" />
            <RowStyle BackColor ="#F7F6F3" ForeColor ="#333333" />
             <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:BoundField DataField="Name" HeaderText="姓名"/>
                <asp:BoundField DataField="UserName" HeaderText="用户名" />
                <asp:BoundField DataField="UserPassWord" HeaderText="密码"/>
                <asp:BoundField DataField="Iden" HeaderText="身份"/>
                <asp:CommandField HeaderText ="编辑" ShowEditButton ="true" />
                <asp:CommandField HeaderText ="选择" ShowSelectButton ="true" />
                <asp:TemplateField HeaderText ="删除" ShowHeader ="false" >
                    <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="returnconfirm('确定要删除吗？')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
<%--            <PagerStyle BackColor ="#284775" ForeColor ="White" HorizontalAlign ="Center" />
            <SelectedRowStyle BackColor ="#E2DED6" Font-Bold ="true" ForeColor ="#333333" />--%>

            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        
<%--     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HomeworkConnectionString %>" SelectCommand="SELECT [Id], [Grade], [Name], [Class] FROM [Students]"></asp:SqlDataSource>--%>
     </div>
        </div>
    
     
    </form>
</body>
</html>
