/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.filter;
import com.alibaba.fastjson.JSON;
import com.itheima.ruiky.common.BaseContext;
import com.itheima.ruiky.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Check user is login
 */
@WebFilter(filterName = "loginCheckFilter",urlPatterns = "/*")
@Slf4j
public class LoginCheckFilter implements Filter {
    //Path matcher, support wildcard
    public static final AntPathMatcher PATH_MATCHER = new AntPathMatcher();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //1. Get the URI of this request
        String requestURI = request.getRequestURI();

        log.info("Intercepted request {}",requestURI);
        //2. Get whether this request needs to be processed
        String[] urls = new String[]{
                "/employee/login",
                "/employee/logout",
                "/backend/**",
                "/front/**",
                "/common/**",
                "/user/sendMsg",
                "/user/login"
        };
        boolean check = check(urls, requestURI);
        //3. If it does not need to be processed then let it go
        if (check){
            log.info("This request {}, no processing required",requestURI);
            filterChain.doFilter(request,response);
            return;
        }
        //4. Determine the login status, if it is logged in, then let it go
        if (request.getSession().getAttribute("employee")!=null){
            log.info("User already login, id:{}",request.getSession().getAttribute("employee"));
            Long empId = (Long) request.getSession().getAttribute("employee");
            BaseContext.setCurrentId(empId);
            filterChain.doFilter(request,response);
            return;
        }
        //4.1 For mobile: Determine the login status, if it is logged in, then let it go
        if (request.getSession().getAttribute("user")!=null){
            log.info("User already login, id:{}",request.getSession().getAttribute("user"));
            Long userId = (Long) request.getSession().getAttribute("user");
            BaseContext.setCurrentId(userId);
            filterChain.doFilter(request,response);
            return;
        }

        log.info("User not login");
        //5. If not logged in, then return the result of not logged in
        response.getWriter().write(JSON.toJSONString(R.error("NOTLOGIN")));
        return;

    }


    /**
     * Check whether the request needs to be login in
     * @param requestURI
     * @return
     */
    public boolean check(String[] urls,String requestURI){
        for (String url : urls) {
            boolean match = PATH_MATCHER.match(url, requestURI);
            if (match){
                return true;
            }
        }
        return false;
    }
}
