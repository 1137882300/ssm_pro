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

    <title>selectConsumer.jsp</title>
    <script>
        function deleteConsumer(id) {
            console.log(id)
            //用户安全提示
            if (confirm("您确定要删除嘛？")) {
                //访问路径
                location.href = "${pageContext.request.contextPath}/consumerController/deleteConsumer?id=" + id;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1 style="text-align: center">查询用户</h1>

    <form id="form" action="${pageContext.request.contextPath}/consumerController/selectConsumer" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th>编号</th>
                <th>用户名</th>
                <th>密码</th>
                <th>操作</th>
            </tr>
            <tr>
                <c:forEach items="${consumerList}" var="list" varStatus="s">
            <tr>
                <td>${s.count}</td>
                <td>${list.username}</td>
                <td>${list.password}</td>
                <td>
                    <a class="btn btn-default btn-sm" href="javascript:deleteConsumer(${list.id});">删除</a>
                </td>
            </tr>
            </c:forEach>


        </table>
    </form>

</div>
</body>
</html>
