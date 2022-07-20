/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.itheima.ruiky.common.CustomException;
import com.itheima.ruiky.dto.SetmealDto;
import com.itheima.ruiky.entity.Setmeal;
import com.itheima.ruiky.entity.SetmealDish;
import com.itheima.ruiky.mapper.SetMealMapper;
import com.itheima.ruiky.service.SetMealService;
import com.itheima.ruiky.service.SetmealDishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class SetMealServiceImpl extends ServiceImpl<SetMealMapper, Setmeal> implements SetMealService {
    @Autowired
    private SetmealDishService setmealDishService;

    /**
     *  New packages, while saving the association between packages and dishes
     * @param setmealDto
     */
    @Override
    @Transactional
    public void saveWithDish(SetmealDto setmealDto) {
        //Save packages info
        this.save(setmealDto);
        List<SetmealDish> setmealDishes = setmealDto.getSetmealDishes();
        setmealDishes.stream().map((item) -> {
            item.setSetmealId(setmealDto.getId());
            return item;
        }).collect(Collectors.toList());
        //Save info between packages and dishes
        setmealDishService.saveBatch(setmealDishes);
    }

    /**
     * Delete packages, delete the data associated with the packages and the dishes at the same time
     * @param ids
     */
    @Override
    @Transactional
    public void removeWithDish(List<Long> ids) {
        //Get the status of packages, to check if it can be deleted
        LambdaQueryWrapper<Setmeal> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(Setmeal::getId,ids);
        queryWrapper.eq(Setmeal::getStatus,1);
        int count = this.count(queryWrapper);
        if (count > 0){
            //If it can not be deleted, throw an exception
            throw new CustomException("This package is on sale and cannot be deleted");
        }
        //If it can be deleted, delete the data in package first  -- setmeal
        this.removeByIds(ids);
        //Delete data in relationship table -- setmeal_dish
        LambdaQueryWrapper<SetmealDish> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.in(SetmealDish::getSetmealId,ids);
        setmealDishService.remove(lambdaQueryWrapper);
    }


    /**
     * Modify selling status according to package id
     * @param status
     * @param ids
     */
    @Override
    public void updateSetmealStatusById(Integer status,  List<Long> ids) {
        LambdaQueryWrapper<Setmeal> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.in(ids !=null,Setmeal::getId,ids);
        List<Setmeal> list = this.list(queryWrapper);
        for (Setmeal setmeal : list) {
            if (setmeal != null){
                setmeal.setStatus(status);
                this.updateById(setmeal);
            }
        }
    }

    /**
     * Search packages by package id
     * @return
     */
    @Override
    public SetmealDto getDate(Long id) {
        Setmeal setmeal = this.getById(id);
        SetmealDto setmealDto = new SetmealDto();
        LambdaQueryWrapper<SetmealDish> queryWrapper = new LambdaQueryWrapper();

        queryWrapper.eq(id!=null,SetmealDish::getSetmealId,id);

        if (setmeal != null){
            BeanUtils.copyProperties(setmeal,setmealDto);
            List<SetmealDish> list = setmealDishService.list(queryWrapper);
            setmealDto.setSetmealDishes(list);
            return setmealDto;
        }
        return null;
    }
}
