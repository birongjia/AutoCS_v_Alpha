<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String context = request.getContextPath();
    request.setAttribute("context",context);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="res/css/main.css" rel="stylesheet" type="text/css"/>
    <%--<style type="text/css">--%>
        <%--#header{width: 100%;}/*设置满屏宽度*/--%>
        <%--/*设置顶部栏效果*/--%>
        <%--#info{height: 30px;background-color:#CCC;text-align:right;padding-top:5px;}--%>
        <%--#info a:hover{color:#FFF;}--%>
        <%--#nav-search{padding:5px 0 0 0;height: 30px;background-color:#9CF;}--%>
        <%--#nav{height: 30px;background-color:#9CF;float: left;}--%>
        <%--/*设置字体样式*/--%>
        <%--#nav a{font-size:14px;display:block; float:left; margin-left:20px; margin-top:6px;color:#fff;letter-spacing:0.2em;--%>
            <%--text-align:center;text-decoration:none;}--%>
        <%--#nav a:hover{color:#d00;--%>
            <%--background:#fff;}--%>
        <%--/*搜索框*/--%>
        <%--#search{height: 30px;background-color:#9CF;float: right;}--%>
        <%--/*系统名称效果*/--%>
        <%--#logo{width:100%;padding: 10px 0 0 0; text-align: center; height: 50px;background-color:#69C;font-size: 40px;font-family:"隶书";color:#FFC;}--%>
        <%--#go{width:30%;margin:auto;text-align:center;height:300px;float:right;border:2px solid #3FF;padding:100px 0 0 0;}--%>
        <%--#type1{width:100%;height:50px;text-align:center;margin:auto;padding:20px 0 0 20px;}--%>
        <%--#type2{width:100%;height:50px;text-align:center;margin:auto;padding:10px 0 0 20px;}--%>
        <%--#type3{width:100%;height:50px;text-align:center;margin:auto;padding:20px 0 0 0;}--%>
        <%--#type3 input{margin-left:30px;}--%>
    <%--</style>--%>
    <title>自动排课系统</title>
</head>
<body>
<div id="header">
    <div id="search">

    </div>
    <div id="logo">
        福州大学数计学院自动排课系统
    </div>
    <div id=go>
        <c:if test="${empty errorMsg}"><br/></c:if>
        <c:if test="${!empty errorMsg}">
            <div style="color:red">${errorMsg}</div>
        </c:if>
        <form action="${context}/login.html" method="post">
            <div id=type1><label>用户名：<input type="text" name="userName"></label></div>
            <div id=type2><label>密　码：<input type="password" name="password"></label></div>
            <label><input id="userType1" name="userType" type="radio" value="1" checked="checked"/>教学办</label>&nbsp
            <label><input id="userType2" name="userType" type="radio" value="2"/>系负责人</label>&nbsp
            <label><input id="userType3" name="userType" type="radio" value="3"/>教师</label>
            <div id=type3><input type="submit" value="登  录"><input type="reset" value="重  置"></div>
        </form>
    </div>
</div>
</body>
</html>