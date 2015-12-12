<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${context}/res/css/style/teacherMain.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="res/js/getDate.js"></script>
    <title>教师主界面</title>
</head>
<body >
<div id="header">
    <%@ include file="teacherTop.jsp"%>
    <div id="time">
        <script type="text/javascript">
            window.onload=getdates();
        </script>
    </div>
    <div id="tabel">此处显示教务处信息</div>
    <br/>
    <c:if test="${empty errorMsg1}"><br/></c:if>
    <c:if test="${!empty errorMsg1}">
        <div style="text-align:center;margin:0 auto;color:red">${errorMsg1}</div>
    </c:if>
    <br/>
    <br/>
    <div style="width:15%;text-align:center;margin:0 auto">
        <div align="left" style="float:left">
            <form action="${context}/teacher/doCourse.html" method="post">
                <input type="submit" value="开 始 报 课"/>&nbsp;&nbsp;</form></div>
        <div align="right">
            <form action="${context}/teacher/result.html" method="post">
                <input type="submit" value="查 看 结 果"/></form></div>
    </div>
</div>
</body>
</html>