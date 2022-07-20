/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.ruiky.common.CustomException;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.dto.DishDto;
import com.itheima.ruiky.entity.Dish;
import com.itheima.ruiky.entity.DishFlavor;
import com.itheima.ruiky.mapper.DishMapper;
import com.itheima.ruiky.service.DishFlavorService;
import com.itheima.ruiky.service.DishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements DishService {
    @Autowired
    private DishFlavorService dishFlavorService;


    /**
     * Add new dishes while saving the corresponding taste data
     * @param dishDto
     */
    @Transactional
    public void saveWithFlavor(DishDto dishDto) {
        //Save the basic information of the dish
        this.save(dishDto);
        Long dishId = dishDto.getId();

        List<DishFlavor> flavors = dishDto.getFlavors();
        flavors = flavors.stream().map((item) -> {
           item.setDishId(dishId);
           return item;
        }).collect(Collectors.toList());
        //Save flavor
        dishFlavorService.saveBatch(flavors);

    }

    /**
     * Get dish info and flavor by id
     * @param id
     * @return
     */
    @Override
    public DishDto getByIdWithFlavor(Long id) {

        //Get the dish info
        Dish dish = this.getById(id);
        DishDto dishDto = new DishDto();
        BeanUtils.copyProperties(dish,dishDto);
        //Get the flavor info
        LambdaQueryWrapper<DishFlavor> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DishFlavor::getDishId,dish.getId());
        List<DishFlavor> flavors = dishFlavorService.list(queryWrapper);
        dishDto.setFlavors(flavors);
        return dishDto;
    }


    /**
     * Update dish info and flavor info
     * @param dishDto
     */
    @Override
    @Transactional
    public void updateWithFlavor(DishDto dishDto) {
        //Update dish
        this.updateById(dishDto);

        //Clear the flavor data corresponding to the current dish  -- dish_flavor delete
        LambdaQueryWrapper<DishFlavor> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DishFlavor::getDishId,dishDto.getId());
        dishFlavorService.remove(queryWrapper);

        //Add the current submitted flavor data -- dish_flavor insert
        List<DishFlavor> flavors = dishDto.getFlavors();
        flavors = flavors.stream().map((item) -> {
            item.setDishId(dishDto.getId());
            return item;
        }).collect(Collectors.toList());
        dishFlavorService.saveBatch(flavors);
    }


    /**
     *Package batch delete and individual delete
     * @param ids
     */
    @Override
    @Transactional
    public void deleteByIds(List<Long> ids) {

        //Constructing conditional Query
        LambdaQueryWrapper<Dish> queryWrapper = new LambdaQueryWrapper<>();
        //First check whether the dish is on sale, and if so, throw a exception
        queryWrapper.in(ids!=null,Dish::getId,ids);
        List<Dish> list = this.list(queryWrapper);
        for (Dish dish : list) {
            Integer status = dish.getStatus();
            //If it is not for sale, it can be deleted
            if (status == 0){
                this.removeById(dish.getId());
            }else {
                throw new CustomException("删除菜品中有正在售卖菜品,无法全部删除");
            }
        }

    }


}
