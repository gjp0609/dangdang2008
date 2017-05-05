<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>当当图书 – 全球最大的中文网上书店</title>
    <link href="../css/book.css" rel="stylesheet" type="text/css"/>
    <link href="../css/second.css" rel="stylesheet" type="text/css"/>
    <link href="../css/secBook_Show.css" rel="stylesheet" type="text/css"/>
    <link href="../css/shopping_vehicle.css" rel="stylesheet" type="text/css"/>
    <script src="../js/jquery-1.7.2.min.js"></script>
</head>
<body>
<br/>
<br/>
<div class="my_shopping">
    <img class="pic_shop" src="../images/pic_myshopping.gif" alt=""/>

</div>
<div id="div_choice" class="choice_merch">
    <h2 id="cart_tips">
        您已选购以下商品
    </h2>
    <div class="choice_bord">
        <table class="tabl_buy" id="tbCartItemsNormal">
            <tr class="tabl_buy_title" style="text-align: center">
                <td class="buy_td_6">
                    <span>&nbsp;</span>
                </td>
                <td>
                    <span class="span_w1">商品名</span>
                </td>
                <td class="buy_td_5">
                    <span class="span_w2">市场价</span>
                </td>
                <td class="buy_td_4">
                    <span class="span_w3">当当价</span>
                </td>
                <td class="buy_td_3">
                    <span>变更数量</span>
                </td>
                <td class="buy_td_1">
                    <span>删除</span>
                </td>
            </tr>
            <tr class='objhide' over="no">
                <td colspan="8">
                    &nbsp;
                </td>
            </tr>

            <!-- 购物列表开始 -->
            <s:iterator value="#session.items" var="item" status="st">
                <s:if test='#item.value.status.equals("Y")'>
                    <tr class='td_no_bord'>
                        <td style='display: none'><s:property value="#item.key"/></td>
                        <td class="buy_td_6">
                            <span class="objhide"><img/> <s:property value="#st.count"/> </span>
                        </td>
                        <td>
                            <a href="#"><s:property value="#item.value.product.title"/></a>
                        </td>
                        <td class="buy_td_5">
                            <span class="c_gray">￥<s:property value="#item.value.product.realPrice"/></span>
                        </td>
                        <td class="buy_td_4">
                            &nbsp; <span>￥<s:property value="#item.value.product.price"/></span>
                        </td>
                        <td class="buy_td_1">
                                <%-- 减 --%>
                            <a href="<s:url namespace='/cart' action='updateCart'>
                                    <s:param name="product.id" value="#item.key"/>
                                    <s:param name="count" value="-1"/>
                                  </s:url>"><input class="subtract" type="button" value="－"/></a>
                                <%-- 值 --%>
                            <input class="del_num" type="text" size="3" maxlength="3"
                                   value="<s:property value="#item.value.count"/>"/>
                                <%-- 加 --%>
                            <a href="<s:url namespace='/cart' action='updateCart'>
                                    <s:param name="product.id" value="#item.key"/>
                                    <s:param name="count" value="1"/>
                                 </s:url>"><input class="subtract" type="button" value="＋"/></a>
                        </td>
                        <td>
                            <a href="<s:url namespace='/cart' action='deleteFromCart'/>?product.id=<s:property value="#item.key"/>">删除</a>
                        </td>
                    </tr>
                </s:if>
            </s:iterator>
            <!-- 购物列表结束 -->
        </table>

        <div class="choice_balance">
            <div class="select_merch">
                <a href='../main/main.jsp'> 继续挑选商品>></a>
            </div>
            <div class="total_balance">
                <div class="save_total">
                    您共节省：
                    <span class="c_red">￥<span id="total_economy">0</span>
                    </span>
                    <span style="font-size: 14px">|</span>
                    <span class="t_add">商品金额总计：</span>
                    <span class="c_red_b"> ￥<span id='total_account'>0</span>
                    </span>
                </div>
                <div id="balance" class="balance">
                    <a name='checkout' href='../order/order_info.jsp'>
                        <img src="../images/butt_balance.gif" alt="结算" border="0" title="结算"/>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 用户删除恢复区 -->
<div id="divCartItemsRemoved" class="del_merch">
    <div class="del_title">
        您已删除以下商品，如果想重新购买，请点击“恢复”
    </div>
    <table class=tabl_del id=del_table>
        <tbody>

        <s:else>
            <tr>
                <td width="58" class=buy_td_6>
                    &nbsp;
                </td>
                <td width="365" class=t2>
                    <a href="#"><s:property value="#item.value.product.title"/></a>
                </td>
                <td width="106" class=buy_td_5>
                    ￥<s:property value="#item.value.product.realPrice"/>
                </td>
                <td width="134" class=buy_td_4>
                    <span>￥<s:property value="#item.value.product.price"/></span>
                </td>
                <td width="56" class=buy_td_1>
                    <a href="<s:url namespace='/cart' action='deleteFromCart'/>?product.id=<s:property value="#item.key"/>">恢复</a>
                </td>
                <td width="16" class=objhide>
                    &nbsp;
                </td>
            </tr>
        </s:else>

        <tr class=td_add_bord>
            <td colspan=8>
                &nbsp;
            </td>
        </tr>


        </tbody>
    </table>
</div>

<%-- 购物车为空提示信息 --%>
<div id="div_no_choice" class="objhide">
    <div class="no_select" style="margin-left: 400px">
        您还没有挑选商品 &nbsp; &nbsp; &nbsp; <a href="<s:url value="../main/main.jsp"/>">去购物</a>
    </div>
</div>

<br/>
<br/>
<br/>
<br/>
<!--页尾开始 -->
<%@include file="../common/foot.jsp" %>
<!--页尾结束 -->


<script>
    $(function () {
        var items = "<s:property value="#session.items"/>";
        if (items === "") {
            $("#div_choice").hide();
            $("#divCartItemsRemoved").hide();
            $("#div_no_choice").show();
        }
    });

    $(function () {
//        $(".del_num").
    });


    //    function subtract(sub) {
    //        var count = $(sub).next();
    //        var count = parent.find(":input[class='del_num']");
    //        if (count.val() !== "1") {
    //            count.val(parseInt(count.val()) - 1);
    //        }
    //    }
    //    function add(sub) {
    //        var count = $(sub).prev();
    //        var ct = $(sub).parent().prev().find("span").text();
    //        var count = parent.find(":input[class='del_num']");
    //        if (count.val() !== "1") {
    //            count.val(parseInt(count.val()) + 1);
    //        }
    //    }

</script>
</body>
</html>



