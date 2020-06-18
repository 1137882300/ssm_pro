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

    <title>selectNotice.jsp</title>

    <script>
        function deleteNotice(title) {
            console.log(title)
            //用户安全提示
            if (confirm("您确定要删除嘛？")) {
                //直接访问路径
                location.href = "${pageContext.request.contextPath}/noticeController/deleteNotice?title=" + title;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1 style="text-align: center">公告查询</h1>

    <div style="float: right;margin: 5px">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/noticeController/toAddNotice">添加公告</a>
    </div>

    <form id="form" action="${pageContext.request.contextPath}/noticeController/selectNotice" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th>编号</th>
                <th>标题</th>
                <th>时间</th>
                <th>操作</th>
            </tr>
            <tr>
                <c:forEach items="${noticeList}" var="list" varStatus="s">
            <tr>
                <td>${s.count}</td>
                <td>${list.title}</td>
                <td>${list.time}</td>
                <td>
                    <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/noticeController/detailNotice?id=${list.id}">详细</a>
                    <a class="btn btn-default btn-sm" href="javascript:deleteNotice('${list.title}');">删除</a>
                </td>
            </tr>
            </c:forEach>


        </table>
    </form>
</div>

</body>
</html>
