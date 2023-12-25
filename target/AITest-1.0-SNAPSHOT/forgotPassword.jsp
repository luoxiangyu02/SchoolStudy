<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>忘记密码</title>
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
    <form action="forgotPassword" method="post" onsubmit="return checkForm(this)">
     <h1 style="padding:0px;magin:0px;font-size:30px;background:#3344AA;text-align:center;line-height:60px;color:#FFFFFF">忘记密码</h1>
        <h2>请填写您的注册资料来重置密码</h2>
        <p>用户名：<input type="text" name="login_id" value="" placeholder="请输入用户名"><span></span></p>
         <p>邮箱：<input type="text" name="email" value="" placeholder="请输入邮箱"><span></span></p>
        <p>联系电话：<input type="text" name="tel" value="" placeholder="请输入联系电话"><span></span></p>
<%--        <p>验证码：<input class="code" type="text" name="veryCode" value="" onfocus="FocusItem(this)" onblur="CheckItem(this)" placeholder="验证码">--%>
<%--        <img height="25" src="getcode" alt="看不清，换一张" onclick="change(this)"><span></span></p>--%>
        <p><input type="submit" name="" value="提交"></p>
        <p class="txt"><a href="manage/admin_login.jsp"><span></span>返回登录</a></p>
        <!--<a href="#" class="off"><img src="img/temp/off.png"></a>--></form>
</div>
</body>
</html>