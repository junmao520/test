<%--
  User: mingfei.net@gmail.com
  Date: 13-11-25
  Time: 上午8:47
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>sign up page</title>
    <script src="/js/jquery-1.10.2.js"></script>
    <script>
//        $(function() {
//            $('input:not(:submit)').focus(function() {
//                $(this).val('');
//            });
//        });
    </script>
</head>
<body>
    <h1>sign up page</h1>
    <form action="/user/signup" method="post">
        username: <input name="username" value="张三"><br>
        password: <input type="password" name="password" value="123"><br>
        <input type="submit" value="sign up">
    </form>
    <p>${sessionScope.singupmessage}</p>
</body>
</html>