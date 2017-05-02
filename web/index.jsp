<%--
  Created by IntelliJ IDEA.
  User: gjp06
  Date: 17.4.30
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>re</title>
</head>
<body>
<%
    String url = response.encodeRedirectURL(request.getContextPath() + "/main/main.jsp");
    response.sendRedirect(url);
%>
</body>
</html>
