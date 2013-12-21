<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-12-5
  Time: 下午5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>user index</title>
</head>
<body>
欢迎${sessionScope.user.username}登陆成功
<p><a href="logout">logout</a></p>
<p><a href="/book/add.jsp">add book</a></p>
<p><a href="/book/list">list book</a></p>
</body>
</html>
