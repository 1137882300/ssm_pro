<%--
  Created by IntelliJ IDEA.
  User: cc
  Date: 2020/5/13
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>index.jsp</title>
    <style>
        body {
            text-align: center;
        }
    </style>
</head>

<body>
<h1 style="color: #c7254e">后台测试</h1> <br>

<a href="goodsController/selectGoods">查询商品测试</a><br>

<a href="adminController/toLogin">登录测试</a> <br>

<a href="testMain/main">测试主页main</a> <br>

<a href="${pageContext.request.contextPath}/goodsController/toAddGoods">添加商品测试</a> <br>

<hr>

<h1 style="color: #985f0d">前端测试</h1> <br>

<a href="${pageContext.request.contextPath}/consumersController/toLogin">登录测试</a><br>

<a href="${pageContext.request.contextPath}/indexController/findGoods">主页测试</a><br>

<a href="${pageContext.request.contextPath}/typeController/findType?type=7">类型获取测试</a><br>

<a href="${pageContext.request.contextPath}/shopCartController/toShopCart">购物车测试</a><br>
</body>
</html>
