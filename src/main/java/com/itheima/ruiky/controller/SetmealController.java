/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.dto.SetmealDto;
import com.itheima.ruiky.entity.Category;
import com.itheima.ruiky.entity.Setmeal;
import com.itheima.ruiky.entity.SetmealDish;
import com.itheima.ruiky.service.CategoryService;
import com.itheima.ruiky.service.SetMealService;
import com.itheima.ruiky.service.SetmealDishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Packages management
 */
@RestController
@RequestMapping("/setmeal")
@Slf4j
public class SetmealController {
    @Autowired
    private SetMealService setmealService;
    @Autowired
    private SetmealDishService setmealDishService;
    @Autowired
    private CategoryService categoryService;

    /**
     * Add new packages
     * @param setmealDto
     * @return
     */
    @PostMapping
    public R<String> save(@RequestBody SetmealDto setmealDto){

        log.info("Packages: {}",setmealDto);
        setmealService.saveWithDish(setmealDto);
        return R.success("Add new packages successful");
    }

    /**
     * Get Packages by page
     * @param page
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping("/page")
    public R<Page> page(int page,int pageSize,String name){
        // Page Constructor
        Page<Setmeal> pageInfo = new Page<>(page,pageSize);
        Page<SetmealDto> dotPage = new Page<>();

        LambdaQueryWrapper<Setmeal> queryWrapper = new LambdaQueryWrapper<>();
        // Add query condition
        queryWrapper.like(name != null,Setmeal::getName,name);
        // Add sort condition
        queryWrapper.orderByDesc(Setmeal::getUpdateTime);
        setmealService.page(pageInfo,queryWrapper);

        //Copy Object
        BeanUtils.copyProperties(pageInfo,queryWrapper,"records");
        List<Setmeal> records = pageInfo.getRecords();
        List<SetmealDto> list = records.stream().map((item) -> {
            SetmealDto setmealDto = new SetmealDto();
            // Copy object
            BeanUtils.copyProperties(item,setmealDto);
            Long categoryId = item.getCategoryId();
            // Get category object by categoryID
            Category category = categoryService.getById(categoryId);
            if (category!=null){
                String categoryName = category.getName();
                setmealDto.setCategoryName(categoryName);
            }
            return setmealDto;
        }).collect(Collectors.toList());
         dotPage.setRecords(list);
        return R.success(dotPage);
    }

    /**
     * Delete packages
     * @param ids
     * @return
     */
    @DeleteMapping
    public R<String> delete(@RequestParam List<Long> ids){

        log.info("ids:{}" ,ids);
        setmealService.removeWithDish(ids);
        return R.success("Delete successful");
    }

    /**
     * Get package's data by condition
     * @param setmeal
     * @return
     */
    @GetMapping("/list")
    public R<List<Setmeal>> list(Setmeal setmeal){
        LambdaQueryWrapper<Setmeal> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(setmeal.getCategoryId()!=null,Setmeal::getCategoryId,setmeal.getCategoryId());
        queryWrapper.eq(setmeal.getStatus()!=null,Setmeal::getStatus,setmeal.getStatus());
        queryWrapper.orderByDesc(Setmeal::getUpdateTime);
        List<Setmeal> list = setmealService.list(queryWrapper);

        return R.success(list);
    }


    /**
     * Disable and Enable packages
     * @return
     */
    @PostMapping("/status/{status}")
    public R<String> status(@PathVariable("status") Integer status,@RequestParam List<Long> ids){
        setmealService.updateSetmealStatusById(status,ids);
        return R.success("售卖状态修改成功");
    }


    /**
     * Search packages by package id
     * @return
     */
    @GetMapping("/{id}")
    public R<SetmealDto> getData(@PathVariable Long id){
        SetmealDto setmealDto = setmealService.getDate(id);

        return R.success(setmealDto);
    }

    /**
     * Edit package
     * @param setmealDto
     * @return
     */
    @PutMapping
    public R<String> edit(@RequestBody SetmealDto setmealDto){

        if (setmealDto==null){
            return R.error("Request error");
        }

        if (setmealDto.getSetmealDishes()==null){
            return R.error("There are no dishes in the package, please add the dish");
        }
        List<SetmealDish> setmealDishes = setmealDto.getSetmealDishes();
        Long setmealId = setmealDto.getId();

        LambdaQueryWrapper<SetmealDish> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SetmealDish::getSetmealId,setmealId);
        setmealDishService.remove(queryWrapper);

        //Populate the setmeal_dish table with relevant attributes
        for (SetmealDish setmealDish : setmealDishes) {
            setmealDish.setSetmealId(setmealId);
        }
        setmealDishService.saveBatch(setmealDishes);
        setmealService.updateById(setmealDto);

        return R.success("Package changed successfully");
    }

}
