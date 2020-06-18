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

    <title>updateGoods.jsp</title>

    <script>
        function doType(){
            var type = document.getElementById("gstype").value;
            if (type == '水果'){document.getElementById("gstype").value = 4}
            if (type == '蔬菜'){document.getElementById("gstype").value = 5}
            if (type == '肉类'){document.getElementById("gstype").value = 6}
        }
    </script>

</head>
<body>

<div class="container">
    <h1 style="text-align: center">更改商品</h1>
    <form action="${pageContext.request.contextPath}/goodsController/updateGoods" method="post">
        <%--回显数据--%>
        <%--这是个隐藏域来提交数据id--%>
        <input type="hidden" name="gid" value="${getGid}">
        <div class="form-group">
            <label for="gname">商品名称:</label>
            <input type="text" class="form-control" id="gname" name="gname" value="${getGname}" readonly="readonly" placeholder="请输入商品名称">
        </div>
        <div class="form-group">
            <label for="goprice">商品原价:</label>
            <input type="text" class="form-control" id="goprice" value="${getGoprice}" name="goprice" placeholder="请输入商品原价">
        </div>
        <div class="form-group">
            <label for="grprice">商品现价:</label>
            <input type="text" class="form-control" id="grprice" value="${getGrprice}" name="grprice" placeholder="请输入商品现价">
        </div>
        <div class="form-group">
            <label for="gstock">商品库存 :</label>
            <input type="text" class="form-control" id="gstock" value="${getGstock}" name="gstock" placeholder="请输入商品库存">
        </div>
        <div class="form-group">
            <label for="gstype">商品类型:</label>
            <c:if test="${getGstype_num == 4}">
                <input type="text" class="form-control" id="gstype" value="水果" name="gstype" placeholder="${getGstype}" readonly="readonly">
            </c:if>
            <c:if test="${getGstype_num == 5}">
                <input type="text" class="form-control" id="gstype" value="蔬菜" name="gstype" placeholder="${getGstype}" readonly="readonly">
            </c:if>
            <c:if test="${getGstype_num == 6}">
                <input type="text" class="form-control" id="gstype" value="肉类" name="gstype" placeholder="${getGstype}" readonly="readonly">
            </c:if>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" onclick="doType()">
            <input class="btn btn-default" type="reset" value="重置">
            <input class="btn btn-default" type="button" value="返回" onclick="history.back()" >
        </div>

    </form>

</div>

</body>
</html>
