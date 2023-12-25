<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>重置密码</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/reg.css"/>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/calendar.js"></script>
    <script src="js/function.js"></script>
    
    <style>
    	.reg p .error {
    		display:inline-block;
    		border:1px solid #ff855a;
    		background-color:#ffe8e0;
    		height:25px;
    		line-height:25px;
    		padding:0px 20px;
    		margin-left:20px;
    	}
    </style>
</head>
<body><!-------------------reg-------------------------->
<div class="reg">
    <form action="resetPassword" method="post" onsubmit="return checkForm(this)">
     <h1 style="padding:0px;magin:0px;font-size:30px;background:#3344AA;text-align:center;line-height:60px;color:#FFFFFF">重置密码</h1>
        <p>密码：<input type="text" name="passWord" value="" onfocus="FocusItem(this)" onblur="CheckItem(this)" placeholder="请输入密码"><span></span></p>
        <p>确认密码：<input type="text" name="rePassWord" value="" onfocus="FocusItem(this)" onblur="CheckItem(this)" placeholder="请输确认密码"><span></span></p>
        <p><input type="submit" name="" value="确定"></p>
        <p class="txt"><a href="manage/admin_login.jsp"><span></span>返回登录</a></p>
        <!--<a href="#" class="off"><img src="img/temp/off.png"></a>--></form>
</div>
</body>
</html>