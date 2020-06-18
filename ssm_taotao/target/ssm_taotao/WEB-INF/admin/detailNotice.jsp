<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../bootStrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootStrap/html5shiv/html5shiv.min.js"></script>
    <script src="../bootStrap/respond/respond.min.js"></script>
    <script src="../bootStrap/jquery/jquery.min.js"></script>
    <script src="../bootStrap/js/bootstrap.min.js"></script>

    <title>detailNotice.jsp</title>

</head>
<body>
<div class="container">

<%--    <span class="label label-success" style="text-align: center;display:block;font-size: 35px;width: 250px;margin: auto" >公告详细</span>--%>
    <h1 style="text-align: center">公告详细</h1>

    <div id="two" style="border: 0px solid #8c8c8c;" >
        <p class="text-center"><strong>公告标题:</strong></p>
        <p class="text-center">${detailList[0].title}</p>
        <p class="text-center"><strong>公告时间:</strong></p>
        <p class="text-center">${detailList[0].time}</p>
    </div>
    <br/>
    <div id="one" style="border: 0px solid #8c8c8c;" >
        <p class="text-center"><strong>公告内容:</strong></p>
        <p class="text-center">${detailList[0].content}</p>
    </div>


</div>





</body>
</html>
