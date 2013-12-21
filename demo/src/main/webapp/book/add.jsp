<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-12-5
  Time: 下午8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>book add page</title>
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

        //    $(function() {
        //        $( "#datepicker" ).datepicker();//默认是英文版
        //    });

        //如要修改日期的z-index显示层次
        //1、jquery-ui-1.10.3.custom.js
        //2、zIndex: function( zIndex ) {
        //3、修改为
       /* zIndex: function( zIndex ) {
            if ( zIndex !== undefined ) {
                return this.css( "zIndex", "999" );
                //return this.css( "zIndex", zIndex );
            }
*/
        $(function() {
            $("#datepicker").datepicker({
//          defaultDate: "+1w",//显示相邻下一月
//          changeMonth: true,//修改月份下拉菜单
            changeYear:true,//修改年份下拉菜单
            showButtonPanel:true,//显示今天和关闭
//          numberOfMonths: 3,//显示连续月份
            dateFormat:"yy-mm-dd",//显示年月日格式
            regional:"zh-TW"});//显示中文表格,
// 需要导入jquery.ui.datepicker-zh-TW.js.目录位置在jquery-ui-1.10.3.custom\jquery-ui-1.10.3.custom\development-bundle\demos\datepicker
        });
    </script>
</head>
<body>
<h1>book add page</h1>
<%--form表单，文件上传enctype="multipart/form-data",只能是post方式--%>
<form action="add" method="post" enctype="multipart/form-data">
    TITLE:<input name="title" value=" 编程"><br>
    AUTHOR:<input name="author" value="李四"><br>
    Date: <input name="date" id="datepicker" /><br>
    PRICE:<input name="price" value="123.45"><br>
    AMOUNT:<input name="amount" value="123"><br>
    PICTURE:<input type="file" name="file"><br>
    DESCRIPTION:
    <textarea name="description" id="ueditor"></textarea><br>
    <script>
        UE.getEditor('ueditor');
    </script>
    <input type="submit" value="add">
</form>


<%--测试BookController中 @RequestMapping(value = "test",method = RequestMethod.GET)--%>
<a href="test?key=value...中文">test</a>

<form action="test" method="get">
    <input type="text" name="key" value="ttt中文"/>
    <input type="submit" value="submit"/>
</form>
</body>
</html>
