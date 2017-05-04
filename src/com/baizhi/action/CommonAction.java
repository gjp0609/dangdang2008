package com.baizhi.action;

import com.baizhi.entity.User;
import com.baizhi.utils.SecurityUtils;
import org.apache.struts2.ServletActionContext;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;

/**
 * 公共 action 类
 * Created by gjp06 on 17.5.1.
 */
public class CommonAction extends BaseAction {
    // TODO 貌似没用？
    private User user = new User();

    /**
     * 生成验证码图片并将验证码存入 session
     *
     * @return null
     * @throws Exception IOException
     */
    public String getVcode() throws Exception {
        ServletActionContext.getRequest().getSession().removeAttribute("vcode");
        String code = SecurityUtils.getRandomCode(4);
        setSessionValue("vcode", code);
        BufferedImage img = SecurityUtils.getVerifiyImg(code, 40, 100);
        // 将图片输出到调用位置
        ImageIO.write(img, "png", ServletActionContext.getResponse().getOutputStream());
        return null;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
