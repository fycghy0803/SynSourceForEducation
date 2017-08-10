package com.hysoft.process.syn;

public class SynMessages {
   private static String currMsg = "";
   
   public static void setCurrentMsg(String msg ){
	   currMsg = msg;
   }
   
   public static String getCurrentMsg(){
	  return currMsg;   
   }  
}
