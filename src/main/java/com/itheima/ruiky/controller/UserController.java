/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.entity.User;
import com.itheima.ruiky.service.UserService;
import com.itheima.ruiky.utils.SMSUtils;
import com.itheima.ruiky.utils.ValidateCodeUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * Send cell phone SMS verification code
     * @param user
     * @return
     */
    @PostMapping("/sendMsg")
    public R<String> sendMsg(@RequestBody User user, HttpSession session){
        //Get phone number
        String phone = user.getPhone();
        if(StringUtils.isNotEmpty(phone)){
            //Generate a random 4-digit verification code
            String code = ValidateCodeUtils.generateValidateCode(4).toString();
            log.info("code={}",code);

            //Need to save the generated captcha to Session
//            session.setAttribute(phone,code);

            stringRedisTemplate.opsForValue().set(phone,code,5, TimeUnit.MINUTES);

            return R.success("Verification code sent successfully");
        }

        return R.error("Text message delivery failure");
    }

    /**
     * Mobile user login
     * @param map
     * @param session
     * @return
     */
    @PostMapping("/login")
    public R<User> login(@RequestBody Map map, HttpSession session){
        log.info(map.toString());

        //Get phone number
        String phone = map.get("phone").toString();

        //Get verification code
        String code = map.get("code").toString();

        //Get the saved authentication code from Session
//        Object codeInSession = session.getAttribute(phone);

        String codeInSession = stringRedisTemplate.opsForValue().get(phone);

        //Perform verification code comparison (verification code submitted by the page and the verification code saved in Session)
        if(codeInSession != null && codeInSession.equals(code)){
            //If the comparison is successful, the login is successful.

            LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(User::getPhone,phone);

            User user = userService.getOne(queryWrapper);
            if(user == null){
                //Determine whether the user corresponding to the current cell phone number is a new user, and automatically complete the registration if it is a new user
                user = new User();
                user.setPhone(phone);
                user.setStatus(1);
                userService.save(user);
            }
            session.setAttribute("user",user.getId());
            stringRedisTemplate.delete(phone);
            return R.success(user);
        }
        return R.error("Login failure");
    }



    /**
     * Logout
     * @return
     */
    @PostMapping("/loginout")
    public R<String> logout(HttpServletRequest request){
        //Clear the user id in session
        request.getSession().removeAttribute("user");
        return R.success("Logout successful");
    }
}
