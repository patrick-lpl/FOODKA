package com.atguigu.crud.utils.tools;


/**
 * 字符串工具类
 */
public class StringUtils {

    public static boolean isEmpty(String s){
        if (null == s || "".equals(s)) {
            return true;
        }
        return false;
    }

}
