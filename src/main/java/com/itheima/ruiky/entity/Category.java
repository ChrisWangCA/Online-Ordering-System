/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * Category class
 */
@Data
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;


    //Type 1 dish classification 2 package classification
    private Integer type;

    private String name;

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
