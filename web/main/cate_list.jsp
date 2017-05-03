<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="left" class="book_left">
    <div id="__fenleiliulan">
        <div class=second_l_border2>
            <h2>分类浏览</h2>
            <ul>
                <li>
                    <div>
                        <div class="second_fenlei">
                            <s:if test='#parameters.cateId[0]==category.id'>
                                <a style="color: red"
                                   href="<s:url value="book_list.jsp"><s:param name="cateId" value="category.id"/></s:url>">
                                    &middot; <s:property value="category.name"/>&nbsp;
                                    (<s:property value="category.count"/>)</a>
                            </s:if>
                            <s:else>
                                <a href="<s:url value="book_list.jsp"><s:param name="cateId" value="category.id"/></s:url>">
                                    &middot; <s:property value="category.name"/>&nbsp;
                                    (<s:property value="category.count"/>)</a>
                            </s:else>
                        </div>
                    </div>
                </li>
                <div class="clear"></div>

                <!--2级分类开始-->
                <s:iterator value="category.categoryList" var="cate">
                    <li>
                        <div>
                            <div class="second_fenlei"> &middot;</div>
                            <div class="second_fenlei">
                                <s:if test="#parameters.cateId[0]==#cate.id">
                                    <a style="color: red" href="<s:url value="book_list.jsp">
                                            <s:param name="cateId" value="#cate.id"/></s:url>">
                                        <s:property value="#cate.name"/>&nbsp;(<s:property value="#cate.count"/>)</a>
                                </s:if>
                                <s:else>
                                    <a href="<s:url value="book_list.jsp">
                                             <s:param name="cateId" value="#cate.id"/></s:url>">
                                        <s:property value="#cate.name"/>&nbsp;(<s:property value="#cate.count"/>)</a>
                                </s:else>
                            </div>
                        </div>
                    </li>
                    <div class="clear"></div>
                </s:iterator>
                <!--2级分类结束-->

                <li>
                    <div></div>
                </li>
            </ul>
        </div>
    </div>
</div>