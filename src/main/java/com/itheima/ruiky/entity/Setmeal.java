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
 * Meal
 */
@Data
public class Setmeal implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;


    private Long categoryId;


    private String name;


    private BigDecimal price;


    //状态 0:use 1:stop
    private Integer status;


    private String code;


    private String description;


    private String image;


    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;


    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;


    @TableField(fill = FieldFill.INSERT)
    private Long createUser;


    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateUser;


    //是否删除
    private Integer isDeleted;
}
