/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.ruiky.common.CustomException;
import com.itheima.ruiky.entity.Category;
import com.itheima.ruiky.entity.Dish;
import com.itheima.ruiky.entity.Setmeal;
import com.itheima.ruiky.mapper.CategoryMapper;
import com.itheima.ruiky.service.CategoryService;
import com.itheima.ruiky.service.DishService;
import com.itheima.ruiky.service.SetMealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {
    @Autowired
    private DishService dishService;
    @Autowired
    private SetMealService setMealService;

    /**
     * Delete category by id
     * @param ids
     */
    @Override
    public void remove(Long ids) {
        //Check whether the current category is associated with a dish, and throw an exception if it is already associated
        LambdaQueryWrapper<Dish> dishLambdaQueryWrapper = new LambdaQueryWrapper<Dish>();
        dishLambdaQueryWrapper.eq(Dish::getCategoryId,ids);
        int count1 = dishService.count(dishLambdaQueryWrapper);

        if (count1 > 0){
            // Associated dishes, throw exception
            throw new CustomException("The current category is already associated and cannot be deleted");
        }

        //Check whether the current category is associated with a package, and throw an exception if it is already associated
        LambdaQueryWrapper<Setmeal> setmealLambdaQueryWrapper = new LambdaQueryWrapper<>();
        setmealLambdaQueryWrapper.eq(Setmeal::getCategoryId,ids);
        int count2 = setMealService.count(setmealLambdaQueryWrapper);
        if (count2 > 0){
            // Associated packages, throw exception
            throw new CustomException("The current category is already associated and cannot be deleted");
        }
        //Delete category
        super.removeById(ids);
    }


}
