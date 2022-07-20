/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.entity.Category;
import com.itheima.ruiky.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Category management
 */
@Slf4j
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * Add new category
     * @param category
     * @return
     */
    @PostMapping
    public R<String> save(@RequestBody Category category){
        categoryService.save(category);
        return R.success("Add new category successful");
    }

    /**
     * Paging data
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public R<Page> page(int page,int pageSize){
        //Page Constructor
        Page<Category> pageInfo = new Page<>(page,pageSize);
        //Condition Constructor
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        //Sort Condition
        queryWrapper.orderByAsc(Category::getSort);
        categoryService.page(pageInfo,queryWrapper);
        return R.success(pageInfo);
    }


    /**
     * Delete category by id
     * @param ids
     * @return
     */
    @DeleteMapping
    public R<String> delete(Long ids){
        log.info("Delete category :{}",ids);
        categoryService.remove(ids);
        return R.success("Category delete successful");
    }


    /**
     * Update info by id
     * @param category
     * @return
     */
    @PutMapping
    public R<String> update(@RequestBody Category category){
        log.info("Update info: {}",category);
        categoryService.updateById(category);
        return R.success("Update successful");
    }


    /**
     * Get list data by condition
     * @param category
     * @return
     */
    @GetMapping("/list")
    public R<List<Category>> list(Category category){
        //Condition Constructor
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        // Add condition
        queryWrapper.eq(category.getType()!=null,Category::getType,category.getType());
        // Add sort condition
        queryWrapper.orderByAsc(Category::getSort).orderByDesc(Category::getUpdateTime);
        List<Category> list = categoryService.list(queryWrapper);
        return R.success(list);
    }

}
