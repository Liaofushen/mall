package com.lfs.mall.util;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;

/**
 * Author      : Fushen
 * Modified By :
 * Description :
 *
 */
public class JsonUtil {
    private static final ObjectMapper mapper = new ObjectMapper();

    public static String toJsonString(Object o) {
        try {
            return mapper.writeValueAsString(o);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
