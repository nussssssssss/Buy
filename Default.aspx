<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎来到羊咩咩作业系统</title>
    <script src="js/jquery-1.8.0.min.js" type="text/javascript" ></script>
<link rel="stylesheet" type="text/css" href="css/register.css"/>
    <style >
        body {
    font: 12px "microsoft yahei";
    color: #FFF;
}
    </style>
</head>
<body>
    <div class="container-fluid" style="position:absolute;top:0 "> `
        <video src="images/city.ogv" autoplay="autoplay" loop ="loop"></video>
    
   </div>
    <form id="form1" runat="server">
<div class='signup_container' style="position:absolute;top:0 ;right:0;background-color:rgba(200,200,200,0.5);">
    <h1 class='signup_title'>羊咩咩作业系统</h1>
    <img src='images/people.png' id='admin'/>
    <div id="signup_forms" class="signup_forms clearfix">
            <div class="signup_form_form" id="signup_form"   data-secure-action="#" data-secure-ajax-action="">
                    <div class="form_row first_row">
                        <!--<label for="signup_email">请输入用户名</label>-->
<%--                        <input type="text" placeholder="请输入用户名" id="Text1" name="Text1" runat="server"/>--%>
                        <asp:textbox runat="server" id ="Text1" AutoPostBack ="true" OnTextChanged ="Text1_TextChanged"></asp:textbox>
                        
                    </div>
                    <div class="form_row">
                        <!--<label for="signup_password">请输入密码</label>-->
<%--                        <input type="password" placeholder="请输入密码" id="text2" name="text2" runat="server"/>--%>
                    <asp:textbox runat="server" id ="Text2" textmode="Password"></asp:textbox>
       <%--             <div style ="display:none " id ="test1"><asp:textbox runat="server" id ="Text2" ></asp:textbox></div>--%>
                    </div>
                    <div class="form_row">
                           <!--   <input type="text" name="user[password]" placeholder="" id="signup_select" value='' data-required="required"> -->
                          <!--  <img src='images/d.png' id='d'/> -->
                            <asp:DropDownList ID="drop1" runat="server">
                                <asp:ListItem>教师</asp:ListItem>
                                <asp:ListItem>学生</asp:ListItem>
                                <asp:ListItem>管理员</asp:ListItem>
                            </asp:DropDownList>
                    </div>
           </div>
    </div>

    <div class="login-btn-set"><%--<div class='rem'>记住我</div>--%>
    <asp:CheckBox ID ="baocunmima" runat ="server" Text ="记住密码" />
    <input type="submit" id="Submit1" runat="server" onserverclick="Submit1_ServerClick" class='login-btn' value=" " />
    <span id="ShowInfo" runat="server" style ="color:black"></span><br/>

    <p class='copyright' style="padding-top:30px;position :relative">版权所有 HNU</p>
        <asp:Label ID="lblResult" runat="server"></asp:Label>
</div>
    </div>
<!-- 判断密码框是否在输入，输入则转换为暗码-->
<script type ="text/javascript" >
    function a() {

        document.getElementById("test2").style.display = "none";
        document.getElementById("test1").style.display = "normal";
        document.getElementById("Text2").focus();
    }



</script>
<script type="text/javascript">

    $(function () {

        $('.rem').click(function () {
            $(this).toggleClass('selected');
        })

        $('#signup_select').click(function () {
            $('.form_row ul').show();
            event.cancelBubble = true;
        })

        $('#d').click(function () {
            $('.form_row ul').toggle();
            event.cancelBubble = true;
        })

        $('body').click(function () {
            $('.form_row ul').hide();
        })

        $('.form_row li').click(function () {
            var v = $(this).text();
            $('#signup_select').val(v);
            $('.form_row ul').hide();
        })


    })


</script>
    </form>
</body>
</html>
