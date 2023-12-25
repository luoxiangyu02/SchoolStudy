package com.example.AITest.util;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtils {
    private static final int MIN_PASSWORD_LENGTH = 8;

    public static boolean isPasswordValid(String password) {
        // 验证密码长度和组合要求
        if (password.length() < MIN_PASSWORD_LENGTH || !isPasswordComplex(password)) {
            return false;
        }
        return true;
    }

    private static boolean isPasswordComplex(String password) {
        // 检查密码是否包含字母和数字的组合
        boolean hasLetter = false;
        boolean hasDigit = false;
        for (char c : password.toCharArray()) {
            if (Character.isLetter(c)) {
                hasLetter = true;
            } else if (Character.isDigit(c)) {
                hasDigit = true;
            }
        }
        return hasLetter && hasDigit;
    }

    public static String encryptPassword(String password) {
        try {
            // 创建 MessageDigest 实例，选择使用 SHA-256 算法
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // 将密码转换为字节数组
            byte[] encodedPassword = digest.digest(password.getBytes());

            // 将字节数组转换为十六进制字符串
            StringBuilder hexString = new StringBuilder();
            for (byte b : encodedPassword) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            // 返回加密后的密码字符串
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return null;
    }
}