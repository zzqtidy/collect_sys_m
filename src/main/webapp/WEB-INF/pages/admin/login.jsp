<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--<%@ include file="../common/tag.jsp" %>-->
<!DOCTYPE>
<html lang="zh-CN">

<head>
    <!--<meta charset="utf-8">-->
    <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
    <title>登录</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/signin.css" rel="stylesheet" type="text/css">

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/vue/2.5.16/vue.min.js"></script>

</head>
<body>
    <div id="app" class="container">
        <form class="form-signin" id="loginForm">
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
                <button id="loginBtn" class="btn btn-primary" type="button" @click="loginBtnClick()">登陆</button>
                <button id="regBtn" class="btn btn-info" type="button">注册</button>
            </div>
        </form>
    </div>
    <script>
        var app = new Vue({
            el:"#app",
            data:{},
            methods:{
                loginBtnClick:function () {
                    $.ajax({
                        url:"/admin/login",
                        data:{
                            username:$("#username").val(),
                            password:$("#password").val()
                        },
                        success:function (res) {
                            window.location.href = "/admin/first";
                        }
                    });
                }
            }
        });
    </script>
</body>
</html>
