package com.hysoft.util;

/**
 * Created by dell on 2015-03-27.
 */
public class CommonTools {

    public static String getStr(Object currObj){
        if(currObj== null){
            return "";
        }
        return currObj.toString();
    }
    public static boolean isEmpty(Object currObj){
        if(currObj== null || "".equals(currObj)){
            return true;
        }else{
            return false;
        }
    }

    public static  boolean isNotEmpty(Object currObj){
        return !isEmpty(currObj);
    }

    public static String trimArray(String source){
        String retVal = "";
        if(isEmpty(source)){
            retVal = "";
        }else{
            if(source.startsWith("[")){
                source = source.substring(1);
            }
            if(source.endsWith(("]"))){
                source = source.substring(0,source.length()-1);
            }
            retVal = source;
        }
        return retVal;
    }

}
