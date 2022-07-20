/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.dto;


import com.itheima.ruiky.entity.OrderDetail;
import com.itheima.ruiky.entity.Orders;
import lombok.Data;

import java.util.List;

@Data
public class OrderDto extends Orders {
    private List<OrderDetail> orderDetail;

    public void setOrderDetails(List<OrderDetail> orderDetailList) {
    }
}
