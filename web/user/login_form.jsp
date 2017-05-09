<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html;charset=utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录 - 当当网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<s:url value="../css/login.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<s:url value="../css/page_bottom.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
</head>
<body>
<%@include file="../common/head1.jsp" %>

<div class="enter_part">

    <%@include file="../common/introduce.jsp" %>

    <div class="enter_in">
        <div class="bj_top"></div>
        <div class="center">
            <div style="height: 30px; padding: 5px; color: red" id="divErrorMssage">
                <s:property value="msg"/>
            </div>
            <s:property value="msg"/>
            <div class="main">
                <h3>
                    登录当当网
                </h3>

                <form method="post" action="<s:url namespace="/user" action="login"/>" id="ctl00">
                    <ul>
                        <li>
                            <span>请输入Email地址：</span>
                            <input type="text" name="user.email" id="txtEmail" class="textbox"
                                   value="<s:property value="user.email" />"/>
                        </li>
                        <li>
                            <span class="blank">密码：</span>
                            <input type="password" name="user.password" id="txtPassword"
                                   value="<s:property value="user.password"/>" class="textbox"/>
                        </li>
                        <li>
                            <input type="submit" id="btnSignCheck" class="button_enter"
                                   value="登 录"/>
                        </li>
                    </ul>
                    <input type="hidden" name="uri" value="uri"/>
                </form>
            </div>
            <div class="user_new">
                <p>
                    您还不是当当网用户？
                </p>
                <p class="set_up">
                    <a href="register_form.jsp">创建一个新用户&gt;&gt;</a>
                </p>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/foot1.jsp" %>
<script>
    var msg = $("#divErrorMssage");
    var email = $("#txtEmail");
    var checkEmail = function () {
        if (email.get(0).value.length < 1) msg.text("请输入邮箱");
        else if (!/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(email.get(0).value)) msg.html("请输入正确的邮箱地址");
        else {
            msg.html("");
            return true;
        }
        return false;
    };

    var pwd = $("#txtPassword");
    var checkPassword = function () {
        if (pwd.get(0).value.length < 1) msg.html("请输入密码");
        else {
            msg.html("");
            return true;
        }
        return false;
    };

    function checkAll() {
        if (!checkEmail()) return false;
        else return checkPassword();
    }

    var frm = $("#ctl00");
    frm.submit(function () {
        if (checkAll()) {
            $.ajax({
                type: "post",
                url: frm.attr("action") + "?" + frm.serialize(),
                success: function (mg) {
                    if (mg !== "") {
                        msg.html(mg);
                    } else {
                        location.href = "<s:url value="../main/main.jsp"/>";
                    }
                }
            });
        }
        return false;
    });

</script>
</body>
<%--<s:debug/>--%>
</html>

