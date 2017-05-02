package com.baizhi.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

/**
 * 基础类，提供基本的数据存取方法
 * Created by gjp06 on 17.4.10.
 */
public class BaseAction extends ActionSupport {
    private ValueStack vs;

    BaseAction() {
        this.vs = ActionContext.getContext().getValueStack();
    }

    /**
     * 在 session 中存值
     *
     * @param key   键
     * @param value 值
     */
    public void setSessionValue(String key, Object value) {
        vs.setValue("#session." + key, value);
    }

    /**
     * 在 session 中取值
     *
     * @param key 键
     * @return 值
     */
    public Object getSessionValue(String key) {
        return vs.findValue("#session." + key);
    }

    /**
     * 在 application 中存值
     *
     * @param key   键
     * @param value 值
     */
    public void setApplicationValue(String key, Object value) {
        vs.setValue("#application." + key, value);
    }

    /**
     * 在 application 中存值
     *
     * @param key 键
     * @return 值
     */
    public Object getApplicationValue(String key) {
        return vs.findValue("#application." + key);
    }

}
