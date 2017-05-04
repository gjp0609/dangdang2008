<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title><s:property value="product.title"/> - 图书 - 当当网</title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <link href="<s:url value="../product_files/dangdang.css"/>" type=text/css rel=Stylesheet>
    <link href="<s:url value="../product_files/book.css"/>" type=text/css rel=stylesheet>
    <script type="text/javascript" src="<s:url value="../js/jquery-1.7.2.min.js"/>"></script>
    <script type="text/javascript">
        $(function () {
            smap = "<s:property value="#session.books"/>";
        });
        function addProduct(productId) {
            $.ajax("<s:url namespace="/order" action="addToCart"/>?product.id=" + productId);
            $(function () {
                var map = "<s:property value="#session.books"/>";
                alert(smap)
                alert(map)
            })

        }
    </script>
</head>
<body>

<%--<div id="tag_box" style="DISPLAY: none; Z-INDEX: 10; POSITION: absolute"></div>--%>
<%--<div id="div_shield"></div>--%>
<div id="main">
    <div class="mainsearch"></div>
    <div class="wrap"><!--left start-->
        <!--left end-->
        <div class="right">
            <div class="right_wai">
                <div class="shuming">
                    <div class="shuming_left"><span class="black000"><a
                            name="top_bk"></a><s:property value="product.title"/></span></div>
                    <div class="book_case"><span class="seriesname">丛书名：
                        <s:property value="product.series"/>
                    </span></div>
                    <div class="empty_box"></div>
                </div>
                <div class="book_left">
                    <div class="book_pic">
                        <img class="pic" id="img_show_prd" src="../<s:property value="product.imgSrc"/>" width="140px">
                    </div>
                    <input id="hid_largepictureurl" type="hidden"/></div>
                <div class="book_right">
                    <div id="author_">作 　 者：<s:property value="product.author"/></div>
                    <div id="publisher_">出 版 社： <s:property value="product.publisher"/></div>
                    <UL>
                        <LI>出版时间： <s:date name="product.publishTime" format="yyyy-MM-dd"/></LI>
                        <LI>字　　数： <s:property value="product.wordCount"/>万</LI>
                        <LI>版　　次： <s:property value="product.publishEdtion"/></LI>
                        <LI>页　　数： <s:property value="product.pageCount"/></LI>
                        <LI>印刷时间： <s:date name="product.printTime" format="yyyy-MM-dd"/></LI>
                        <LI>开　　本： <s:property value="product.bookSize"/>开</LI>
                        <LI>印　　次： <s:property value="product.printEdtion"/></LI>
                        <LI>纸　　张： <s:property value="product.paper"/></LI>
                        <LI>I S B N： <s:property value="product.isbn"/></LI>
                        <LI>包　　装： <s:property value="product.pack"/></LI>
                    </UL>
                    <div id="__categroy_bk">所属分类：图书 >>
                        <s:action namespace="/category" name="findParent" executeResult="true">
                            <s:param name="id" value="product.category.id"/>
                        </s:action></div>
                    <div class="jiage"><span class="gray87">定价：<span class="del" id="originalPriceTag">
                        ￥<s:property value="product.realPrice"/></span></span>
                        <span class="redc30">当当价：￥<B><s:property value="product.price"/></B></span>
                        节省：￥<s:property value="product.realPrice-product.price"/>
                        <div class="pd_buy_num">
                            <div class="clear"></div>
                        </div>
                        <div class="goumai">
                            <a title="购买" onclick="addProduct(<s:property value="product.id"/>)"
                               name="purchase_book">
                                <img id="buy" src="../product_files/booksale.gif"><span
                                    id="cartInfo_<s:property value="product.id"/>"></span></a>
                        </div>
                    </div>
                </div>
                <div id="dvTPUrls"></div>
                <div id="__zhinengbiaozhu_bk">
                    <div class="dashed"></div>
                    <h2 class="black14"><img src="../product_files/bg_point1.gif" align="absMiddle">
                        编辑推荐</H2>
                    <div class="zhengwen">
                        <s:property value="product.recommend"/>
                    </div>
                    <div class="dashed"></div>
                    <h2 class="black14"><img src="../product_files/bg_point1.gif" align="absMiddle">
                        内容简介</H2>
                    <div class="zhengwen"><s:property value="product.details"/></div>
                    <div class="dashed"></div>
                    <h2 class="black14"><img src="../product_files/bg_point1.gif" align="absMiddle">
                        作者简介</H2>
                    <div class="zhengwen"><s:property value="product.author"/>
                        <s:property value="product.authorDetails"/></div>
                    <div class="dashed"></div>
                    <h2 class="black14"><img src="../product_files/bg_point1.gif" align="absMiddle">
                        目录</H2>
                    <div class="zhengwen"><s:property value="product.catalogue"/></div>
                    <div class="dashed"></div>
                    <h2 class="black14"><img src="../product_files/bg_point1.gif" align="absMiddle">
                        媒体评论</H2>
                    <div class="zhengwen"><s:property value="product.commend"/></div>
                    <div class="dashed"></div>
                    <h2 class="black14"><img src="../product_files/bg_point1.gif" align="absMiddle">
                        书摘插图</H2>
                    <div class="zhengwen">
                        <s:property value="product.digest"/>
                    </div>
                </div>
                <a name="review_point"></a>
            </div>
        </div>
        <div id="tag_box" style="display: none; z-index: 2; position: absolute;">
        </div>
        <div id="tag_box_pay" style=" DISPLAY: none; Z-INDEX: 2; POSITION: absolute; ">
        </div>
        <div id="div_shield"></div><!--页尾 开始 -->
        <div class="public_footer_add_s"></div><!--09.3.10new-->
        <!--页尾 end -->
        <!--页尾开始 -->
        <%@include file="../common/foot.jsp" %>
        <!--页尾结束 -->
    </div>
</div>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script>
    $(".pic").mouseover(function () {
        var src = this.src;
        var tooltip = "<div id='tooltip''><img width='300px' " +
            "src='' alt='产品预览图'/><\/div>"; //创建 div 元素
        $("body").append(tooltip);  //把它追加到文档中
        $("#tooltip").find("img").attr("src", src);
    }).mousemove(function () {
        var event = window.event;
        var left = event.clientX + 10;
        var top = event.clientY - 200;
        var img = $("#tooltip");
        img.css("display", "block");
        img.css("position", "fixed");
        img.css("left", left + "px");
        img.css("top", top + "px");
    }).mouseout(function () {
        $("#tooltip").remove();
    });

</script>

</body>
</html>
