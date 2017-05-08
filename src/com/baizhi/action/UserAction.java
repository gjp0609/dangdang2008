package com.baizhi.action;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.service.impl.UserServiceImpl;
import com.baizhi.utils.SecurityUtils;
import org.apache.struts2.ServletActionContext;

import java.util.UUID;

/**
 * 用户 action
 * Created by gjp06 on 17.4.30.
 */
public class UserAction extends BaseAction {
    private User user = new User();
    // 错误提示信息，在 action 进行某些表单的验证，抛出异常，将异常信息赋值给 msg
    private String msg = "";
    private String rePwd = "";
    private String code = "";
    // 用户输入的激活验证码
    private String typeUUID = "";
    private String uuid = "";

    /**
     * 用户登陆 action
     *
     * @return LOGIN 跳转至登录界面<br/>SUCCESS 跳转至主页
     */
    public String login() {
        try {
            UserService service = new UserServiceImpl();
            User newUser = service.findUser(user.getEmail());
            if (newUser == null) throw new RuntimeException("未找到该用户");
            String pwd = SecurityUtils.getMD5(user.getPassword() + newUser.getSalt());
            if (pwd == null || !pwd.equals(newUser.getPassword())) throw new RuntimeException("密码错误");
            if (newUser.getStatus() == null || !newUser.getStatus().equalsIgnoreCase("Y"))
                throw new RuntimeException("该用户尚未激活");
            setSessionValue("user", newUser);
            Object loginStatus = getSessionValue("loginStatus");
            if (loginStatus != null) return "redirect";
        } catch (Exception e) {
            msg = e.getMessage();
//            e.printStackTrace();
            return LOGIN;
        }
        return SUCCESS;
    }

    /**
     * 用户注册
     *
     * @return register 跳转至注册页<br/>SUCCESS 跳转至验证页
     */
    public String register() {
        try {
            UserServiceImpl service = new UserServiceImpl();
            // 验证码
            Object vcode = getSessionValue("vcode");
            String srcCode = (String) vcode;
            if (!srcCode.equalsIgnoreCase(code)) throw new RuntimeException("验证码错误");
            // 判断用户是否已存在
            User findUser = service.findUser(this.user.getEmail());
            if (findUser != null) throw new RuntimeException("该用户已存在");
            // 添加用户
            service.addUser(user);
        } catch (Exception e) {
            msg = e.getMessage();
//            e.printStackTrace();
            return "register";
        }
        return SUCCESS;
    }

    public String createUUID() {
        uuid = UUID.randomUUID().toString().replace("-", "");
        setSessionValue("uuid", uuid);
        System.out.println(uuid);
        return SUCCESS;
    }

    /**
     * 随机验证码验证
     *
     * @return verify 跳转至验证页面<br/>SUCCESS 跳转至注册成功页面
     */
    public String checkUUID() {
        int i = 0;
        try {
            if (typeUUID == null) throw new RuntimeException("请输入验证码");
            if (typeUUID.length() != 32) throw new RuntimeException("验证码不完整");
            if (!typeUUID.equals(getSessionValue("uuid"))) throw new RuntimeException("验证码不正确");
            user.setStatus("Y");
            i = new UserServiceImpl().modifyUser(user);
        } catch (Exception e) {
            msg = e.getMessage();
//            e.printStackTrace();
            return "verify";
        }
        return SUCCESS;
    }

    public String logout() {
        ServletActionContext.getRequest().getSession().removeAttribute("user");
        return SUCCESS;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getRePwd() {
        return rePwd;
    }

    public void setRePwd(String rePwd) {
        this.rePwd = rePwd;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTypeUUID() {
        return typeUUID;
    }

    public void setTypeUUID(String typeUUID) {
        this.typeUUID = typeUUID;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
