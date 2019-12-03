package com.perfect.security.code.img;

import com.perfect.security.code.ValidateCodeGenerator;
import com.perfect.security.properties.PerfectSecurityProperties;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ImageCodeGenerator implements ValidateCodeGenerator {

    private PerfectSecurityProperties perfectSecurityProperties;

    @Override
    public ImageCode createCode() {
        // 验证码图片宽度
        int width = perfectSecurityProperties.getCode().getImage().getWidth();
        // 验证码图片长度
        int height =  perfectSecurityProperties.getCode().getImage().getHeight();
        // 验证码位数
        int length = perfectSecurityProperties.getCode().getImage().getLength();
        // 验证码有效时间
        int expireIn = perfectSecurityProperties.getCode().getImage().getExpireIn();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        Graphics g = image.getGraphics();
        Random random = new Random();

        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);
        g.setFont(new Font("Times New Roman", Font.ITALIC, 38));
        g.setColor(getRandColor(150, 200));
        for (int i = 0; i < 155; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(250);
            int yl = random.nextInt(250);
            g.drawLine(x, y, x + xl, y + yl);
        }

        StringBuilder sRand = new StringBuilder();
        for (int i = 0; i < length; i++) {
            String rand = String.valueOf(random.nextInt(10));
            sRand.append(rand);
            g.setColor(new Color(10 + random.nextInt(110), 10 + random.nextInt(110), 10 + random.nextInt(110)));
            g.drawString(rand, 18 * i + 12, 32);
        }
        g.dispose();
        return new ImageCode(image, sRand.toString(), expireIn);
    }

    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

    public PerfectSecurityProperties getPerfectSecurityProperties() {
        return perfectSecurityProperties;
    }

    public void setPerfectSecurityProperties(PerfectSecurityProperties perfectSecurityProperties) {
        this.perfectSecurityProperties = perfectSecurityProperties;
    }
}
