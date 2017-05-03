<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>当当图书 – 全球最大的中文网上书店</title>
    <link href="../css/book.css" rel="stylesheet" type="text/css"/>
    <link href="../css/second.css" rel="stylesheet" type="text/css"/>
    <link href="../css/secBook_Show.css" rel="stylesheet" type="text/css"/>
    <link href="../css/list.css" rel="stylesheet" type="text/css"/>
</head>
<body>
&nbsp;

<!-- 头部开始 -->
<%@include file="../common/head.jsp" %>
<!-- 头部结束 -->

<div style="width: 962px; margin: auto;">
    <a href="#"><img src="../images/default/book_banner_081203.jpg" border="0"/> </a>
</div>
<div class='your_position'>
    您现在的位置:&nbsp;
    <a href='#'>当当图书 </a> >>
    <span style='color: #cc3300'><strong>
        <s:action namespace="/category" name="findParent" executeResult="true">
            <s:param name="id" value="#parameters.cateId"/>
        </s:action></strong> </span>
</div>

<div class="book">

    <!--左栏开始-->
    <s:action namespace="/category" name="findChildren" executeResult="true">
        <s:param name="id" value="#parameters.cateId"/>
    </s:action>

    <!--左栏结束-->

    <!--中栏开始-->
    <div class="book_center">

        <!--图书列表开始-->
        <div id="divRight" class="list_right">

            <div id="book_list" class="list_r_title">
                <div class="list_r_title_text">
                    排序方式
                </div>

                <select title="" name='type' size='1'
                        class='list_r_title_ml'>
                    <option selected value="publishTime">按上架时间</option>
                    <option value="count">按销量</option>
                    <option value="price">按价格</option>
                </select>
                <select title="" name='order' size='1'
                        class='list_r_title_ml'>
                    <option selected value="publishTime">升序</option>
                    <option value="publishTime">降序</option>
                </select>
                <div id="divTopPageNavi" class="list_r_title_text3">

                    <!--分页导航开始-->

                    <div class='list_r_title_text3a'>
                        <a name=link_page_next
                           href="#">
                            <img src='../images/page_up.gif'/> </a>
                    </div>

                    <div class='list_r_title_text3a'>
                        <img src='../images/page_up_gray.gif'/>
                    </div>

                    <div class='list_r_title_text3b'>
                        第1页/共5页
                    </div>

                    <div class='list_r_title_text3a'>
                        <a name=link_page_next
                           href="#">
                            <img src='../images/page_down.gif'/> </a>
                    </div>

                    <div class='list_r_title_text3a'>
                        <img src='../images/page_down_gray.gif'/>
                    </div>

                    <!--分页导航结束-->
                </div>
            </div>

            <!--商品条目开始-->
            <s:action namespace="/product" name="bookList">
                <s:param name="type" value="type"/>
                <s:param name="order" value="order"/>
            </s:action>
            <!--商品条目结束-->

            <div class="clear"></div>
            <div id="divBottomPageNavi" class="fanye_bottom">
            </div>

        </div>
        <!--图书列表结束-->

    </div>
    <!--中栏结束-->
    <div class="clear"></div>
</div>

<!--页尾开始 -->
<%@include file="../common/foot.jsp" %>
<!--页尾结束 -->

<s:debug/>
</body>
</html>
