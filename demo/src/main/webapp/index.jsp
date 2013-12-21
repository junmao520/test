<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-12-4
  Time: 下午4:36
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <title>index page</title>
  </head>
  <body>
  <h1>index page111</h1>
  <form action="/user/login" method="post">
      username: <input name="username" value="张三"><br>
      password: <input type="password" name="password" value="123"><br>
      <input type="submit" value="login">
  </form>
  <p>${requestScope.loginmessage}</p>
  <p><a href="/user/signup.jsp">sign up</a></p>
  </body>
</html>
