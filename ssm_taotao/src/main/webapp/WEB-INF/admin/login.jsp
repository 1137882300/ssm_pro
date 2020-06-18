<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../bootStrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootStrap/jquery/jquery.min.js"></script>
    <script src="../bootStrap/js/bootstrap.min.js"></script>
    <script src="../bootStrap/html5shiv/html5shiv.min.js"></script>
    <script src="../bootStrap/respond/respond.min.js"></script>

    <title>login.jsp</title>
    <style>
        #submit{
            margin-top: 20px;
            margin-left: 5px;
        }
        #msg{
            margin: auto;
            text-align: center;
            width: 300px;
            height: 30px;
            background-color: #8c8c8c;
        }
        #error{
            margin: auto;
            text-align: center;
            width: 280px;
            height: auto;
        }
    </style>

    <script>
        //页面加载完再加载
        window.onload = function () {
            //获取checkbox
            document.getElementById("checkBox").onclick = function () {
                if (this.checked === true) {
                    console.log("this.checked -if->"+this.checked)
                    document.myform.action ="${pageContext.request.contextPath}/adminController/login?checkBox=checked"
                }
            }
        }
    </script>
</head>
<body>
    <div style="text-align: center">
        <h3>管理员登录</h3>
        <form action="${pageContext.request.contextPath}/adminController/login" method="post" id="myform" name="myform" >
            用户名：<input type="text" name="adminname" value="${adminname}"><br>
            密&ensp;&ensp;码：<input type="password" name="adminpwd" value="${adminpwd}"><br>
            <label>
                <input type="checkbox" id="checkBox">记住密码
            </label>
            <input type="submit" value="登录" id="submit">
        </form>
    </div>

<%--    <div class="alert alert-danger" role="alert" id="msg">--%>
<%--        ${msg}--%>
<%--    </div>--%>

    <div class="alert alert-danger" role="alert" id="error">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span class="sr-only">Error:</span>
        ${msg}
    </div>
</body>
</html>
