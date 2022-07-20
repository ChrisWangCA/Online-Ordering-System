/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.config;

import com.itheima.ruiky.common.JacksonObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.util.List;

@Slf4j
@Configuration
public class WebMvcConfig extends WebMvcConfigurationSupport {

    /**
     * Setting up static resource mapping, because I didn't put front file in static folder
     * @param registry
     */
    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.info("Start static resource mapping...");
        registry.addResourceHandler("/backend/**").addResourceLocations("classpath:/backend/");
        registry.addResourceHandler("/front/**").addResourceLocations("classpath:/front/");
    }


    /**
     * Extending the mvc framework for message converter
     * @param converters
     */
    @Override
    protected void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
        //Create message converter object
        MappingJackson2HttpMessageConverter messageConverter = new MappingJackson2HttpMessageConverter();
        //Set Object converter, use of Jackson to convert Java objects to json
        messageConverter.setObjectMapper(new JacksonObjectMapper());
        //Append the above message converter object to the converter collection of the mvc framework
        converters.add(0,messageConverter);
    }
}
