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
    <style type="text/css">
        #header{width: 100%;}/*设置满屏宽度*/
        /*设置顶部栏效果*/
        #info{height: 30px;background-color:#CCC;text-align:right;padding-top:5px;}
        #info a:hover{color:#FFF;}
        #nav-search{padding:5px 0 0 0;height: 30px;background-color:#9CF;}
        #nav{height: 30px;background-color:#9CF;float: left;}
        /*设置字体样式*/
        #nav a{font-size:14px;display:block; float:left; margin-left:20px; margin-top:6px;color:#fff;letter-spacing:0.2em;
            text-align:center;text-decoration:none;}
        #nav a:hover{color:#d00;
            background:#fff;}
        /*搜索框*/
        #search{height: 30px;background-color:#9CF;float: right;}
        /*系统名称效果*/
        #logo{padding: 10px 0 0 0; text-align: center; height: 50px;background-color:#69C;font-size: 40px;font-family:"隶书";color:#FFC;}
        /*系名称栏设置*/
        #major{width:15%;height:400px;padding:25px 0 0 0;text-align:center;background-color:#EAEAEA;float:left;margin: auto;border: 1px         solid #cccccc;}
        #major a{font-size:16px;}
        #major a:hover{color:#F06;}
        /*设置按钮安放位置*/
        #button1{width:40%;height:50px;padding:10px 0 0 50px;text-align:left;float:left;margin:auto;}
        #button2{width:60%;height:50px;padding:10px 0 0 50px;text-align:left;float:left;margin:auto;border-top:2px solid #9FF;}
        #button2 input{margin-left:50px;}
        #button2 a{margin-left:50px;}
        /*表格位置*/
        #tabel{width:70%;min-height:400px;margin:auto;float:left;border:2px solid #999;}
        #button{width:100%;height:50px;padding:10px 0 0 0;margin:auto;text-align:center;float:left;}
        #button input{margin-left:30px;}
    </style>
    <title>教学办之历史记录</title>
</head>
<body>
<div id="header">
    <%@ include file="yardTop.jsp"%>
    <div id="major">
        <a href="#">计算机科学与技术</a><br/><br/>
        <a href="#">数          学</a><br/><br/>
        <a href="#">信  息  安   全</a><br/><br/>
        <a href="#">软  件  工   程</a><br/><br/>
        <a href="#">计 算 机 实 验 班</a><br/><br/>
        <a href="#">数 学  实 验 班 </a><br/><br/>
        <a href="#">数 理  综 合 班</a><br/><br/>
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