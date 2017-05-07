<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户注册 - 当当网</title>
    <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    <link href="../css/page_bottom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@include file="../common/head1.jsp" %>

重定向
<a href="<s:url namespace="/order" action="toAddress"/>?addressId=0">click</a>

<%@include file="../common/foot1.jsp" %>
</body>
</html>

