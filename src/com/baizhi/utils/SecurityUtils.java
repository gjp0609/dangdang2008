package com.baizhi.utils;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 * 安全相关工具类
 * Created by gjp06 on 17.4.1.
 */
public class SecurityUtils {

    private static final String SRC = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    private static final String[] fonts = {"Chiller", "Mistral"};
    private static final Color[] COLORS = {Color.decode("#66cc00"),
            Color.decode("#008888"), Color.decode("#880088"), Color.decode("#888800"),
            Color.decode("#000088"), Color.decode("#0088ff"), Color.decode("#880000"),
            Color.decode("#000000")};

    /**
     * 对传入字符串进行 MD5 加密
     *
     * @param pwd 要加密的字符串
     * @return 加密后的字符串
     */
    public static String getMD5(String pwd) {
        byte[] bytes = null;
        StringBuilder sb = null;
        try {
            // 创建抽象类对象并设置加密方式
            MessageDigest md = MessageDigest.getInstance("md5");
            // 对接收的字符串进行 MD5 加密，得到长度为 16 的 byte 数组
            bytes = md.digest(pwd.getBytes());
            sb = new StringBuilder();
            // 循环遍历，将每个 byte
            for (byte b : bytes) {
                int i = b & 0xFF;
                if (i < 16)
                    sb.append("0");
                sb.append(Integer.toHexString(i));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return sb != null ? sb.toString() : null;
    }

    /**
     * 获取指定长度的随机码
     *
     * @param length 要获得的随机码的长度
     * @return 指定长度的随机码
     */
    public static String getRandomCode(int length) {
        // 获取随机类对象
        Random random = new Random();
        char[] chs = new char[length];
        // 从随机源中随机获取字符拼装成随机码
        for (int i = 0; i < length; i++) {
            chs[i] = SRC.charAt(random.nextInt(SRC.length()));
        }
        return new String(chs);
    }

    /**
     * 获取指定字符串生成的验证码图片
     *
     * @param vcode  验证码
     * @param height 验证码图片高度
     * @param width  验证码图片宽度
     * @return BufferedImage 类型的指定验证码图片
     */
    public static BufferedImage getVerifiyImg(String vcode, int height, int width) {
        // 创建指定宽高的透明图片
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Random random = new Random();
        // 获取对应画笔
        Graphics g = img.getGraphics();

        // 循环写入验证码文本
        for (int i = 0; i < vcode.length(); i++) {
            // 设置随机颜色
            g.setColor(COLORS[random.nextInt(COLORS.length)]);
            // 设置随机字体
            g.setFont(new Font(fonts[random.nextInt(fonts.length)], Font.ITALIC + Font.BOLD, height));
            // 在图片中写入文本
            g.drawString(vcode.charAt(i) + "", width / vcode.length() * i, height / 4 * 3);
        }

        // 循环添加随机干扰线
       /* for (int i = 0; i < vcode.length(); i++) {
            // 获取随机颜色
            g.setColor(COLORS[random.nextInt(COLORS.length)]);
            // 获取 2D 画笔（可调粗细）
            Graphics2D g2 = (Graphics2D) g;
            // 调整画笔粗细
            g2.setStroke(new BasicStroke(height / 50F));
            // 获取随机位置
            int x = random.nextInt(width) - width / 10;
            int y = random.nextInt(height) - height / 10;
            int x2 = random.nextInt(width / 2) + x + 20;
            int y2 = random.nextInt(height / 3) + y + 10;
            // 添加随机线条
            g2.drawLine(x, y, x2, y2);
        }*/
        // 生成图片
        g.dispose();
        return img;
    }
}
