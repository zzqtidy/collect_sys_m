<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="common/header.jsp" %>
    <link href="/static/css/signin.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">

    <title>登录</title>
</head>
<body>
<div class="container">

    <form class="form-signin" id="loginForm" action="${baseurl}login" method="post">
        <div class="row">
            <i class="fa fa-user "></i>
            <input type="text" id="username" name="username" placeholder="用户名" class="form-control" required autofocus/>
        </div>

        <div class="row">
            <i class="fa fa-lock"></i>
            <input type="password" id="password" name="password" placeholder="密码" class="form-control" required/>
        </div>
        <div class="row">
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"> 记住我
                </label>
            </div>
        </div>
        <div class="row">
            <button id="loginBtn" class="btn btn-primary" type="submit">登陆</button>
            <button id="regBtn" class="btn btn-info" type="button">注册</button>
        </div>
    </form>
</div>
</body>
</html>
