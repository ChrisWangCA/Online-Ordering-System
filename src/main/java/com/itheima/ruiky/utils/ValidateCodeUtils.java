/**
 * @Author Chris Wang
 */
package com.itheima.ruiky.utils;

import java.util.Random;

/**
 * Randomly generated CAPTCHA tool class
 */
public class ValidateCodeUtils {
    /**
     * Randomly generated verification code
     * @param length Length of 4 or 6 digits
     * @return
     */
    public static Integer generateValidateCode(int length){
        Integer code =null;
        if(length == 4){
            code = new Random().nextInt(9999);//Generate random numbers up to 9999
            if(code < 1000){
                code = code + 1000;//Guaranteed 4-digit random number
            }
        }else if(length == 6){
            code = new Random().nextInt(999999);//Generate random numbers up to 999999
            if(code < 100000){
                code = code + 100000;//Guaranteed random number is 6 digits
            }
        }else{
            throw new RuntimeException("Can only generate 4 or 6-digit verification codes");
        }
        return code;
    }

    /**
     * Randomly generate a verification code with a specified length string
     * @param length
     * @return
     */
    public static String generateValidateCode4String(int length){
        Random rdm = new Random();
        String hash1 = Integer.toHexString(rdm.nextInt());
        String capstr = hash1.substring(0, length);
        return capstr;
    }
}
