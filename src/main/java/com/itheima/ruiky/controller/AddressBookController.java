/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.itheima.ruiky.common.BaseContext;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.entity.AddressBook;
import com.itheima.ruiky.service.AddressBookService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Address management
 */

@Slf4j
@RestController
@RequestMapping("/addressBook")
public class AddressBookController {

    @Autowired
    private AddressBookService addressBookService;

    /**
     * Add new address
     *
     * @param addressBook
     * @return
     */
    @PostMapping
    public R<AddressBook> save(@RequestBody AddressBook addressBook) {
        addressBook.setUserId(BaseContext.getCurrentId());
        log.info("addressBook:{}", addressBook);
        addressBookService.save(addressBook);
        return R.success(addressBook);
    }

    /**
     * Set default address
     *
     * @param addressBook
     * @return
     */
    @PutMapping("default")
    public R<AddressBook> setDefault(@RequestBody AddressBook addressBook) {
        log.info("addressBook:{}", addressBook);
        LambdaUpdateWrapper<AddressBook> wrapper = new LambdaUpdateWrapper<>();
        wrapper.eq(AddressBook::getUserId, BaseContext.getCurrentId());
        wrapper.set(AddressBook::getIsDefault, 0);
        addressBookService.update(wrapper);
        addressBook.setIsDefault(1);
        addressBookService.updateById(addressBook);
        return R.success(addressBook);
    }


    /**
     * Get address by id
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public R get(@PathVariable Long id) {
        AddressBook addressBook = addressBookService.getById(id);
        if (addressBook != null) {
            return R.success(addressBook);
        } else {
            return R.error("Could not find user");
        }
    }


    /**
     * Get default address
     *
     * @return
     */
    @GetMapping("default")
    public R<AddressBook> getDefault() {
        LambdaQueryWrapper<AddressBook> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(AddressBook::getUserId, BaseContext.getCurrentId());
        lambdaQueryWrapper.eq(AddressBook::getIsDefault, 1);
        AddressBook addressBoos = addressBookService.getOne(lambdaQueryWrapper);
        if (null == addressBoos) {
            return R.error("Could not find user");
        } else {
            return R.success(addressBoos);
        }
    }

    /**
     * Get all address of specified user
     *
     * @param addressBook
     * @return
     */
    @GetMapping("/list")
    public R<List<AddressBook>> list(AddressBook addressBook) {
        addressBook.setUserId(BaseContext.getCurrentId());
        log.info("addressBook:{}", addressBook);

        //Condition constructor
        LambdaQueryWrapper<AddressBook> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(null != addressBook.getUserId(), AddressBook::getUserId, addressBook.getUserId());
        queryWrapper.orderByDesc(AddressBook::getUpdateTime);
        return R.success(addressBookService.list(queryWrapper));
    }

    /**
     * Delete user addresses based on address id
     * @param id
     * @return
     */
    @DeleteMapping
    public R<String> delete(@RequestParam("ids") Long id){

        if (id == null){
            return R.error("Request Error");
        }
        LambdaQueryWrapper<AddressBook> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(AddressBook::getId,id).eq(AddressBook::getUserId,BaseContext.getCurrentId());
        addressBookService.remove(queryWrapper);
        return R.success("Delete successful");
    }


    /**
     * Modify address
     * @param addressBook
     * @return
     */
    @PutMapping
    public R<String> update(@RequestBody AddressBook addressBook){

        if (addressBook == null){
            return R.error("Request Error");
        }
        addressBookService.updateById(addressBook);
        return R.success("Change successful");
    }
}
