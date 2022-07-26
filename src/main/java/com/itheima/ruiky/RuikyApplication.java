package com.itheima.ruiky;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @Author Chris Wang
 */

@Slf4j
@SpringBootApplication
@ServletComponentScan
@EnableTransactionManagement
@EnableCaching
public class RuikyApplication {
    public static void main(String[] args) {
        SpringApplication.run(RuikyApplication.class,args);
        log.info("Project start successful...");
    }
}
