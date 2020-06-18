<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>淘淘绿色商城后台系统</title>

    <style type="text/css">
        * {
            margin: 5px;
            padding: 5px;
        }

        body {
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            margin: auto;
            height: auto;
            width: 100%;
            border: 2px solid #006633;
        }

        #header {
            text-align: center;
            height: 90px;
            width: 100%;
            margin: 0px 0px 3px 0px;
        }

        #header h1 {
            text-align: center;
            font-family: "Franklin Gothic Medium";
            color: #000000;
            font-size: 50px;
        }

        #navigator {
            text-align: center;
            height: 25px;
            width: 100%;
            font-size: 14px;
        }

        #navigator ul {
            text-align: center;
            list-style-type: none;
            margin-left: 340px;
        }

        #navigator li {
            float: left;
            position: relative;
        }

        #navigator li a {
            color: #000000;
            text-decoration: none;
            padding-top: 4px;
            display: block;
            width: 98px;
            height: 22px;
            text-align: center;
            background-color: #269abc;
            margin-left: 2px;
        }

        #navigator li a:hover {
            background-color: #999999;
            color: #FFFFFF;
        }

        #navigator ul li ul {
            visibility: hidden;
            position: absolute;
        }

        #navigator ul li:hover ul,
        #navigator ul a:hover ul {
            visibility: visible;
        }

        #content {
            height: auto;
            width: 100%;
            padding: 0px;
            margin-top: 40px;
        }

        #content iframe {
            text-align: center;
            height: 600px;
            width: 100%;
        }
    </style>

</head>
<body>

<div id="header">
    <br>
    <br>
    <h1>欢迎"${admin.adminname}"进入后台管理系统！</h1>
</div>

<div id="navigator">
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}/goodsController/findGoodsByPage" target="iframe">商品管理</a>
        </li>

        <li><a href="${pageContext.request.contextPath}/goodsTypeController/selectGoodsType" target="iframe">类型管理</a>
        </li>

        <li><a href="${pageContext.request.contextPath}/consumerController/selectConsumer" target="iframe">用户管理</a>
        </li>

        <li><a href="${pageContext.request.contextPath}/ordersController/selectOrders" target="iframe">订单管理</a>
        </li>

        <li><a href="${pageContext.request.contextPath}/noticeController/selectNotice" target="iframe">公告管理</a>
        </li>

        <li><a href="${pageContext.request.contextPath}/adminController/exit">安全退出</a>
        </li>
    </ul>
</div>


<div id="content">
    <iframe src="${pageContext.request.contextPath}/goodsController/findGoodsByPage" name="iframe" frameborder="1"></iframe>
</div>


</body>
</html>