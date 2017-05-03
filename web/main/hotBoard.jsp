<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html;charset=utf-8" %>

<h2 class="t_xsrm">
    新书热卖榜
</h2>
<div id="NewProduct_1_o_t" onmouseover="">
    <ul>
        <s:iterator value="productList" var="book">
            <li><a target='_blank' href="<s:url namespace="/product" action="bookDetails">
                            <s:param name="id" value="#book.id"/></s:url>"><s:property value="#book.title"/></a></li>
        </s:iterator>
    </ul>
    <h3 class="second">
        <span class="dot_r"> </span><a href="#" target="_blank">更多&gt;&gt;</a>
    </h3>
</div>