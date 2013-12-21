<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-12-5
  Time: 下午8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <style>
        a {
            text-decoration: none;
        }
        img {
            width: 20px;
            border: none;
        }
    </style>
    <%--百度富文本编辑器--%>
    <script src="/ueditor/ueditor.config.js"></script>
    <script src="/ueditor/ueditor.all.js"></script>
    <%--jQuery UI--%>
    <link href="/Styles/jquery-ui-1.10.3.custom.css" rel="stylesheet"
          type="text/css" />
    <script src="/Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.ui.datepicker-zh-TW.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <script>
        $(function() {
            $("#datepicker").datepicker({
//          defaultDate: "+1w",//显示相邻下一月
//          changeMonth: true,//修改月份下拉菜单
            changeYear:true,//修改年份下拉菜单
            showButtonPanel:true,//显示今天和关闭
//          numberOfMonths: 3,//显示连续月份
            dateFormat:"yy-mm-dd",//显示年月日格式
            regional:"zh-TW"});//显示中文表格,
        });
    </script>
</head>
<body>
<h1>book edit page</h1>
<form action="modify" method="post" enctype="multipart/form-data">
    <input type="hidden" name="picture" value="${sessionScope.book.picture}">
    <input type="hidden" name="id" value="${sessionScope.book.id}">
    TITLE:<input name="title" value="${sessionScope.book.title}"><br>
    AUTHOR:<input name="author" value="${sessionScope.book.author}"><br>
    DATE:<input name="date" id="datepicker" value='<fmt:formatDate value="${sessionScope.book.date}" pattern="yyyy-MM-dd" />'><br>
    PRICE:<input name="price" value="${sessionScope.book.price}"><br>
    AMOUNT:<input name="amount" value="${sessionScope.book.amount}"><br>
    PICTURE:<a href="/upload/${sessionScope.book.picture}" target="_blank">
    <img src="/upload/${sessionScope.book.picture}" alt="">
</a>
    <input type="file" name="file"><br>
    DESCRIPTION:
    <script type="text/plain" id="ueditor" name="description">
        ${sessionScope.book.description}
    </script>
    <script>
        UE.getEditor('ueditor');
    </script>
    <input type="submit" value="update">
</form>
</body>
</html>
