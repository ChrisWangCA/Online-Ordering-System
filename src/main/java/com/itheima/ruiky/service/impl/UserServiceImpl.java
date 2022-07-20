/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.ruiky.entity.User;
import com.itheima.ruiky.mapper.UserMapper;
import com.itheima.ruiky.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService{
}
