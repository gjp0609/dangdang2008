<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:iterator value="categoryList" var="cate">
    <a href="#<s:property value="#cate.parentCategory.id"/>"><s:property value="#cate.parentCategory.name"/></a>
    &gt;&gt; <a href="#<s:property value="#cate.id"/>"><s:property value="#cate.name"/></a>
</s:iterator>

