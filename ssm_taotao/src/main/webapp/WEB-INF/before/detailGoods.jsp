<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../bootStrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootStrap/html5shiv/html5shiv.min.js"></script>
    <script src="../bootStrap/respond/respond.min.js"></script>
    <script src="../bootStrap/jquery/jquery.min.js"></script>
    <script src="../bootStrap/js/bootstrap.min.js"></script>

    <title>detailGoods</title>

    <script type="text/javascript">
        function goCart() {
            //获取input的值
            var count = document.getElementById("count").value
            //访问路径
            location.href = "${pageContext.request.contextPath}/shopCartController/addCart?gid=${Gid}&uid=${uid}&count="+count;
            // document.putcartform.submit();
        }
        function gofocus() {
            // window.location.href = "" ;
        }
    </script>
</head>
<body>

<div class="container">

<!-- 图片-->
    <div id="goodsInfo" style="text-align: center;margin-top: 20px">
        <div class="imgInfo">
            <input type="hidden" name="id" value="1"/>
            <div class="bt"><strong>${Gname}</strong></div>
            <img src="${Gpicture}" width="400px" height="340px"/>
        </div>
    </div>


<!--商品详细-->
    <!--商品表述-->
    <div class="goods_desc" style="text-align: center;width: 400px;margin-left: 380px">
        <div class="goods_show" style="text-align: left">
            <span>原价&ensp;&ensp;&ensp;&ensp;</span><strong class="yj"><s>${Goprice}元</s></strong><br>
            <span>活动价&ensp;&ensp;</span><strong class="xj" style="font-size: 20px">${Grprice}元</strong><br>
            <span>类型&ensp;&ensp;&ensp;&ensp;</span><strong>${Gstype}</strong><br>
            <span>购买数量</span><input type="text" name="count" id="count" class="good_txt" value="1"/>(库存<strong>${Gstock}</strong>)<br>
        </div>
        <p class="bottom10 top5" style="text-align: right">
            <img src="../jquerynavlbt/images/follow.png" onclick="goFollow()"/>&nbsp;&nbsp;
            <img src="../jquerynavlbt/images/shopCart.png" onclick="goCart()"/>
        </p>
    </div>
</div>




</body>
</html>