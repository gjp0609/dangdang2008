<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html;charset=utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>生成订单 - 当当网</title>
    <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    <link href="../css/page_bottom.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<%@include file="../common/head1.jsp" %>
<div class="login_step">
    生成订单骤: 1.确认订单 >
    <span class="red_bold"> 2.填写送货地址</span> > 3.订单成功
</div>
<div class="fill_message">
    <p>
        选择地址：
        <select id="address">
            <option value="0">
                填写新地址
            </option>
            <s:iterator var="ad" value="addressList">
                <option value="<s:property/>">
                    <s:property/>
                </option>
            </s:iterator>
        </select>
    </p>
    <form name="ctl00" method="post" action="<s:url namespace="/order" action="checkAddress"/>" id="f">
        <input type="hidden" name="address.id" id="addressId"/>
        <table class="tab_login">
            <tr>
                <td valign="top" class="w1">
                    收件人姓名：
                </td>
                <td>
                    <input type="text" class="text_input" name="address.name"
                           id="receiveName" value="<s:property value="address.name"/>">
                    <div class=" text_left" id="nameValidMsg">
                        <p>
                            请填写有效的收件人姓名
                        </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    收件人详细地址：
                </td>
                <td>
                    <input type="text" name="address.address" class="text_input"
                           id="fullAddress" value="<s:property value="address.address"/>">
                    <div class="text_left" id="addressValidMsg">
                        <p>
                            请填写有效的收件人的详细地址
                        </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    邮政编码
                </td>
                <td>
                    <input type="text" class="text_input" name="address.code"
                           id="postalCode" value="<s:property value="address.code"/>">
                    <div class="text_left" id="codeValidMsg">
                        <p>
                            请填写有效的收件人的邮政编码
                        </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    电话
                </td>
                <td>
                    <input type="text" class="text_input" name="address.tphone"
                           id="phone" value="<s:property value="address.tphone"/>">
                    <div class="text_left" id="phoneValidMsg">
                        <p>
                            请填写有效的收件人的电话
                        </p>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    手机
                </td>
                <td>
                    <input type="text" class="text_input" name="address.mphone"
                           id="mobile" value="<s:property value="address.mphone"/>">
                    <div class="text_left" id="mobileValidMsg">
                        <p>
                            请填写有效的收件人的手机
                        </p>
                    </div>
                </td>
            </tr>
        </table>

        <div class="login_in">

            <a href="order_info.jsp"><input id="btnClientRegisterCancel" class="button_1" name="submit"
                                            type="reset" value="取消"/></a>

            <input id="btnClientRegister" class="button_1" name="submit"
                   type="submit" value="下一步"/>
        </div>
    </form>
</div>
<%@include file="../common/foot1.jsp" %>
<script src="<s:url value="../js/jquery-1.7.2.min.js"/>"></script>
<script>
    $("#address").change(function () {
        window.location.href = "<s:url namespace="/order" action="toAddress"/>?addressId=" + $("#address").val();
    });
    $(function () {
        var idd = "<s:property value="#parameters.addressId[0]"/>";
        $("#addressId").val(idd);
        if (idd !== "0") {
            $("#address").find("input[value]").attr("readonly", "readonly");
        }
        $("#address").find("option").each(function () {
            if ($(this).val() === idd) {
                $(this).attr("selected", "selected");
            }
        });
    });
</script>
<s:debug/>
</body>
</html>

