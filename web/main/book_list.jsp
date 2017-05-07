<%@page contentType="text/html;charset=utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>当当图书 – 全球最大的中文网上书店</title>
    <link href="../css/book.css" rel="stylesheet" type="text/css"/>
    <link href="../css/second.css" rel="stylesheet" type="text/css"/>
    <link href="../css/secBook_Show.css" rel="stylesheet" type="text/css"/>
    <link href="../css/list.css" rel="stylesheet" type="text/css"/>
    <style>
        .debugTable tr td {
            width: 500px;
        }
    </style>


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
    <a href='<s:url value="main.jsp"/>'>当当图书 </a> >>
    <span style='color: #cc3300'><strong>
        <s:action namespace="/category" name="findParent" executeResult="true">
            <s:param name="id" value="product.category.id"/>
        </s:action></strong> </span>
</div>

<div class="book">

    <!--左栏开始-->
    <s:action namespace="/category" name="findChildren" executeResult="true">
        <s:param name="id" value="product.category.id"/>
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

                <select id="type" title="" name='type' size='1'
                        class='list_r_title_ml'>
                    <option selected value="publishTime">按上架时间</option>
                    <option value="count">按销量</option>
                    <option value="price">按价格</option>
                    <option value="star">按评分</option>
                </select>
                <select id="order" title="" name='order' size='1'
                        class='list_r_title_ml'>
                    <option selected value="1">升序</option>
                    <option value="-1">降序</option>
                </select>
                <div id="divTopPageNavi" class="list_r_title_text3">

                    <!--分页导航开始-->

                    <s:if test="page.hasPrePage">
                        <div class='list_r_title_text3a'>
                            <a name=link_page_next
                               href="<s:url namespace="/product" action="bookList">
                               <s:param name="type" value="type"/>
                               <s:param name="order" value="order"/>
                               <s:param name="product.category.id" value="product.category.id"/>
                               <s:param name="page.pageIndex" value="page.pageIndex-1"/></s:url>">
                                <img src='../images/page_up.gif'/> </a>
                        </div>
                    </s:if>
                    <s:else>
                        <div class='list_r_title_text3a'>
                            <img src='../images/page_up_gray.gif'/>
                        </div>
                    </s:else>

                    <div class='list_r_title_text3b'>
                        第<s:property value="page.pageIndex"/>页/共<s:property value="page.totalPages"/>页
                    </div>

                    <s:if test="page.hasNextPage">
                        <div class='list_r_title_text3a'>
                            <a name=link_page_next
                               href="<s:url namespace="/product" action="bookList">
                               <s:param name="type" value="type"/>
                               <s:param name="order" value="order"/>
                               <s:param name="product.category.id" value="product.category.id"/>
                               <s:param name="page.pageIndex" value="page.pageIndex+1"/></s:url>">
                                <img src='../images/page_down.gif'/> </a>
                        </div>
                    </s:if>
                    <s:else>
                        <div class='list_r_title_text3a'>
                            <img src='../images/page_down_gray.gif'/>
                        </div>
                    </s:else>


                    <!--分页导航结束-->
                </div>
            </div>

            <!--商品条目开始-->
            <div class="list_r_line"></div>
            <div class="clear"></div>

            <s:iterator value="productList" var="book">
                <div class="clear"></div>
                <div class="list_r_list">
                <span class="list_r_list_book"><a name="link_prd_img"
                                                  href='<s:url namespace="/product" action="bookDetails">
                            <s:param name="id" value="#book.id"/></s:url>'>
                    <img class="pic" src="../<s:property value="#book.imgSrc"/>"/> </a> </span>
                    <h2>
                        <a name="link_prd_name" href='<s:url namespace="/product" action="bookDetails">
                            <s:param name="id" value="#book.id"/></s:url>'>
                            <s:property value="#book.title"/></a>
                    </h2>
                    <h3>
                        顾客评分：<s:property value="#book.star"/>
                    </h3>
                    <h4 class="list_r_list_h4">
                        作 者:
                        <a href='#' name='作者'><s:property value="#book.author"/></a>
                    </h4>
                    <h4>
                        出版社：
                        <a href='#' name='出版社'><s:property value="#book.publisher"/></a>
                    </h4>
                    <h4>
                        出版时间：<s:date name="#book.publishTime" format="yyyy-MM-dd"/>
                    </h4>
                    <h5>
                        <s:property value="#book.details"/>
                    </h5>
                    <div class="clear"></div>
                    <h6>
                        <span class="del">￥<s:property value="#book.realPrice"/></span>
                        <span class="red">￥<s:property value="#book.price"/></span>
                        节省：￥<s:property value="#book.realPrice-#book.price"/>
                    </h6>
                    <span class="list_r_list_button">
                    <a href="javascript:void(0)" onclick="addProduct(<s:property value="#book.id"/>)"><img
                            src='<s:url value="../images/buttom_goumai.gif"/>'/> </a>
                    <%--<span id="cartinfo"></span>--%>
                </span>
                </div>
                <div class="clear"></div>
            </s:iterator>
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

<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script>
    var type = '<s:property value="type"/>';
    var order = '<s:property value="order"/>';
    $(function () {
        if (type === "publishTime") {
            $("#type").find("option[value='publishTime']").attr("selected", "selected");
        } else if (type === "count") {
            $("#type").find("option[value='count']").attr("selected", "selected");
        } else if (type === "price") {
            $("#type").find("option[value='price']").attr("selected", "selected");
        } else if (type === "star") {
            $("#type").find("option[value='star']").attr("selected", "selected");
        }
        if (order === '1') {
            $("#order").find("option[value='1']").attr("selected", "selected");
        } else if (order === '-1') {
            $("#order").find("option[value='-1']").attr("selected", "selected");
        }
    });
    var id = '<s:property value="product.category.id"/>';
    $("select").change(function () {
        type = $("#type").find("option:selected").val();
        order = $("#order").find("option:selected").val();
        window.location.href = '<s:url namespace="/product" action="bookList"/>?order='
            + order + '&type=' + type + '&product.category.id=' + id;
    });

</script>

<script>
    $(".pic").mouseover(function () {
        var src = this.src;
        // 新建 div
        var tooltip = "<div id='tooltip'><img width='300px' src=''/><\/div>";
        // 把它追加到文档中
        $("body").append(tooltip);
        $("#tooltip").find("img").attr("src", src);
    }).mousemove(function () {// 鼠标移动
        // 新建事件
        var event = window.event;
        // 获取鼠标位置
        var left = event.clientX + 10;
        var top = event.clientY - 200;
        var img = $("#tooltip");
        // 设置图片属性
        img.css("display", "block");
        img.css("position", "fixed");
        // 设置位置
        img.css("left", left + "px");
        img.css("top", top + "px");
    }).mouseout(function () {
        // 离开时移除
        $("#tooltip").remove();
    });

    function addProduct(productId) {
        $.ajax("<s:url namespace="/cart" action="updateCart"/>?product.id=" + productId + "&count=1");
        alert("已加入购物车");
    }

</script>

<s:debug class="ee"/>
</body>
</html>
