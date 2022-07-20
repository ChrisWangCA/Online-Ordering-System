/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 Dish
 */
@Data
public class Dish implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;


    private String name;


    private Long categoryId;


    private BigDecimal price;


    private String code;


    private String image;


    private String description;


    //0 for sale 1 stop sale
    private Integer status;


    private Integer sort;


    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;


    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;


    @TableField(fill = FieldFill.INSERT)
    private Long createUser;


    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateUser;


    private Integer isDeleted;

}
