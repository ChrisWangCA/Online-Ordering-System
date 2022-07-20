/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.controller;


import com.itheima.ruiky.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.UUID;

/**
 * File Upload and Download
 */
@RestController
@RequestMapping("/common")
@Slf4j
public class CommonController {
    @Value("${ruiky.path}")
    private String basePath;

    /**
     * Upload file
     * @param file The name must be the same with the front end
     * @return
     */
    @PostMapping("/upload")
    public R<String> update(MultipartFile file){
        log.info(file.toString());

        //Original file name
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        //Use UUID to generate file names, to prevent file overwriting caused by duplicate file names
        String fileName = UUID.randomUUID().toString() + suffix;

        //Creating Directory Objects
        File dir = new File(basePath);
        //Determine if a directory exists
        if (!dir.exists()){
            //not exist
            dir.mkdirs();
        }

        /*
        file is a temporary file that needs to be dumped to the specified location,
        otherwise the temporary file will be deleted after this request is completed
         */
        try {
            file.transferTo(new File(basePath + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return R.success(fileName);
    }

    /**
     * File download
     * @param name
     * @param response
     */
    @GetMapping("/download")
    public void download(String name, HttpServletResponse response){
        //Read file contents via input stream
        try {
            FileInputStream fileInputStream = new FileInputStream(new File(basePath+name));
            //Write the file back to the browser and display it
            ServletOutputStream outputStream = response.getOutputStream();

            response.setContentType("image/jpeg");

            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = fileInputStream.read(bytes))!=-1){
                outputStream.write(bytes,0,len);
                outputStream.flush();
            }
            outputStream.close();
            fileInputStream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
