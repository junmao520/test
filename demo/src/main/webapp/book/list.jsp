<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-12-5
  Time: 下午8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <%--代码高亮显示--%>
    <style>
        @import "/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css";
    </style>
    <script src="/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
    <script>
        SyntaxHighlighter.all();
    </script>
</head>
<body>
<h1>book list page</h1>
<hr>
<table border="1">
    <tr>
        <th>ID</th>
        <th>TITLE</th>
        <th>AUTHOR</th>
        <th>DATE</th>
        <th>PRICE</th>
        <th>AMOUNT</th>
        <th>PICTURE</th>
        <th>DESCRIPTION</th>
        <th colspan="2">OPERATION</th>
    </tr>
    <c:forEach var="book" items="${sessionScope.books}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${book.title}</td>
            <td>${book.author}</td>
            <td><fmt:formatDate value="${book.date}" pattern="yyyy-MM-dd" /></td>
            <td>${book.price}</td>
            <td>${book.amount}</td>
            <td><img src="/upload/${book.picture}" alt=""/></td>
            <td>${book.description}</td>
            <td><a href="search/${book.id}">EDIT</a></td>
            <td><a href="remove?id=${book.id}" onclick="return del()">DELETE</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
