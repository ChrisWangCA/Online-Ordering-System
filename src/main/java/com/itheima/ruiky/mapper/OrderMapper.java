/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itheima.ruiky.entity.Orders;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper extends BaseMapper<Orders> {

}