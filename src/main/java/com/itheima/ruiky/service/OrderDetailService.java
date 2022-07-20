/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.ruiky.entity.OrderDetail;

import java.util.List;

public interface OrderDetailService extends IService<OrderDetail> {

    public List<OrderDetail> getOrderDetailListByOrderId(Long orderId);
}
