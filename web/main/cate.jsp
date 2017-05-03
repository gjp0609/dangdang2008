<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:iterator value="categoryList" var="cate">

    <a href='<s:url value="../main/book_list.jsp"><s:param name="cateId" value="#cate.parentCategory.id"/></s:url>'>
        <s:property value="#cate.parentCategory.name"/></a>
    &gt;&gt;
    <a href="<s:url  value="../main/book_list.jsp"><s:param name="cateId" value="#cate.id"/></s:url>">
        <s:property value="#cate.name"/></a>
</s:iterator>