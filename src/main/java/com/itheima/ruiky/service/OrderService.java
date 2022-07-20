/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.ruiky.entity.Orders;

public interface OrderService extends IService<Orders> {

    /**
     * User order
     * @param orders
     */
    public void submit(Orders orders);
}
