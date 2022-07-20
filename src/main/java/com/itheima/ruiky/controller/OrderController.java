/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.ruiky.common.BaseContext;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.dto.OrderDto;
import com.itheima.ruiky.entity.OrderDetail;
import com.itheima.ruiky.entity.Orders;
import com.itheima.ruiky.service.OrderDetailService;
import com.itheima.ruiky.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    /**
     * User order
     * @param orders
     * @return
     */
    @PostMapping("/submit")
    public R<String> submit(@RequestBody Orders orders){
        log.info("Order Details:{}",orders);
        orderService.submit(orders);
        return R.success("Order completed");
    }


    /**
     * Back-office search for order details
     * @param page
     * @param pageSize
     * @param number
     * @param beginTime
     * @param endTime
     * @return
     */
    @GetMapping("/page")
    public R<Page> page(int page, int pageSize, String number, String beginTime, String endTime){
        //Paging constructor object
        Page<Orders> pageInfo = new Page<>(page,pageSize);
        //Condition constructor
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();

        //Adding query conditions Dynamic sql strings are determined using the method StringUtils.isNotEmpty
        queryWrapper.like(number!=null,Orders::getNumber,number)
                .gt(StringUtils.isNotEmpty(beginTime),Orders::getOrderTime,beginTime)
                .lt(StringUtils.isNotEmpty(endTime),Orders::getOrderTime,endTime);

        orderService.page(pageInfo,queryWrapper);
        return R.success(pageInfo);
    }



    /**
     * User-side display of their own order paging queries
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/userPage")
    public R<Page> page(int page, int pageSize){
        //Paging constructor object
        Page<Orders> pageInfo = new Page<>(page,pageSize);
        Page<OrderDto> pageDto = new Page<>(page,pageSize);
        //Condition constructor
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Orders::getUserId, BaseContext.getCurrentId());
        //Sort condition
        queryWrapper.orderByDesc(Orders::getOrderTime);
        orderService.page(pageInfo,queryWrapper);

        //Check orderDetails by orderID
        LambdaQueryWrapper<OrderDetail> queryWrapper2 = new LambdaQueryWrapper<>();

        // Assign the required properties to OrderDto
        List<Orders> records = pageInfo.getRecords();
        List<OrderDto> orderDtoList = records.stream().map((item) ->{
            OrderDto orderDto = new OrderDto();
            //Get order id
            Long orderId = item.getId();
            List<OrderDetail> orderDetailList = orderDetailService.getOrderDetailListByOrderId(orderId);
            BeanUtils.copyProperties(item,orderDto);
            orderDto.setOrderDetails(orderDetailList);
            return orderDto;
        }).collect(Collectors.toList());

        BeanUtils.copyProperties(pageInfo,pageDto,"records");
        pageDto.setRecords(orderDtoList);
        return R.success(pageDto);
    }


    /**
     * Modify the order status in the backend
     * @param map
     * @return
     */
    @PutMapping
    public R<String> orderStatusChange(@RequestBody Map<String,String> map){

        String id = map.get("id");
        Long orderId = Long.parseLong(id);
        Integer status = Integer.parseInt(map.get("status"));

        if(orderId == null || status==null){
            return R.error("Information Error");
        }
        Orders orders = orderService.getById(orderId);
        orders.setStatus(status);
        orderService.updateById(orders);

        return R.success("Change successful");

    }
}
