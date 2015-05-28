<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacher.aspx.cs" Inherits="teacher" %>

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
    .auto-style1 {
        width: 217px
    }
    .auto-style2 {
        width: 150px;
    }
    .auto-style3 {
        width: 99px;
    }
    .auto-style4 {
        width: 47px;
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
                     <li class="active" role="presentation"><a href="teacher.aspx" >主页</a></li>
                     <li><a href="teacher2.aspx">学生管理</a></li>
                     <li><a href="teacher3.aspx">添加学生</a></li>
                     <li><a href="teacher4.aspx">发布作业</a></li>
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
<%--            <div class="panel panel-danger">
                <div class="panel-heading">
                    姓名：
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 上传时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 下载该作业</span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成绩：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;批阅时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 评分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button ID="Button4" runat="server" Text="完成" />
                    </span></div>--%>
                <!--<div class="panel-body">
                    本次作业应交30人，实际25人
                </div>
                 -->
                <!--Table-->
<%--                <table class="table" border="1" style="border-color: #DDD;">
                  <asp:Label runat ="server" ID ="Label2"></asp:Label>--%>
                   <%-- <tr>
                        <th class="auto-style2">李红</th>
                        <th class="auto-style1">&nbsp;2014年1月2日12：56:53</th>
                        <th class="auto-style3">下载</th>
                        <th class="auto-style4">77</th>
                        <th>2014年1月2日12：56:53</th>
                        <th>
                            <asp:TextBox ID="TextBox1" runat="server" Width="46px"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="提交" />
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">张小三</th>
                        <th class="auto-style1">2014年1月2日12：56:53</th>
                        <th class="auto-style3">下载</th>
                        <th class="auto-style4">57</th>
                        <th>2014年1月2日12：56:53</th>
                        <th>
                            <asp:TextBox ID="TextBox2" runat="server" Width="46px"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" Text="提交" />
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">李小四</th >
                        <th class="auto-style1">2014年1月2日12：56:53</th>
                        <th class="auto-style3">下载</th>
                        <th class="auto-style4">96</th>
                        <th>2014年1月2日12：56:53</th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server" Width="46px"></asp:TextBox>
                            <asp:Button ID="Button3" runat="server" Text="提交" />
                        </th>
                    </tr>--%>
        <%--        </table>--%>
          <%--  </div>--%>
        </div>
    </div> 
    




    <div style ="margin-left :90px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1170px" Font-Size="20px">
            <FooterStyle BackColor ="#5D7B9D" Font-Bold ="true" ForeColor ="White" />
            <RowStyle BackColor ="#F7F6F3" ForeColor ="#333333" />
             <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="学号" />
                <asp:BoundField DataField="Grade" HeaderText="成绩"/>
                <asp:BoundField DataField="Name" HeaderText="姓名" />
                <asp:BoundField DataField="Class" HeaderText="班级"/>
                
                <asp:TemplateField HeaderText ="评分">
                  <ItemTemplate >
                     <%-- <asp:TextBox runat ="server" ID ="TextBox5"></asp:TextBox>--%>
                      <asp:Panel ID="Panel1"  runat="server"> 
                      <asp:TextBox ID="TextBox6" runat="server" /> 
                      <asp:Button ID="Button1" UseSubmitBehavior="false"  runat="server" Text="提交" OnClick="Button1_Click" CommandArgument ='<%# Eval("Id") %>'/> 
                      <asp:Button Id ="Button2" runat ="server" Text ="下载" OnClick ="Button2_Click" CommandArgument ='<%# Eval("Id") %>'></asp:Button>
                      <%--<asp:LinkButton ID="Button1" runat="server" Text="提交" CommandName="EditOrder" CommandArgument='<%# Eval("Id") %>'OnClick="Button1_Click" />--%>
                     </asp:Panel> 
                  </ItemTemplate>

                </asp:TemplateField>         
                       
<%--                 <asp:TemplateField HeaderText ="提交">
                  <ItemTemplate >
                      <asp:Button runat ="server" id="Button1" Text ="提交" OnClick ="Button1_Click"/>
                      <asp:Label runat ="server" ID ="Label11"></asp:Label>
                  </ItemTemplate>
                </asp:TemplateField>--%>
<%--                <asp:TemplateField HeaderText ="删除" ShowHeader ="false" >
                    <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="returnconfirm('确定要删除吗？')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>--%>
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
        <br /> 
        <br /> 
<%--        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> --%>
<%--     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HomeworkConnectionString %>" SelectCommand="SELECT [Id], [Grade], [Name], [Class] FROM [Students]"></asp:SqlDataSource>--%>
     </div>


    </form>
</body>
</html>
