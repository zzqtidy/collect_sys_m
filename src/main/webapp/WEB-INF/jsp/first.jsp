<%--
  Created by IntelliJ IDEA.
  User: zzq
  Date: 2017/12/4
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/header.jsp" %>
    <title>首页</title>
</head>
<body>
登录成功！！！！！
Welcome,${activeUser.username}
<ul>
    <c:forEach items="${activeUser.menus}" var="menu">
        <li>${menu.name}</li>
    </c:forEach>
</ul>
</body>
<%@ include file="common/footer.jsp" %>
</html>
