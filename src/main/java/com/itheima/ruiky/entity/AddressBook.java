package com.itheima.ruiky.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * Address
 */
@Data
public class AddressBook implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;


    private Long userId;


    private String consignee;


    private String phone;


    //Sex 0female 1male
    private String sex;


    private String provinceCode;


    private String provinceName;


    private String cityCode;


    private String cityName;


    private String districtCode;


    private String districtName;


    private String detail;


    private String label;

    //is it default address? 0 not, 1 yes
    private Integer isDefault;

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
