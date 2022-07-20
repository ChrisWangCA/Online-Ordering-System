package com.itheima.ruiky.common;

/**
 * @Author Chris Wang
 */

/**
 *ThreadLocal based wrapper tool class for saving and getting the id of the currently logged-in user
 */
public class BaseContext {
    private static ThreadLocal<Long> threadLocal = new ThreadLocal<>();

    public static void setCurrentId(Long id){
        threadLocal.set(id);
    }

    public static Long getCurrentId(){
        return threadLocal.get();
    }
}
