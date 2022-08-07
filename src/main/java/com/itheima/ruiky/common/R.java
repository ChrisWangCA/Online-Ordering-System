/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.common;

import lombok.Data;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@Data
public class R<T> implements Serializable {

    private Integer code; //Code: 1 for success, 0 and other numbers for failure

    private String msg; //Error message

    private T data; //data

    private Map map = new HashMap(); //Dynamic Data

    public static <T> R<T> success(T object) {
        R<T> r = new R<T>();
        r.data = object;
        r.code = 1;
        return r;
    }

    public static <T> R<T> error(String msg) {
        R r = new R();
        r.msg = msg;
        r.code = 0;
        return r;
    }

    public R<T> add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }

}
