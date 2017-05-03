<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html;charset=utf-8" %>
<h2>
    <span class="more"><a href="#" target="_blank">更多&gt;&gt;</a> </span>最新上架图书
</h2>
<div class="book_c_04">
    <s:iterator value="productList" var="book">
        <div class="second_d_wai">
            <div class="img">
                <a href="<s:url namespace="/product" action="bookDetails">
                            <s:param name="id" value="#book.id"/></s:url>" target='_blank'>
                    <img src="../<s:property value="#book.imgSrc"/>" border=0/> </a>
            </div>
            <div class="shuming">
                <a href="<s:url namespace="/product" action="bookDetails">
                            <s:param name="id" value="#book.id"/></s:url>" target="_blank"><s:property value="#book.title"/></a>
                <a href="#" target="_blank"></a>
            </div>
            <div class="price">
                定价：￥<s:property value="#book.realPrice"/>
            </div>
            <div class="price">
                当当价：￥<s:property value="#book.price"/>
            </div>
        </div>
        <div class="book_c_xy_long"></div>
    </s:iterator>

</div>
<div class="clear"></div>