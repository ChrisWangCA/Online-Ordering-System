/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.itheima.ruiky.common.BaseContext;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.entity.ShoppingCart;
import com.itheima.ruiky.service.ShoppingCartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/shoppingCart")
public class ShoppingCartController {

    @Autowired
    private ShoppingCartService shoppingCartService;

    /**
     * Add to shopping cart
     * @param shoppingCart
     * @return
     */
    @PostMapping("/add")
    public R<ShoppingCart> add(@RequestBody ShoppingCart shoppingCart){
        log.info("Shopping cart data:{}",shoppingCart);

        Long currentId = BaseContext.getCurrentId();
        shoppingCart.setUserId(currentId);
        //Check whether the current dish or package is in the shopping cart
        Long dishId = shoppingCart.getDishId();
        LambdaQueryWrapper<ShoppingCart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ShoppingCart::getUserId,currentId);

        if (dishId!=null){
            //Added to cart are dishes
            queryWrapper.eq(ShoppingCart::getDishId,dishId);
        } else{
            //Add to cart are packages
            queryWrapper.eq(ShoppingCart::getSetmealId,shoppingCart.getSetmealId());
        }
        //If it already exists, add 1 to the original quantity
        ShoppingCart cartServiceOne = shoppingCartService.getOne(queryWrapper);
        if (cartServiceOne != null){
            Integer number = cartServiceOne.getNumber();
            cartServiceOne.setNumber(number+1);
            shoppingCartService.updateById(cartServiceOne);
        }else{
            //If not present, add to cart, default quantity is 1
            shoppingCart.setNumber(1);
            shoppingCart.setCreateTime(LocalDateTime.now());
            shoppingCartService.save(shoppingCart);
            cartServiceOne = shoppingCart;
        }
        return R.success(cartServiceOne);
    }

    /**
     * Delete items in shopping cart
     * @param shoppingCart
     * @return
     */
    @PostMapping("/sub")
    public R<ShoppingCart> delete(@RequestBody ShoppingCart shoppingCart){
        Long currentId = BaseContext.getCurrentId();
        shoppingCart.setUserId(currentId);
        Long dishId = shoppingCart.getDishId();
        LambdaQueryWrapper<ShoppingCart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ShoppingCart::getUserId,currentId);
        if (dishId!=null){
            //Added to cart are dishes
            queryWrapper.eq(ShoppingCart::getDishId,dishId);
        } else{
            //Add to cart are packages
            queryWrapper.eq(ShoppingCart::getSetmealId,shoppingCart.getSetmealId());
        }
        ShoppingCart cartServiceOne = shoppingCartService.getOne(queryWrapper);
        //If the shopping cart is not empty
        if (cartServiceOne != null){
            Integer number = cartServiceOne.getNumber();
            //Determine if the quantity is greater than 0, otherwise it cannot be reduced
            if (number > 0){
                cartServiceOne.setNumber(number - 1);
                shoppingCartService.updateById(cartServiceOne);
            }else{
                return R.error("Delete cannot be less than 0");
            }
        }
        // If number is 0, then delete the dish on the shopping cart
        if (cartServiceOne.getNumber() == 0){
            shoppingCartService.remove(queryWrapper);
        }

        return R.success(cartServiceOne);
    }

    /**
     * Get data of shopping cart
     * @return
     */
    @GetMapping("/list")
    public R<List<ShoppingCart>> list(){
        log.info("Check shopping cart");
        LambdaQueryWrapper<ShoppingCart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ShoppingCart::getUserId,BaseContext.getCurrentId());
        queryWrapper.orderByAsc(ShoppingCart::getCreateTime);
        List<ShoppingCart> list = shoppingCartService.list(queryWrapper);
        return R.success(list);
    }


    @DeleteMapping("/clean")
    public R<String> clean(){
        LambdaQueryWrapper<ShoppingCart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ShoppingCart::getUserId,BaseContext.getCurrentId());
        shoppingCartService.remove(queryWrapper);
        return R.success("Cleaned Shopping Cart");
    }


}
