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

    <title>selectGoods.jsp</title>
    <script>
        function deleteGoods(gid) {
            //用户安全提示
            if (confirm("您确定要删除嘛？")) {
                //访问路径
                location.href = "${pageContext.request.contextPath}/goodsController/deleteGoods?gid=" + gid;
            }
        }

        //页面加载完再加载
        window.onload = function () {
            //给删除选中按钮添加单击事件
            document.getElementById("deleteSelected").onclick = function () {
                if (confirm("您确定要删除所选嘛?")) {
                    //判断是否有选中条目
                    var flag = false;
                    var cbs = document.getElementsByName("gid");
                    for (var i = 0; i < cbs.length; i++) {
                        if (cbs[i].checked) {
                            flag = true;
                            break;
                        }
                    }
                    if (flag) {//有条目选中
                        //提交表单
                        document.getElementById("form").submit();
                    }

                }
            }
            //1.获取第一个checkbox
            document.getElementById("firstCb").onclick = function () {
                //2.获取下边列表中的所有的cb
                var cbs = document.getElementsByName("gid");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态==firstCb的checked状态
                    cbs[i].checked = this.checked;
                }
            }

        }

    </script>
</head>
<body>

<div class="container">
    <h1 style="text-align: center">查询商品</h1>
    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/goodsController/findGoodsByPage"
              method="post">
            <div class="form-group">
                <label for="gstype">类型</label>
                <%--<input type="text" class="form-control" name="gstype" id="gstype" placeholder="类型">--%>
                <select name="gstype" class="form-control" id="gstype">
                    <c:if test="${empty condition.gstype[0]}">
                        <option value="" selected></option>
                        <option value="4">水果</option>
                        <option value="5">蔬菜</option>
                        <option value="6">肉类</option>
                    </c:if>
                    <c:if test="${condition.gstype[0] == 4}">
                        <option value=""></option>
                        <option selected value="4">水果</option>
                        <option value="5">蔬菜</option>
                        <option value="6">肉类</option>
                    </c:if>
                    <c:if test="${condition.gstype[0] == 5}">
                        <option value=""></option>
                        <option value="4">水果</option>
                        <option selected value="5">蔬菜</option>
                        <option value="6">肉类</option>
                    </c:if>
                    <c:if test="${condition.gstype[0] == 6}">
                        <option value=""></option>
                        <option value="4">水果</option>
                        <option value="5">蔬菜</option>
                        <option selected value="6">肉类</option>
                    </c:if>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputName2">名称</label>
                <input type="text" class="form-control" name="gname" value="${condition.gname[0]}"
                       id="exampleInputName2" placeholder="名称">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">现价</label>
                <input type="number" class="form-control" name="grprice" value="${condition.grprice[0]}"
                       id="exampleInputEmail2" placeholder="现价">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>

    <div style="float: right;margin: 5px">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/goodsController/toAddGoods">添加商品</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="deleteSelected">删除选中</a>
    </div>

    <form id="form" action="${pageContext.request.contextPath}/goodsController/deleteSelected" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>名称</th>
                <th>原价</th>
                <th>现价</th>
                <th>库存</th>
                <th>图片</th>
                <th>类型</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pb.list}" var="list" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="gid" value="${list.gid}"></td>
                    <td>${s.count}</td>
                    <td>${list.gname}</td>
                    <td>${list.goprice}</td>
                    <td>${list.grprice}</td>
                    <td>${list.gstock}</td>
                    <td>${list.gpicture}</td>
                    <td>${list.goodsType.gstype}</td>
                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/goodsController/toUpdateGoods?gid=${list.gid}">修改</a>
                        &nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteGoods(${list.gid});">删除</a>
                    </td>
                </tr>
            </c:forEach>


        </table>
    </form>

    <nav aria-label="Page navigation">
        <ul class="pagination">
            <%--判断上一页--%>
            <c:if test="${pb.currentPage ==1}">
            <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage !=1}">
            <li>
                </c:if>
                <a href="${pageContext.request.contextPath}/goodsController/findGoodsByPage?currentPage=${pb.currentPage-1}&rows=6&gstype=${condition.gstype[0]}&gname=${condition.gname[0]}&grprice${condition.grprice[0]}"
                   aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <c:forEach begin="1" end="${pb.totalPage}" var="i">
                <c:if test="${pb.currentPage == i}">
                    <li class="active"><a
                            href="${pageContext.request.contextPath}/goodsController/findGoodsByPage?currentPage=${i}&rows=6&gstype=${condition.gstype[0]}&gname=${condition.gname[0]}&grprice${condition.grprice[0]}">${i}</a>
                    </li>
                </c:if>
                <c:if test="${pb.currentPage != i}">
                    <li>
                        <a href="${pageContext.request.contextPath}/goodsController/findGoodsByPage?currentPage=${i}&rows=6&gstype=${condition.gstype[0]}&gname=${condition.gname[0]}&grprice${condition.grprice[0]}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>

            <%--判断下一页--%>
            <c:if test="${pb.currentPage == pb.totalPage}">
            <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage != pb.totalPage}">
            <li>
                </c:if>
                <a href="${pageContext.request.contextPath}/goodsController/findGoodsByPage?currentPage=${pb.currentPage+1}&rows=6&gstype=${condition.gstype[0]}&gname=${condition.gname[0]}&grprice${condition.grprice[0]}"
                   aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>

            <span style="font-size: 24px;margin-left: 5px;">
                共${pb.totalCount}条记录，共${pb.totalPage}页
            </span>
        </ul>
    </nav>

</div>

</body>
</html>
