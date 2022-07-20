/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.entity;

import lombok.Data;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * Order
 */
@Data
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String number;

    //Order Status 1 Pending Payment, 2 Pending Delivery, 3 Delivered, 4 Completed, 5 Cancelled
    private Integer status;

    private Long userId;

    private Long addressBookId;

    private LocalDateTime orderTime;

    private LocalDateTime checkoutTime;

    //Payment method 1 Credit Card, 2 PayPal
    private Integer payMethod;

    //money
    private BigDecimal amount;

    private String remark;

    private String userName;

    private String phone;

    private String address;

    private String consignee;
}
