<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>type</title>
</head>
<body>
<h2>typeAll</h2>
${typeAll}

<h2>typeAll[0]水果</h2>
${typeAll[0]}

<h2>typeAll[1]蔬菜</h2>
${typeAll[1]}

<h2>typeAll[2]肉类</h2>
${typeAll[2]}


<h2>typeAll[0].goods</h2>
${typeAll[0].goods}

<h2>typeAll[1].goods</h2>
${typeAll[1].goods}

<h2>typeAll[2].goods</h2>
${typeAll[2].goods}

<h2>typeAll[0].goods[0].gname</h2>
${typeAll[0].goods[0].gname}

<h1>嵌套循环,每个类型对应所有的商品</h1>
<c:forEach items="${typeAll}" var="listType" varStatus="s">
    <h1>${s.index}</h1>
    <c:if test="${s.index == 0}">
        <c:forEach items="${listType.goods}" var="list">
            ${list.gname}
        </c:forEach>
    </c:if>


</c:forEach>


</body>
</html>
