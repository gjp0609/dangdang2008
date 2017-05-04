<%@page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>当当图书 – 全球最大的中文网上书店</title>
    <link href="../css/book.css" rel="stylesheet" type="text/css"/>
    <link href="../css/second.css" rel="stylesheet" type="text/css"/>
    <link href="../css/secBook_Show.css" rel="stylesheet" type="text/css"/>
    <style>
        .debugTable tbody tr td:first-child {
            width: 80px;
        }

    </style>
</head>
<body>

&nbsp;
<!-- 头部开始 -->
<%@include file="../common/head.jsp" %>
<!-- 头部结束 -->

<span id="asd123"></span>

<div style="width: 962px; margin: auto;">
    <a href="#" target="_blank"><img src="../images/default/book_banner_081203.jpg" border="0"/> </a>
</div>

<div class="book">

    <!--左栏开始-->
    <div id="left" class="book_left">
        <s:action namespace="/category" name="findCategories" executeResult="true"/>
    </div>
    <!--左栏结束-->

    <!--中栏开始-->
    <div class="book_center">

        <!--推荐图书开始-->
        <div class=second_c_border1 id="recommend">
            <s:action namespace="/product" name="recommendBooks" executeResult="true"/>
        </div>
        <!--推荐图书结束-->

        <!--热销图书开始-->
        <div class="book_c_border2" id="hot">
            <s:action namespace="/product" name="findBooksOrderByXX" executeResult="true">
                <s:param name="type" value='"count"'/>
            </s:action>
        </div>
        <!--热销图书结束-->

        <!--最新上架图书开始-->
        <div class="book_c_border2" id="new">
            <s:action namespace="/product" name="findBooksOrderByXX" executeResult="true">
                <s:param name="type" value='"publishTime"'/>
            </s:action>
        </div>

        <!--最新上架图书结束-->

        <div class="clear">
        </div>
    </div>
    <!--中栏结束-->


    <!--右栏开始-->
    <div class="book_right">
        <div class="book_r_border2" id="__XinShuReMai">
            <div class="book_r_b2_1x" id="new_bang">

                <s:action namespace="/product" name="findBooksOrderByXX" executeResult="true">
                    <s:param name="type" value='"newAndHot"'/>
                </s:action>

            </div>
        </div>
    </div>
    <!--右栏结束-->
    <div class="clear"></div>
</div>

<!--页尾开始 -->
<%@include file="../common/foot.jsp" %>
<!--页尾结束 -->
<footer>
    <s:debug/>
</footer>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
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

</script>

</body>

</html>
