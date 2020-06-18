<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link href="../jquerynavlbt/css/style.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../jquerynavlbt/css/bootstrap.min.css">
    <script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../jquerynavlbt/js/jquery.SuperSlide.2.1.1.js"></script>

    <title>淘淘绿色商城</title>

    <script>
        //页面加载就执行
        // window.onload = loading;

        <%--document.getElementById("notice").onclick = function () {--%>
        <%--    location.href = "${pageContext.request.contextPath}/indexController/findNotice";--%>
        <%--}--%>



        <%--function notice(){--%>
        <%--    window.location.href = "${pageContext.request.contextPath}/indexController/findNotice";--%>
        <%--}--%>
        <%--window.onload = load;--%>

        <%--function load() {--%>
        <%--    window.location.replace("${pageContext.request.contextPath}/indexController/findGoods");--%>
        <%--};--%>

        function notice() {
            location.href = "${pageContext.request.contextPath}/indexController/findNotice";
        }
    </script>


</head>
<body>

<!--放导航栏的大盒子 头部-->
<div class="jq22-header">
    <!--放导航栏的中盒子-->
    <div class="jq22-comm-box clearfix" style="padding: 5px">
        <!--左上角的logo-->
        <div class="jq22-nav-logo">
            <a href="${pageContext.request.contextPath}/indexController/findGoods">
                <img src="../jquerynavlbt/images/logo.png" alt="" class="jq22-nav-logo1">
            </a>
            <a href="${pageContext.request.contextPath}/indexController/findGoods">
                <img src="../jquerynavlbt/images/icon-gf.gif" alt="" class="jq22-nav-logo2">
            </a>
        </div>


        <!--这是真正的导航栏-->
        <div class="jq22-nav-nav" style="margin: 12px">
            <dl class="clearfix" style="margin: auto">
                <dd class="on">
                    <h3 class="jq22-clear">
                        <a href="${pageContext.request.contextPath}/indexController/findGoods" class="active">首页</a>
                    </h3>
                </dd>
                <dd>
                    <h3>
                        <a href="#">秒杀系列</a>
                    </h3>
                    <div class="jq22-hot"></div>

                </dd>
                <dd>
                    <h3>
                        <a href="${pageContext.request.contextPath}/typeController/findType?type=5">绿色蔬菜</a>
                    </h3>

                </dd>
                <dd>
                    <h3>
                        <a href="${pageContext.request.contextPath}/typeController/findType?type=4">新鲜水果</a>
                    </h3>

                </dd>
                <dd>
                    <h3>
                        <a href="${pageContext.request.contextPath}/typeController/findType?type=6">每日生鲜</a>
                    </h3>
                </dd>
                <dd>
                    <h3>
                        <a href="${pageContext.request.contextPath}/collectionController/toCollection">我的收藏</a>
                    </h3>
                </dd>
                <dd>
                    <h3>
                        <a href="${pageContext.request.contextPath}/shopCartController/toShopCart">我的购物车</a>
                    </h3>

                </dd>
            </dl>
        </div>


        <!--右边的个人中心-->
        <div class="jq22-nav-right" style="float: left;margin: 15px">
            <a href="${pageContext.request.contextPath}/orderController/toOrder?uid=${uid}">个人中心</a>
        </div>

    </div>
</div>


<!--轮播图的一整块盒字-->
<div class="jq22-banner-box" style="padding-top: 30px">
    <div class="jq22-banner-slide">
        <div class="hd jq22-banner-circle">
            <ul>
                <li class="on"></li>
                <li></li>
                <li></li>
            </ul>
        </div>
        <div class="bd jq22-banner-body">
            <ul>
                <li>
                    <a href="#" class="jq22-banner-body-bg01"></a>
                </li>
                <li>
                    <a href="#" class="jq22-banner-body-bg02"></a>
                </li>
                <li>
                    <a href="#" class="jq22-banner-body-bg03"></a>
                </li>
            </ul>
        </div>
    </div>
</div>


<!--这里可以放公告-->
<div class="jq22-background" style="float: left;margin-bottom: 10px;width: 100%">
    <%--只显示最新的公告--%>
    <p id="notice" onclick="notice()" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">
        <strong>最新公告：</strong><em>${noticeAll.time}</em>&ensp;&ensp;${noticeAll.content}</p>
</div>


<!-- 商品的列表-->
<div class="tab-content">
    <form action="${pageContext.request.contextPath}/indexController/findGoods" method="post">
        <div role="tabpanel" class="tab-pane active" id="tab-description">
            <div class="row">
                <c:forEach items="${goodsAll}" var="list" varStatus="s">
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <!-- Product item -->
                        <div class="product-item">
                            <a href="${pageContext.request.contextPath}/detailGoodsController/toDetailGoods?gid=${list.gid}"
                               target="_blank">
                                <!--图片-->
                                <img src="${list.gpicture}" alt="image" style="width: 400px;height: 334px">
                            </a>
                            <!--名称-->
                            <div class="product-caption">
                                <h4 class="product-name">
                                    <a href="${pageContext.request.contextPath}/detailGoodsController/toDetailGoods?gid=${list.gid}"
                                       target="_blank">${list.gname}</a>
                                </h4>
                                <!--钱*现价-->
                                <div class="product-price-group">
                                    <span class="product-price">￥${list.grprice}</span>
                                </div>
                                <!--操作-->
                                <div class="ht-btn-group">
                                    <a href="${pageContext.request.contextPath}/shopCartController/addCart?gid=${list.gid}&uid=${uid}"><strong>加入购物车</strong></a>
                                    <a href="#"><strong>收藏</strong></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:forEach>


            </div>
        </div>
    </form>

</div>

<%--js --%>
<script type="text/javascript">

    jQuery(".jq22-banner-slide").slide({
        mainCell: ".bd ul",
        effect: "fold",
        autoPlay: true,
        trigger: "click",
        delayTime: 1000
    });

    jQuery(".jq22-comm-box").slide({
        type: "menu",
        titCell: "dd",
        targetCell: "ul",
        delayTime: 0,
        defaultPlay: false,
        returnDefault: true
    });
</script>

</body>
</html>
