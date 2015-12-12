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
    <link href="${context}/res/css/style/departMain.css" rel="stylesheet" type="text/css"/>
    <title>系负责人之报课管理</title>
</head>

<body>
<div id="header">
    <%@ include file="departTop.jsp"%>
    <div id="time">
        <p>报课截止时间：XXXX年XX月XX日  XX：XX</p>
        <p>审核截止时间：XXXX年XX月XX日  XX：XX</p>
    </div>
    <div id="button"> <input type="submit" name="button" value="提 交 审 核"/></div>
    <div id="tabel">此处显示教务处信息</div>
</div>
</body>
</html>