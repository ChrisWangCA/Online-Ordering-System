/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.dto.DishDto;
import com.itheima.ruiky.entity.Dish;

import java.util.List;

public interface DishService extends IService<Dish> {


    //Add new dish and insert flavor
    public void saveWithFlavor(DishDto dishDto);

    //Get dish info and flavor by id
    public DishDto getByIdWithFlavor(Long id);

    //Update dish info and flavor info
    public void updateWithFlavor(DishDto dishDto);

    void deleteByIds(List<Long> ids);
}
