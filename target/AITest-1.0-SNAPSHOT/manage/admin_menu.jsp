<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>aitest</title>
<%--    <link rel="stylesheet" type="text/css" href="css/common.css"/>--%>
<%--    <link rel="stylesheet" type="text/css" href="css/main.css"/>--%>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="../manage/admin_index.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="../manage/admin_index.jsp">首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>用户:${name}</li>
                <li><a href="../manage/admin_touserupdate">修改资料</a></li>
                <li><a href="../manage/admin_adminlogout">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <ul class="sub-menu">
                        <li><a href="../manage/admin_zwadd.jsp"><i class="icon-font">&#xe008;</i>新建会话</a></li>
                        <li><a href="../manage/sessionLog"><i class="icon-font">&#xe006;</i>会话查询</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>
    </div>
 </div>