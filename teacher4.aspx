﻿ <%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacher4.aspx.cs" Inherits="teacher4" %>

<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml">
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
    margin: 28px 0px 0px 0px;
    color: inherit;
}
    .auto-style1 {  
     width: 622px;

    }
 .auto-style2 {
height: 69px;
 }
 .auto-style3 {
width: 622px;
height: 69px;
 }
 button, input, optgroup, select, textarea {
    margin: 0px 0px 0px;
    color: inherit;
}
</style>
    <%--    
     <style>
        * {padding:0;margin:0;font-size:12px;}
        .fl {float:left}
        .fr {float:right}
        .dn {display:none}
        /*日历 begin*/
.data_box           {width:260px; }
.showDate           {width:248px;height:30px;line-height:30px;padding:0 5px;border:1px solid #e1e1e1;color:#999;display:block;cursor:pointer}
.show_mn            {text-align:center;padding:0 20px;}
.sel_date           {margin-top:10px;border:1px solid #999;padding:3px}
.data_table         {width:100%;margin-top:10px;}
.data_table td      {text-align:center;cursor:pointer;height:24px;font-size:14px;}
.data_table td.active      {color:#fff;background-color:#999}
.data_table td.hover{color:blue;}
.showDate2          {width:35px;padding:3px 5px;color:#999;border:1px solid #e1e1e1;text-align:center}
.showDate2.active   {border:1px solid #c50000; }
.prev_m,.next_m     {width:10px;height:22px;display:block;background-color:#0094ff;color:#fff;cursor:pointer;text-align:center;font: bold 12px/22px "宋体"}
.prev_y,.next_y     {width:18px;height:22px;display:block;background-color:#0094ff;color:#fff;cursor:pointer;text-align:center;font: bold 12px/22px "宋体";margin:0 5px;}
/*日历 end*/
    </style>
<script src="js/base.js" type="text/javascript"></script>
    <script>
        LiChang = {
            getByClass: function (oPare, cla) {
                var oChild = oPare.getElementsByTagName("*");
                var arr = [];
                for (var i = 0; i < oChild.length; i++) {
                    var arrCla = oChild[i].className.split(" ");
                    var j;
                    for (var j in arrCla) {
                        if (arrCla[j] == cla) {
                            arr.push(oChild[i]);
                            break;
                        }
                    }
                }
                return arr;
            }
        }
        function showDate(option) {
            this.obj = document.getElementById(option.id);
        }
        showDate.prototype.init = function () {
            var _self = this;
            _self.dateText = LiChang.getByClass(_self.obj, "showDate")[0];
            _self.dateBox = LiChang.getByClass(_self.obj, "sel_date")[0];
            _self.yearBox = LiChang.getByClass(_self.obj, "year")[0];
            _self.mnBox = LiChang.getByClass(_self.obj, "month")[0];
            _self.dataTable = LiChang.getByClass(_self.dateBox, "data_table")[0];
            _self.tbody = _self.dataTable.tBodies[0];
            _self.td = _self.tbody.getElementsByTagName("td");
            _self.prevM = LiChang.getByClass(_self.dateBox, "prev_m")[0];
            _self.nextM = LiChang.getByClass(_self.dateBox, "next_m")[0];
            _self.prevY = LiChang.getByClass(_self.dateBox, "prev_y")[0];
            _self.nextY = LiChang.getByClass(_self.dateBox, "next_y")[0];
            //显示日历
            _self.dateText.onclick = function () {
                _self.changeDefault(this);
                _self.show();
                //_self.showNow();
                //_self.dateText.blur();
            }
            //点击空白 隐藏日历
            document.onclick = function (event) {
                event = event || window.event;
                var Target = event.target || event.srcElement;
                _self.hide(event, Target, this);
            }
            //点击选择日期
            for (var i = 0; i < _self.td.length; i++) {
                _self.td[i].onclick = function () {
                    var newDd = this.innerHTML;
                    var newYear = parseInt(_self.yearBox.value, 10);
                    var newMn = parseInt(_self.mnBox.value, 10);
                    if (newDd.match(/^\s{0}$/g)) {  //如果td有值;
                        return false;
                    }
                    if (isNaN(newYear) || isNaN(newMn) || newYear < 1900 || newYear > 2099 || newMn < 1 || newMn > 12) {  //如果td有值;
                        //alert("请填写正确的年和月！");
                        return false;
                    }
                    _self.dateText.innerHTML = newYear + "年" + newMn + "月" + newDd + "日";
                    _self.dateBox.className += " ";
                    _self.dateBox.className += "dn";
                }
                _self.td[i].onmouseover = function () {
                    if (this.className.indexOf("hove") == -1) {
                        this.className += " hover";
                    }
                }
                _self.td[i].onmouseout = function () {
                    this.className = this.className.replace("hover", "")
                }
            }
            //点击切换月份
            _self.prevM.onclick = _self.nextM.onclick = function () {
                _self.changeMn(this);
                return this;
            }
            //点击切换年份
            _self.prevY.onclick = _self.nextY.onclick = function () {
                _self.changeYr(this);
                return this;
            }
            _self.yearBox.onkeyup = _self.mnBox.onkeyup = function () {
                this.value = this.value.replace(/\D/g, "");
                var year = parseInt(_self.yearBox.value, 10);
                var month = parseInt(_self.mnBox.value, 10);
                if (!isNaN(year) && year <= 2099 && year >= 1900 && !isNaN(month) && month <= 12 && month >= 1) {
                    _self.showAllDay(year, month - 1);
                }
                if (this == _self.yearBox && year >= 1900 && year <= 2099) {
                    _self.mnBox.focus();
                } else if (this == _self.mnBox && (month < 1 || month > 12)) {
                    if (this.value.slice(0, 1) > 1) { //如果第一位大于1
                        this.value = this.value.slice(0, 1);
                    } else if (month > 12) { //
                        this.value = 12;
                    }
                    year = parseInt(_self.yearBox.value, 10);
                    month = parseInt(_self.mnBox.value, 10);
                    _self.showAllDay(year, month - 1);
                }
            }
            _self.yearBox.onblur = function () {
                var year = parseInt(this.value, 10);
                if (year < 1900 || year > 2099 || isNaN(year)) {
                    this.focus();
                    alert("请输入正确年份！");
                    this.value = "";
                }
            }
            _self.mnBox.onfocus = function () {
                var year = parseInt(_self.yearBox.value, 10);
                if (isNaN(year)) {
                    _self.yearBox.focus();
                }
            }
            _self.mnBox.onblur = function () {
                var month = parseInt(this.value, 10);
                var year = parseInt(_self.yearBox.value, 10);
                if (month < 1 || month > 12 || isNaN(month)) {
                    alert("请输入正确月份！");
                    this.value = "";
                }
            }
        }
        //点击切换月份
        showDate.prototype.changeMn = function (obj) {
            var _self = this;
            var NewMn = parseInt(_self.mnBox.value, 10);
            var newYear = parseInt(_self.yearBox.value, 10);
            if (isNaN(NewMn) || isNaN(newYear)) {
                alert("请填写正确的年和月！");
                return false;
            }
            if (obj == _self.nextM) {
                NewMn++;
            } else {
                NewMn--;
            }
            if (NewMn < 1) {
                NewMn = 12;
                newYear -= 1;
            } else if (NewMn > 12) {
                NewMn = 1;
                newYear += 1;
            }
            _self.mnBox.value = NewMn;
            _self.showNow(newYear, NewMn);
        }
        //点击切换年份
        showDate.prototype.changeYr = function (obj) {
            var _self = this;
            var NewMn = parseInt(_self.mnBox.value, 10);
            var newYear = parseInt(_self.yearBox.value, 10);
            if (isNaN(NewMn) || isNaN(newYear)) {
                alert("请填写正确的年和月！");
                return false;
            }
            if (obj == _self.nextY) {
                newYear++;
            } else {
                newYear--;
            }
            if (newYear < 1900) {
                newYear = 1900;
            } else if (newYear > 2099) {
                newYear = 2099;
            }
            _self.mnBox.value = NewMn;
            _self.showNow(newYear, NewMn);
        }
        //文本框 清空初始值
        showDate.prototype.changeDefault = function (obj) {
            var _self = this;
            var deVal = obj.innerHTML;
            var regExp = /^\s{0,}$/g;
            if (deVal == "点击选择日期") {
                obj.innerHTML = "";
                _self.showNow();
            } else if (deVal.match(regExp) === null && _self.dateBox.className.indexOf("dn") != -1) { //如果显示的是非空字符
                var dayArr = deVal.match(/[0-9]{1,4}/g);
                _self.showNow(dayArr[0], dayArr[1], dayArr[2]); //刷新日期
            }
        }
        //文本框 还原初始值
        showDate.prototype.changeDefault2 = function (obj) {
            var _self = this;
            var deVal = obj.innerHTML;
            if (deVal.match(/^\s{0}$/)) {
                obj.innerHTML = "点击选择日期";
            }
        }
        //显示日历
        showDate.prototype.show = function () {
            var _self = this;
            if (_self.dateBox.className.indexOf("dn") != -1) {
                var cls = _self.dateBox.className;
                _self.dateBox.className = cls.replace("dn", "");
            }
        }
        //隐藏日历
        showDate.prototype.hide = function (event, Target, obj) {
            var _self = this;
            var oPare = Target.parentNode;
            var isChild = true; //默认是子元素
            if (oPare == obj || Target == obj) {
                isChild = false;
            } else {
                loop: while (oPare != _self.obj) {
                    oPare = oPare.parentNode;
                    if (oPare == obj) {
                        isChild = false;
                        break loop;
                    }
                }
            }
            if (!isChild && _self.dateBox.className.indexOf("dn") == -1) {
                _self.dateBox.className += " ";
                _self.dateBox.className += "dn";
                _self.changeDefault2(_self.dateText);
            }
        }
        //填充年、月
        showDate.prototype.showNow = function (yr, mn, date) {
            var _self = this;
            var now = new Date();
            var year = yr || now.getFullYear();
            var month = mn - 1 || now.getMonth();
            var dd = date || now.getDate();
            //填充 年 和 月
            _self.yearBox.value = year;
            _self.mnBox.value = mn || now.getMonth() + 1;
            //填充日期
            _self.showAllDay(year, month, dd);
        }
        //填充当月的所有日期
        showDate.prototype.showAllDay = function (Yr, Mn, Dd) {
            var _self = this;
            var arr31 = [1, 3, 5, 7, 8, 10, 12];
            var is31 = true;
            var newDd = new Date();  //根据传入的数值生成新的日期
            Dd = Dd ? Dd : newDd.getDate();
            newDd.setFullYear(Yr, Mn, Dd);
            var year = newDd.getFullYear(),
                month = newDd.getMonth(),
                dd = newDd.getDate();
            var firstD = new Date();
            firstD.setFullYear(year, month, 1);
            var firstDay = firstD.getDay();
            var str31 = arr31.join(",");
            var regExp = eval("/" + (month + 1) + ",|," + (month + 1) + ",|," + (month + 1) + "/g");
            var dayLen = 31;
            //判断每个月有多少天
            if (str31.search(regExp) == -1) {
                dayLen = 30;
            }
            //清空日期
            for (var i = 0; i < _self.td.length; i++) {
                _self.td[i].innerHTML = "";
                _self.td[i].className = _self.td[i].className.replace("active", "");
            }
            //如果有31天
            for (var j = 0; j < dayLen; j++) {
                _self.td[j + firstDay].innerHTML = j + 1;
                if (j + 1 == dd && _self.td[j + firstDay].className.indexOf("active") == -1) {
                    _self.td[j + firstDay].className += " ";
                    _self.td[j + firstDay].className += "active";
                }
            }
        }
        //函数调用
        window.onload = function () {
            var showDate1 = new showDate({ id: "data_box" });
            showDate1.init();
        }
    </script>--%>


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
                     <li><a href="teacher3.aspx">添加学生</a></li>
                     <li class="active" role="presentation"><a href="teacher4.aspx">发布作业</a></li>
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
                    布置作业：
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;说明
                </div>
                <!--<div class="panel-body">
                    本次作业应交30人，实际25人
                </div>
                 -->
                <!--Table-->
                <table class="table" border="1" style="border-color: #DDD;">
                   <tr>
                        <th>作业编号：</th>
                        <th class="auto-style1">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </th>
                        <th>如：1、2、3....</th>

                        
                    </tr>
                    <tr>
                        <th>作业名称：</th>
                        <th class="auto-style1">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </th>
                        <th>如：网络课程设计</th>

                        
                    </tr>
                    <tr>
                        <th class="auto-style2">面向对象</th >
                        <th class="auto-style3">
                            <asp:DropDownList ID="drop2" runat="server">
                                <asp:ListItem>软件一班</asp:ListItem>
                                <asp:ListItem>软件四班</asp:ListItem>
                                <asp:ListItem>软件五班</asp:ListItem>
                            </asp:DropDownList>
                        </th>
                        <th class="auto-style2"></th>
                    </tr>
                    <tr>
                        <th>内容：</th>
                        <th class="auto-style1">
                            <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" Height="82px" Width="342px"></asp:TextBox>
                        </th> 
                       

                    </tr>
                    
                    <tr>
                        <th>截止日期</th >

                        <th class="auto-style1">
        <%--                    <asp:Label ID ="label5" runat ="server" ></asp:Label>--%>
                       <asp:Calendar ID="Calendar1" runat="server"   ShowNextPrevMonth ="true" NextMonthText="Next" SelectedDayStyle-BackColor="#DBDBDB" SelectionMode="DayWeekMonth" ShowGridLines ="true" ></asp:Calendar>
                        </th>
                        <th>请输入作业提交截止时间</th>
                    </tr>
                    <tr>
                        <th>备注</th >
                        <th class="auto-style1">
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </th>
                        <th>可不填写</th>
                    </tr>
                </table>
            </div>
        </div>
    </div> 
     
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:Button runat ="server" ID ="Button1" OnClick ="Button1_Click" Width="137px" Text ="提交" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Button3" runat="server" value="重置" style="width:135px" type="Reset"/>
     
    </form>
    </body> 
</html>