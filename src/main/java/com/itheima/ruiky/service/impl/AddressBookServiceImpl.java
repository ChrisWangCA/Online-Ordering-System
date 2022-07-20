package com.itheima.ruiky.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.ruiky.entity.AddressBook;
import com.itheima.ruiky.mapper.AddressBookMapper;
import com.itheima.ruiky.service.AddressBookService;
import org.springframework.stereotype.Service;

@Service
public class AddressBookServiceImpl extends ServiceImpl<AddressBookMapper, AddressBook> implements AddressBookService {
}
