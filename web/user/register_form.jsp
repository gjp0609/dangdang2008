<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>用户注册 - 当当网</title>
    <link href="<s:url value="../css/login.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<s:url value="../css/page_bottom.css"/>" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<s:url value="../js/jquery-1.7.2.min.js"/>"></script>
</head>
<body>
<%@include file="../common/head1.jsp" %>
<div class="login_step">
    注册步骤:
    <span class="red_bold">1.填写信息</span> > 2.验证邮箱 > 3.注册成功
</div>
<div class="fill_message">
    <form name="ctl00" method="post" action="<s:url namespace="/user" action="register"/>" id="frm">
        <h2>
            以下均为必填项 <span id="msg" style="color:red"> <s:property value="msg"/></span>
        </h2>
        <table class="tab_login">
            <tr>
                <td valign="top" class="w1">
                    请填写您的Email地址：
                </td>
                <td>
                    <input name="user.email" type="text" id="txtEmail" class="text_input"
                           value="<s:property value="user.email"/>"/>
                    <div class="text_left" id="emailValidMsg">
                        <p>
                            请填写有效的Email地址，在下一步中您将用此邮箱接收验证邮件。
                        </p>
                        <span id="email_info" style="color:red"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    设置您在当当网的昵称：
                </td>
                <td>
                    <input name="user.nickname" type="text" id="txtNickName"
                           value="<s:property value="user.nickname"/>" class="text_input"/>
                    <div class="text_left" id="nickNameValidMsg">
                        <p>
                            您的昵称可以由小写英文字母、中文、数字组成，
                        </p>
                        <p>
                            长度4－20个字符，一个汉字为两个字符。
                        </p>
                        <span id="name_info" style="color:red"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    设置密码：
                </td>
                <td>
                    <input name="user.password" type="password" id="txtPassword"
                           value="<s:property value="user.password"/>" class="text_input"/>
                    <div class="text_left" id="passwordValidMsg">
                        <p>
                            您的密码可以由大小写英文字母、数字组成，长度6－20位。
                        </p>
                        <span id="password_info" style="color:red"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    再次输入您设置的密码：
                </td>
                <td>
                    <input name="rePwd" type="password" id="txtRepeatPass"
                           value="<s:property value="rePwd"/>" class="text_input"/>
                    <div class="text_left" id="repeatPassValidMsg">
                        <span id="password1_info" style="color:red"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="w1">
                    验证码：
                </td>
                <td>
                    <img class="yzm_img" id='imgVcode' src="<s:url namespace="/common" action="getVcode"/>"/>
                    <input name="code" type="text" id="txtVerifyCode" class="yzm_input"/>
                    <div class="text_left t1">
                        <p class="t1">
                            <span id="vcodeValidMsg">请输入图片中的四个字母。</span>
                            <span id="number_info" style="color:red"></span>
                            <a href="javascript:void(0)" onclick="cgimg()" id="img">看不清楚？换个图片</a>
                        </p>
                    </div>
                </td>
            </tr>
        </table>

        <div class="login_in">
            <input id="btnClientRegister" class="button_1" name="submit" type="submit" value="注 册"/>
        </div>
    </form>
</div>
<%@include file="../common/foot1.jsp" %>
<script>

    var msg = $("#msg");

    $("#img").click(function () {
        $("#imgVcode").get(0).src = "<s:url namespace="/common" action="getVcode"/>?time=" + new Date().getTime();
    });

    var email = $("#txtEmail");
    var emailInfo = $("#email_info");
    var checkEmail = function () {
        if (email.get(0).value.length < 1) emailInfo.html("请输入邮箱");
        else if (!/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(email.get(0).value)) emailInfo.html("请输入正确的邮箱地址");
        else {
            emailInfo.html("");
            return true;
        }
        return false;
    };
    email.blur = (checkEmail);

    var name = $("#txtNickName");
    var checkName = function () {
        if ($("#txtNickName").get(0).value.length < 4) $("#name_info").html("请输入昵称");
        else {
            $("#name_info").html("");
            return true;
        }
        return false;
    };
    name.blur(checkName);

    var pwd = $("#txtPassword");
    var repwd = $("#txtRepeatPass");
    var checkPassword = function () {
        if (pwd.get(0).value.length < 1) $("#password_info").html("请输入密码");
        else {
            $("#password_info").html("");
            return true;
        }
        return false;
    };
    pwd.blur(checkPassword);

    var pwdInfo = $("#password1_info");
    var checkRePassword = function () {
        if ($("#txtRepeatPass").get(0).value.length < 1) pwdInfo.html("请输入确认密码");
        else if (!(pwd.get(0).value === repwd.get(0).value)) pwdInfo.html("请确认两次输入的密码一致");
        else {
            pwdInfo.html("");
            return true;
        }
        return false;
    };
    repwd.blur(checkRePassword);
    function checkAll() {
        if (!checkEmail()) return false;
        else if (!checkName()) return false;
        else if (!checkPassword()) return false;
        else return checkRePassword();
    }
    var frm = $("#frm");
    frm.submit(function () {
        return false;
        alert(123);
        if (checkAll()) {
            alert(123);
            $.ajax({
                type: "post",
                url: frm.attr("action") + "?" + frm.serialize(),
                success: function (mg) {
                    alert(mg);
                    if (mg !== "") {
                        msg.html(mg);
                    } else {
                        location.href = "<s:url namespace="/user" action="checkUUID"/>";
                    }
                }
            });
        }
        return false;
    });

</script>
</body>
</html>

