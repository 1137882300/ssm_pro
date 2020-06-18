<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../bootStrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootStrap/html5shiv/html5shiv.min.js"></script>
    <script src="../bootStrap/respond/respond.min.js"></script>
    <script src="../bootStrap/jquery/jquery.min.js"></script>
    <script src="../bootStrap/js/bootstrap.min.js"></script>

    <title>addNotice.jsp</title>

    <script>
        //页面加载就执行
        window.onload = getTime;

        //获取当前时间
        function getTime() {
            var date = new Date();
            var year = date.getFullYear()
            var month = date.getMonth() + 1
            var day = date.getDate()
            var hour = date.getHours()
            var minute = date.getMinutes()
            // month = month < 10 ? '0' + month : month
            // day = day < 10 ? ('0' + day) : day
            hour = hour < 10 ? ('0' + hour) : hour
            minute = minute < 10 ? ('0' + minute) : minute
            var showTime = year + "/" + month + "/" + day + " " + hour + ":" + minute
            // var _time =  document.getElementById("_time")
            // _time.value = ""+showTime
            document.getElementsByName("time")[0].value = showTime
            console.log(showTime)
        }
    </script>

</head>
<body>


<div class="container">
    <h1 style="text-align: center">添加公告</h1>

    <form action="${pageContext.request.contextPath}/noticeController/addNotice" method="post">
        <%--隐藏的时间戳--%>
        <div class="form-group">
            <input type="hidden" name="time" id="time" value="当前时间" onclick="getTime()">
        </div>

        <div class="form-group">
            <label for="title">公告标题:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="请输入公告标题">
        </div>

        <%--这里是公告的内容--%>
        <div class="form-group">
            <label for="content">公告内容:</label>
            <textarea rows="18" cols="156" class="form-control" id="content" name="content" class="form-control"
                      placeholder="请输入公告内容..."></textarea>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交">
            <input class="btn btn-default" type="reset" value="重置">
            <input class="btn btn-default" type="button" value="返回" onclick="history.back()">
        </div>
    </form>
</div>
</body>
</html>
