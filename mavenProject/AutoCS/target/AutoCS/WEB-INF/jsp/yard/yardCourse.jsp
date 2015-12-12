<%@ page import="java.util.Calendar" %>
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
    <link href="${context}/res/css/style/yardCourse.css" rel="stylesheet" type="text/css"/>
    <title>教学办之报课管理</title>
</head>
<body>
<div id="header">
    <%@ include file="yardTop.jsp"%>



    <div  style="margin-left:30.5%;">
        <input type="submit" value="查看报课" style="background:#9CF;border-top-left-radius: 10px;border-top-right-radius: 10px;                                 border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;" value="开始报课"/>
    </div>




    <br/>
    <div>
        <form action="${context}/yard/course/start.html" method="post" enctype="multipart/form-data">





            <div id="major">
                <a>计算机实验班</a><br/><input type="file" name="files"/><br/><br/>
                <a>计算机卓越班</a><br/><input type="file" name="files"/><br/><br/>
                <a>计算机科学与技术</a><br/><input type="file" name="files"/><br/><br/>
                <a>软件工程</a><br/><input type="file" name="files"/><br/><br/>
                <a>数学实验班</a><br/><input type="file" name="files"/><br/><br/>
                <a>数学</a><br/><input type="file" name="files"/><br/><br/>
                <a>网络工程</a><br/><input type="file" name="files"/><br/><br/>
                <a>信息安全</a><br/><input type="file" name="files"/>
            </div>




            <div id="button1">



                <div style="margin-left:7%;">
                    <input type="submit" style="background:#9CF;border-top-left-radius: 10px;border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;" value="开始报课"/>
                </div>




                <br/>
                <c:if test="${empty errorMsg1}"><br/></c:if>
                <c:if test="${!empty errorMsg1}">
                    <div style="color:red">${errorMsg1}</div>
                </c:if>
                <label>选择学期：<select name="semester">
                    <option value="0" selected="selected" >选择</option>
                    <option value="<%=Calendar.getInstance().get(Calendar.YEAR)%>01" id="1"><%=Calendar.getInstance().get(Calendar.YEAR)%>01</option>
                    <option value="<%=Calendar.getInstance().get(Calendar.YEAR)%>02" id="2"><%=Calendar.getInstance().get(Calendar.YEAR)%>02</option>
                </select></label>
            </div>
            <br>
            <%--<div id=sth>--%>
                <%--<a> <img src="http://t04.pic.sogou.com/02180dee779e8a8c-c6d81a1366188f77-b687d8000eb0132f4db7ec0ce3773c39.jpg" width="70" height="70"/>开始/截止报课设置</a>--%>
            <%--</div>--%>
            <br><br><br><br><br>
            <div id=time>
                <c:if test="${empty errorMsg2}"><br/></c:if>
                <c:if test="${!empty errorMsg2}">
                    <div style="color:red">${errorMsg2}</div>
                </c:if>
                <label>开始报课：<input name="beginCourse" type="date"/></label><br/><br/>
                <label>截止报课：<input name="endCourse" type="date"/></label><br/><br/>
                <input style="background:#CFF;border-top-left-radius: 10px;border-top-right-radius: 10px;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;" type="reset" value="重置"/>
            </div>
        </form>
    </div>
</div>
<!--
    <div id=time1>
        <img src="http://t03.pic.sogou.com/02180dee779e8a8c-9a2dfd51a14e3358-3bc24e914a3291e6ecba8a76c5e5bac1.jpg"/>
    </div>
    -->
</body>
</html>
