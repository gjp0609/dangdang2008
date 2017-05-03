<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html;charset=utf-8" %>
<div class="book_l_border1" id="__FenLeiLiuLan">
    <div class="book_sort_tushu">
        <h2>
            分类浏览
        </h2>
        <!--1级分类开始-->
        <s:iterator var="category" value="categoryList">
            <div class="bg_old" onmouseover="this.className = 'bg_white';"
                 onmouseout="this.className = 'bg_old';">
                <s:if test="#category.parentCategory==null">
                    <h3>
                        [<a href='<s:url value="book_list.jsp"><s:param name="cateId" value="#category.id"/></s:url>'>
                        <s:property value="#category.name"/></a>]
                    </h3>
                    <ul class="ul_left_list">
                        <!--2级分类开始-->
                        <s:iterator value="#category.categoryList" var="cate">
                            <li>
                                <a href='<s:url value="book_list.jsp"><s:param name="cateId" value="#cate.id"/></s:url>'>
                                    <s:property value="#cate.name"/></a>
                            </li>
                        </s:iterator>
                        <!--2级分类结束-->
                    </ul>
                    <div class="empty_left">
                    </div>
                </s:if></div>
        </s:iterator>
        <div class="more2">
        </div>
        <!--1级分类结束-->
        <div class="bg_old">
            <h3>
                &nbsp;
            </h3>
        </div>
    </div>
</div>
