/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.ruiky.entity.Category;

public interface CategoryService extends IService<Category> {
    public void remove(Long id);
}
