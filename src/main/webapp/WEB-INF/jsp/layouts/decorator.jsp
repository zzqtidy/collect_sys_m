<%--
  Created by IntelliJ IDEA.
  User: zzq
  Date: 18/4/6
  Time: 下午7:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <sitemesh:write property='title'/>
    </title>
    <sitemesh:write property='head'/>
</head>
<body>

我是装饰器 : title的内容在这里 ~ <sitemesh:write property='title'/><br/>

我是装饰器 : body的内容在这里 ~ <sitemesh:write property='body'/><br/>

我是装饰器 : myTag的内容在这里 ~ <sitemesh:write property='myTag'/><br/>

</body>
</html>
