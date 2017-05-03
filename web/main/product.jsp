<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" pageEncoding="utf-8" %>
<HTML>
<HEAD>
    <TITLE><s:property value="product.title"/> - 图书 - 当当网</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK href="<s:url value="../product_files/dangdang.css"/>" type=text/css rel=Stylesheet>
    <LINK href="<s:url value="../product_files/book.css"/>" type=text/css rel=stylesheet>
    <script type="text/javascript" src="<s:url value="../js/jquery-1.7.2.min.js"/>"></script>
    <script type="text/javascript">
        function addProduct(img, productId) {
            $("#buy").css("display", "none");
            $("#cartInfo_" + productId).html('<img align="bottom" src="../images/load.gif" width="14" height="14" style="display:inline" align="bottom"/>&nbsp;购买中...');
            $.getJSON("../cart/addItem.action",
                {id: productId, time: (new Date()).getTime()},
                function (json) {
                    if (json.count === 0) {
                        //没有添加成功
                        $("#buy").css("display", "block");
                        $("#cartInfo_" + productId).html('<img align="bottom" src="../images/wrong.gif" width="14" height="14" style="display:inline" align="bottom"/>&nbsp;<span style="color:red">购买失败</span>');
                    }
                    else {
                        //添加成功
                        $("#cartInfo_" + productId).html('<img align="bottom" src="../images/right.gif" width="14" height="14" style="display:inline" align="bottom"/>&nbsp;购买成功');
                        var timeId = setTimeout(function () {
                            clearTimeout(timeId);
                            $("#buy").css("display", "block");
                            $("#cartInfo_" + productId).html("");
                        }, 2000);
                    }
                }
            );
        }
    </script>
</HEAD>
<BODY>

<%--<DIV id="tag_box" style="DISPLAY: none; Z-INDEX: 10; POSITION: absolute"></DIV>--%>
<%--<DIV id="div_shield"></DIV>--%>
<DIV id="main">
    <DIV class="mainsearch"></DIV>
    <DIV class="wrap"><!--left start-->
        <!--left end-->
        <DIV class="right">
            <DIV class="right_wai">
                <DIV class="shuming">
                    <DIV class="shuming_left"><SPAN class="black000"><A
                            name="top_bk"></A><s:property value="product.title"/></SPAN></DIV>
                    <DIV class="book_case"><SPAN class="seriesname">丛书名：
                        <s:property value="product.series"/>
                    </SPAN></DIV>
                    <DIV class="empty_box"></DIV>
                </DIV>
                <DIV class="book_left">
                    <DIV class="book_pic">
                        <IMG class="pic" id="img_show_prd" src="../<s:property value="product.imgSrc"/>" width="140px">
                    </DIV>
                    <INPUT id="hid_largepictureurl" type="hidden"/></DIV>
                <DIV class="book_right">
                    <DIV id="author_">作 　 者：<s:property value="product.author"/></DIV>
                    <DIV id="publisher_">出 版 社： <s:property value="product.publisher"/></DIV>
                    <UL>
                        <LI>出版时间： <s:date name="product.publishTime" format="yyyy-MM-dd"/></LI>
                        <LI>字　　数： <s:property value="product.wordCount"/>万</LI>
                        <LI>版　　次： <s:property value="product.publishEdtion"/></LI>
                        <LI>页　　数： <s:property value="product.pageCount"/></LI>
                        <LI>印刷时间： <s:date name="product.printTime" format="yyyy-MM-dd"/></LI>
                        <LI>开　　本： <s:property value="product.bookSize"/>开</LI>
                        <LI>印　　次： <s:property value="product.printEdtion"/></LI>
                        <LI>纸　　张： <s:property value="product.paper"/></LI>
                        <LI>I S B N：<s:property value="product.isbn"/></LI>
                        <LI>包　　装： <s:property value="product.pack"/></LI>
                    </UL>
                    <DIV id="__categroy_bk">所属分类：图书 >>
                        <s:action namespace="/category" name="findParent" executeResult="true">
                            <s:param name="id" value="product.category.id"/>
                        </s:action></DIV>
                    <DIV class="jiage"><SPAN class="gray87">定价：<SPAN class="del" id="originalPriceTag">
                        ￥<s:property value="product.realPrice"/></SPAN></SPAN>
                        <SPAN class="redc30">当当价：￥<B><s:property value="product.price"/></B></SPAN>
                        节省：￥<s:property value="product.realPrice-product.price"/>
                        <DIV class="pd_buy_num">
                            <DIV class="clear"></DIV>
                        </DIV>
                        <DIV class="goumai">
                            <A title="购买" onclick="addProduct(this,<s:property value="product.id"/>)"
                               name="purchase_book">
                                <IMG id="buy" src="../product_files/booksale.gif"><span
                                    id="cartInfo_<s:property value="product.id"/>"></span></A>
                            <!--  <A id="favor" title=收藏 href="#" name=wishlist_book>
                            <IMG id="imgfavor" src="../product_files/bookz_save.gif"></A>
                            -->
                        </DIV>
                    </DIV>
                </DIV>
                <DIV id="dvTPUrls"></DIV>
                <DIV id="__zhinengbiaozhu_bk">
                    <DIV class="dashed"></DIV>
                    <H2 class="black14"><IMG src="../product_files/bg_point1.gif" align="absMiddle">
                        编辑推荐</H2>
                    <DIV class="zhengwen">
                        <s:property value="product.recommend"/>
                    </DIV>
                    <DIV class="dashed"></DIV>
                    <H2 class="black14"><IMG src="../product_files/bg_point1.gif" align="absMiddle">
                        内容简介</H2>
                    <DIV class="zhengwen"><s:property value="product.details"/></DIV>
                    <DIV class="dashed"></DIV>
                    <H2 class="black14"><IMG src="../product_files/bg_point1.gif" align="absMiddle">
                        作者简介</H2>
                    <DIV class="zhengwen"><s:property value="product.author"/>
                        <s:property value="product.authorDetails"/></DIV>
                    <DIV class="dashed"></DIV>
                    <H2 class="black14"><IMG src="../product_files/bg_point1.gif" align="absMiddle">
                        目录</H2>
                    <DIV class="zhengwen"><s:property value="product.catalogue"/></DIV>
                    <DIV class="dashed"></DIV>
                    <H2 class="black14"><IMG src="../product_files/bg_point1.gif" align="absMiddle">
                        媒体评论</H2>
                    <DIV class="zhengwen"><s:property value="product.commend"/></DIV>
                    <DIV class="dashed"></DIV>
                    <H2 class="black14"><IMG src="../product_files/bg_point1.gif" align="absMiddle">
                        书摘插图</H2>
                    <DIV class="zhengwen">
                        <s:property value="product.digest"/>
                    </DIV>
                </DIV>
                <A name="review_point"></A>
            </DIV>
        </DIV>
        <DIV id="tag_box" style="DISPLAY: none; Z-INDEX: 2; POSITION: absolute;">
        </DIV>
        <DIV id="tag_box_pay" style=" DISPLAY: none; Z-INDEX: 2; POSITION: absolute; ">
        </DIV>
        <DIV id="div_shield"></DIV><!--页尾 开始 -->
        <DIV class="public_footer_add_s"></DIV><!--09.3.10new-->
        <!--页尾 end -->
        <!--页尾开始 -->
        <%@include file="../common/foot.jsp" %>
        <!--页尾结束 -->
    </DIV>
</DIV>
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

</BODY>
</HTML>
