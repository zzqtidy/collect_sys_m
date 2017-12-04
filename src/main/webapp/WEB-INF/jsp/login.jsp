<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="common/header.jsp" %>
    <title>登录</title>
</head>
<body>
<form id="loginForm" action="${baseurl}login" method="post">
    <input type="text" id="username" name="username" placeholder="用户名" ></input>
    <input type="password" id="password" name="password" placeholder="密码"></input>
    <input id="loginBtn" type="button" value="Login"/>
</form>

</body>
<%@ include file="common/footer.jsp" %>
<script type="text/javascript">
    $(function () {
        $("#loginBtn").click(function () {
            $("#loginForm").submit();
        })
    })
</script>
</html>
