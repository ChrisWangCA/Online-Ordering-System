/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.ruiky.entity.DishFlavor;
import com.itheima.ruiky.mapper.DishFlavorMapper;
import com.itheima.ruiky.service.DishFlavorService;
import org.springframework.stereotype.Service;

@Service
public class DishFlavorServiceImpl extends ServiceImpl<DishFlavorMapper, DishFlavor> implements DishFlavorService {
}
