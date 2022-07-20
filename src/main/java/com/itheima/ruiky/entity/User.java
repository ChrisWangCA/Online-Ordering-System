/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.entity;

import lombok.Data;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.io.Serializable;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
/**
 * User Info
 */
@Data
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;


    private String name;


    private String phone;


    //Sex 0 female ,1 male
    private String sex;


    private String idNumber;


    private String avatar;


    //Status: 0 normal, 1 disabled
    private Integer status;
}
