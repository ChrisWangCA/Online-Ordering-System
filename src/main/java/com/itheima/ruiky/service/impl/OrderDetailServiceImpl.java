/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.ruiky.entity.OrderDetail;
import com.itheima.ruiky.mapper.OrderDetailMapper;
import com.itheima.ruiky.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {

    @Autowired
    private OrderDetailService orderDetailService;

    /**
     * Search order details by order id
     * @param orderId
     * @return
     */
    public List<OrderDetail> getOrderDetailListByOrderId(Long orderId){
        LambdaQueryWrapper<OrderDetail> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(OrderDetail::getOrderId, orderId);
        List<OrderDetail> orderDetailList = orderDetailService.list(queryWrapper);
        return orderDetailList;
    }


}