/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.dto;

import com.itheima.ruiky.entity.Dish;
import com.itheima.ruiky.entity.DishFlavor;
import lombok.Data;
import java.util.ArrayList;
import java.util.List;

@Data
public class DishDto extends Dish {

    private List<DishFlavor> flavors = new ArrayList<>();

    private String categoryName;

    private Integer copies;
}
