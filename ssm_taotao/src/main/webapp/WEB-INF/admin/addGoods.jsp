<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>addGoods.jsp</title>
</head>
<body>
<h1 style="text-align: center">添加商品</h1>
<div class="container">
    <form action="${pageContext.request.contextPath}/goodsController/addGoods" method="post">
        <div class="form-group">
            <label for="gname">商品名称:</label>
            <input type="text" class="form-control" id="gname" name="gname" placeholder="请输入商品名称">
        </div>
        <div class="form-group">
            <label for="goprice">商品原价:</label>
            <input type="text" class="form-control" id="goprice" name="goprice" placeholder="请输入商品原价">
        </div>
        <div class="form-group">
            <label for="grprice">商品现价:</label>
            <input type="text" class="form-control" id="grprice" name="grprice" placeholder="请输入商品现价">
        </div>
        <div class="form-group">
            <label for="gstock">商品库存:</label>
            <input type="text" class="form-control" id="gstock" name="gstock" placeholder="请输入商品库存">
        </div>
        <div class="form-group">
            <label for="gstype">商品类型:</label>
            <select name="gstype" class="form-control" id="gstype">
                <option value="4">水果</option>
                <option value="5">蔬菜</option>
                <option value="6">肉类</option>
            </select>
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