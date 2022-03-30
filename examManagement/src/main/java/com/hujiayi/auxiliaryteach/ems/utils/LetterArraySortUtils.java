package com.hujiayi.auxiliaryteach.ems.utils;

public class LetterArraySortUtils {

    public static String[] reverseStr(String str) {
        return str.split(",");
    }

    public static String sort(String[] str) {
        Integer a = null;
        Integer b = null;
        Integer c = null;
        Integer d = null;
        for (int i = 0; i < str.length; i++) {
            if (("A").equals(str[i])) {
                a = i;
            }
            if (("B").equals(str[i])) {
                b = i;
            }
            if (("C").equals(str[i])) {
                c = i;
            }
            if (("D").equals(str[i])) {
                d = i;
            }
        }
        String res = "";
        if (a != null) {
            res = res + str[a] + ",";
        }
        if (b != null) {
            res = res + str[b] + ",";
        }
        if (c != null) {
            res = res + str[c] + ",";
        }
        if (d != null) {
            res = res + str[d] + ",";
        }
        return res.substring(0, str.length * 2 - 1);
    }
}
