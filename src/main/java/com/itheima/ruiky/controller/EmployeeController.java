/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.ruiky.common.R;
import com.itheima.ruiky.entity.Employee;
import com.itheima.ruiky.service.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

@Slf4j
@RestController
@RequestMapping("/employee")
public class EmployeeController {


    @Autowired
    private EmployeeService employeeService;

    /**
     * Login
     * @param request  The employee information after successful login is stored in session and can be retrieved through request.
     * @param employee To get json data from web
     * @return R -- success or fail
     */
    @PostMapping("/login")
    public R<Employee> login(HttpServletRequest request, @RequestBody Employee employee){
        //1. md5 encryption of the password submitted to the page
        String password = employee.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        //2. Query the database according to username
        LambdaQueryWrapper<Employee> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Employee::getUsername,employee.getUsername());
        // Data is unique in database so use getOne
        Employee emp = employeeService.getOne(queryWrapper);
        //3. Compare username, no username found, return login failure
        if (emp == null){
            return R.error("Login failed, username or password is wrong");
        }
        //4. compare password, inconsistent return login failure
        if (!emp.getPassword().equals(password)){
            return R.error("Login failed, username or password is wrong");
        }
        //5. Check the status of the employee, 1 is normal, if it is disabled then return the disabled result
        if (emp.getStatus() == 0){
            return R.error("The account is disabled");
        }
        //6. Login successfully, store the employee information into session and return the login result
        request.getSession().setAttribute("employee",emp.getId());
        return R.success(emp);
    }

    /**
     * Employee logout function
     * @param request
     * @return
     */

    @PostMapping("/logout")
    public R<String> logout(HttpServletRequest request){
        //Clean up the data saved in Session
        request.getSession().removeAttribute("employee");
        return R.success("Logout successful");
    }

    /**
     * Add new employee, do not need add path to PostMapping, add at the same page
     * @param employee
     * @return
     */

    @PostMapping
    public R<String> save(HttpServletRequest request, @RequestBody Employee employee){
        log.info("Add new employee:{}",employee.toString());
        //Set initial password 123456， encrypted by md5
        employee.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));
//        employee.setCreateTime(LocalDateTime.now());
//        employee.setUpdateTime(LocalDateTime.now());
//        //Obtain the user id
//        long empId = (Long) request.getSession().getAttribute("employee");
//        employee.setCreateUser(empId);
//        employee.setUpdateUser(empId);

        employeeService.save(employee);
        return R.success("Add successful");
    }

    /**
     * Paging Searchq
     * @param page
     * @param pageSize
     * @param name For fuzzy query
     * @return
     */
    @GetMapping("/page")
    public R<Page> page(int page,int pageSize,String name){
        log.info("page = {},pageSize={},name={}",page,pageSize,name);
        //Create paging constructor
        Page pageInfo = new Page<>(page,pageSize);
        //Create condition constructor
        LambdaQueryWrapper<Employee> queryWrapper = new LambdaQueryWrapper<>();
        //Add a filter condition
        queryWrapper.like(StringUtils.isNotEmpty(name),Employee::getName,name);
        //Add sort condition
        queryWrapper.orderByDesc(Employee::getUpdateTime);
        //execute
        employeeService.page(pageInfo,queryWrapper);

        return R.success(pageInfo);
    }

    /**
     * Modify employee's information by id
     * @param employee
     * @return
     */
    @PutMapping
    public R<String> update(HttpServletRequest request, @RequestBody Employee employee){
//        Long empId = (Long) request.getSession().getAttribute("employee");
//        log.info(employee.toString());
//        employee.setUpdateTime(LocalDateTime.now());
//        employee.setUpdateUser(empId);
        employeeService.updateById(employee);
        return R.success("Staff information modify successfully");
    }

    /**
     * Search staff's information by id
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public R<Employee> getById(@PathVariable Long id){
        log.info("Search staff info by id");
        Employee employee = employeeService.getById(id);
        if (employee!=null){
            return R.success(employee);
        }
        return R.error("No relevant employee information");
    }
}
