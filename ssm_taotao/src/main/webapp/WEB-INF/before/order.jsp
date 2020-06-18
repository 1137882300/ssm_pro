<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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

    <link href="../jquerynavlbt/css/style.css" rel="stylesheet" type="text/css"/>
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../jquerynavlbt/css/bootstrap.min.css">
    <script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../jquerynavlbt/js/jquery.SuperSlide.2.1.1.js"></script>

    <title>shopCart</title>

    <script>
        function buyThis() {
            if (confirm("您确定要一键购买？")) {
                alert("你真棒！")
            } else {
                alert("还想逛逛~")
            }
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
                        <a href="${pageContext.request.contextPath}/indexController/findGoods">首页</a>
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
                        <a href="#">我的收藏</a>
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

<!--这里可以放公告-->
<div class="jq22-background" style="float: left;margin-bottom: 10px;width: 100%">
    <%--只显示最新的公告--%>
    <p id="noticeLoading"><strong>最新公告：</strong><em>${noticeAll[0].time}</em>&ensp;&ensp;${noticeAll[0].content}</p>
</div>
<%--主要内容--%>
<div class="container">

    <form id="form" action="" method="post">
        <table border="0" class="table table-bordered table-hover">
            <tr class="success">
                <th>编号</th>
                <th>商品</th>
                <th>数量</th>
                <th>日期</th>
                <th>金额</th>
                <th>操作</th>
            </tr>
            <%--所有的订单--%>
            <c:set value="0" var="sum"/>
            <c:forEach items="${orderList}" var="list" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td><img src="${list.img}" style="width: 70px;height: 70px"></td>
                    <td>×${list.number}</td>
                    <td>${list.orderdate}</td>
                    <td>${list.money}</td>
                    <td>
                        <a class="btn btn-default btn-sm" onclick="buyThis()">购买</a>
                    </td>
                </tr>
                <c:set value="${sum + list.money}" var="sum"/>
            </c:forEach>

            <%--某一个订单--%>
            <c:if test="${orderMap != null}">
                <tr>
                    <td>1</td>
                    <td><img src="${orderMap.img}" style="width: 70px;height: 70px"></td>
                    <td>×${orderMap.number}</td>
                    <td>${orderMap.orderdate}</td>
                    <td>${orderMap.money}</td>
                    <td>
                        <a class="btn btn-default btn-sm" onclick="buyThis()">购买</a>
                    </td>
                </tr>
            </c:if>
            <%--不是某一个订单，才显示--%>
            <c:if test="${orderMap == null}">
                <tr class="success">
                    <%--多少钱的计算--%>
                    <th colspan="6" style="text-align: right;padding-right: 80px;">
                        总计：<a style="color: #a60401;font-size: 30px">${sum}</a> 元（免运费）&nbsp;&nbsp;<a style="font-size: 20px" onclick="buyThis()">一键购买</a>
                    </th>
                </tr>
            </c:if>
        </table>
    </form>
</div>


</body>
</html>
