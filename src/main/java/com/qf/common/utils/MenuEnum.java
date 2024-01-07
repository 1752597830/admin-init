package com.qf.common.utils;

import java.util.EnumMap;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: sin
 * @Description 枚举映射 EnumMap
 */
public class MenuEnum {
    public static Map<Integer, String> enumMap = new HashMap<>();

    // 填充键值对
    static {
        enumMap.put(1, "MENU");
        enumMap.put(2, "CATALOG");
        enumMap.put(3, "BUTTON");
    }
}
