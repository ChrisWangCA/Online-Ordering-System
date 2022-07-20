/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.dto;

import com.itheima.ruiky.entity.Setmeal;
import com.itheima.ruiky.entity.SetmealDish;
import lombok.Data;
import java.util.List;

@Data
public class SetmealDto extends Setmeal {

    private List<SetmealDish> setmealDishes;

    private String categoryName;
}
