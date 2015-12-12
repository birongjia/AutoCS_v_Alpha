<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${context}/res/css/style/yardHistory.css" rel="stylesheet" type="text/css"/>
    <title>教学办之历史记录</title>
</head>
<body>
<div id="header">
    <%@ include file="yardTop.jsp"%>
    <div id="major">
        <a href="#">计 算 机 科 学 与 技 术</a><br/><br/>
        <a href="#">数 学</a><br/><br/>
        <a href="#">信 息 安 全</a><br/><br/>
        <a href="#">软 件 工 程</a><br/><br/>
        <a href="#">计 算 机 实 验 班</a><br/><br/>
        <a href="#">数 学 实 验 班</a><br/><br/>
        <a href="#">数 理 综 合 班</a><br/><br/>
    </div>
    <div id=button1>
        <input type="submit" name="button" value="显示最新记录"/>
    </div>
    <div id=button2>
        <a>学 年：<select name="year">
            <option value="s" selected="selected">选择
            </option>
            <option value="2015" id="2015">2015</option>
            <option value="2016" id="2016">2016</option>
            <option value="2017" id="2017">2017</option>
            <option value="2018" id="2018">2018</option>
            <option value="2019" id="2019">2019</option>
            <option value="2020" id="2020">2020</option>
            <option value="2021" id="2021">2021</option>
        </select></a>
        <a>学 期：<select name="year">
            <option value="s" selected="selected">选择
            </option>
            <option value="01" id="01">01</option>
            <option value="02" id="02">02</option>
        </select></a>
        <input type="submit" value="查 询"/>
    </div>
    <div id=tabel>未找到信息</div>
    <div id=button>
        <input type="submit" value="下一页">
        <input type="submit" value="返回"/>
    </div>
</div>
</body>
</html>