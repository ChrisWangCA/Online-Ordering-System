/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itheima.ruiky.entity.ShoppingCart;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {
}
