/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.ruiky.dto.SetmealDto;
import com.itheima.ruiky.entity.Setmeal;

import java.util.List;

public interface SetMealService extends IService<Setmeal> {

    /**
     * New packages, while saving the association between packages and dishes
     * @param setmealDto
     */
    public void saveWithDish(SetmealDto setmealDto);


    /**
     * Delete packages, delete the data associated with the packages and the dishes at the same time
     * @param ids
     */
    public void removeWithDish(List<Long> ids);

    /**
     * Modify selling status according to package id
     * @param status
     * @param ids
     */
    void updateSetmealStatusById(Integer status, List<Long> ids);

    /**
     * Search packages by package id
     * @param id
     * @return
     */
    SetmealDto getDate(Long id);
}
