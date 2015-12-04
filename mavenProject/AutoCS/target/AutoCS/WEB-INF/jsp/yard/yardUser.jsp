<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css">
        #header{width: 100%;}/*设置满屏宽度*/
        /*设置顶部栏效果*/
        #info{height: 30px;background-color:#CCC;text-align:right;padding-top:5px;}
        #nav-search{padding:5px 0 0 0;height: 30px;background-color:#9CF;}
        #nav{height: 30px;background-color:#9CF;float: left;}
        /*设置字体样式*/
        #nav a{font-size:14px;display:block; float:left; margin-left:20px; margin-top:6px;color:#fff;letter-spacing:0.2em;
            text-align:center;text-decoration:none;}
        /*搜索框*/
        #search{height: 30px;background-color:#9CF;float: right;}
        /*系统名称效果*/
        #logo{padding: 10px 0 0 0; text-align: center; height: 50px;background-color:#69C;font-size: 40px;font-family:"隶书";color:#FFC;}
        /*输入框，搜索按钮部分*/
        #write{margin-top: 10px;padding-left:100px;}
        #write2{margin-top:30px;padding-left:100px;padding-top:20px;border-top:2px solid #C9F;}

        /*表格位置设置*/
        #main{width: 80%;margin-left:10%;}
        #float-box{position: relative; width: 800px; min-height: 300px; margin: auto;border: 2px solid #cccccc;}
    </style>
</head>
<body>
<div id="header">
    <%@ include file="yardTop.jsp"%>
    <div id="write">
        <c:if test="${empty errorMsg1}"><br/></c:if>
        <c:if test="${!empty errorMsg1}">
            <div style="color:red">${errorMsg1}</div>
        </c:if>
        <form action="${context}/yard/user/add.html" method="post">
            <label>工  号：<input type="text" name="userName"></label>&nbsp;&nbsp;
            <label>姓  名：<input type="text" name="name"></label>&nbsp;&nbsp;
            <label>密  码：<input type="text" name="password"></label>&nbsp;&nbsp;
            <label>所属系：<input type="text" name="department"></label>&nbsp;&nbsp;
            <input type="submit" value="添  加">&nbsp;&nbsp;
        </form>
        <br/>
        <c:if test="${empty errorMsg}"><br/></c:if>
        <c:if test="${!empty errorMsg}">
            <div style="color:red">${errorMsg}</div>
        </c:if>
        <div style="float: left">
            <form action="${context}/yard/user/upload.html" method="post" enctype="multipart/form-data">
                <input type="file" name="file" value="上传表格">&nbsp;&nbsp;
                <input type="submit" value="导  入">
            </form>
        </div>
    </div>
    <br/>
    <div id="write2">
        <c:if test="${empty errorMsg2}"><br></c:if>
        <c:if test="${!empty errorMsg2}">
            <div style="color:red">${errorMsg2}</div>
        </c:if>
        <form action="${context}/yard/user/find.html" method="post">
            <label>所属系：<input type="text" name="department"></label>&nbsp;&nbsp;

            <label>用户名：<input type="text" name="userName"></label>&nbsp;&nbsp;
            <input type="submit" value="查  询">
        </form>
    </div>
    <br/>
    <div id="main">
        <div id="float-box">
            <table border="1px" width="100%">
                <tr>
                    <td width="10%">用户名（工号）</td>
                    <td width="10%">密码</td>
                    <td width="10%">姓名</td>
                    <td width="15%">所属系</td>
                    <td width="15%">邮箱</td>
                    <td width="15%">手机</td>
                    <td width="5%">性别</td>
                    <td width="10%">生日</td>
                    <td width="10%">操作</td>
                </tr>
                    <tr>
                        <c:if test="${!empty resultMsg1}">
                            <td colspan="9"><div style="color:red">${resultMsg1}</div></td>
                        </c:if>
                    </tr>
                <c:forEach var="teacher" items="${teacher}" varStatus="status">
                    <form id="form${status.count}" method="post" action="${context}/yard/user/${teacher.teacherId}/delete.html">
                        <tr>
                            <td>${teacher.teacherUserName}</td>
                            <td>${teacher.teacherPassword}</td>
                            <td>${teacher.teacherName}</td>
                            <td>${teacher.teacherDepartment}</td>
                            <td>${teacher.teacherEmail}</td>
                            <td>${teacher.teacherTelephone}</td>
                            <td>${teacher.teacherSex}</td>
                            <td>${teacher.teacherBirthday}</td>
                            <td>
                                <a href="<c:url value="/yard/user/${teacher.teacherId}/edit.html"/>">更改</a>
                                <input type="hidden" name="_method" value="DELETE" />
                                <a href="javascript:document.getElementById('form${status.count}').submit();">删除</a>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </table>
        </div>
    </div>
    </div>
</body>
</html>