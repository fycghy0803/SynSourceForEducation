package test.ftp;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import sun.net.ftp.FtpClient;

import com.hysoft.util.forms.FtpForm;
import com.hysoft.util.ftp.FtpClientUtil;

import junit.framework.TestCase;

public class testFtpOperation {
    public static void main(String[] args) throws IOException, Exception {
    	String localPath = "D:/zhtk/cache_pic/normal/tmp0/tk/picture";
     	
	    FtpClientUtil fu = new FtpClientUtil();
    	FtpForm ftpForm = new FtpForm();
    	ftpForm.setFtpAddress("10.87.57.185");
    	ftpForm.setFtpPort(8102);
    	ftpForm.setFtpLoginName("sa");
    	ftpForm.setFtpPwd("sa123");
    	fu.setFtpForm(ftpForm);
    	fu.connect();
    	
    	boolean lb = fu.getFtp().sendSiteCommand("winrar");
    	System.out.println(fu.getFtp().getReplyString());
    	
    	//String[] cms = new String[] {"ftp","/help"};
    	/*Process proc = Runtime.getRuntime().exec("ftp -s:c://ftp.txt");
    	InputStream is = proc.getInputStream();
        InputStreamReader isr = new InputStreamReader(is);
        BufferedReader br = new BufferedReader(isr);
        
        InputStream ise = proc.getErrorStream();
        InputStreamReader isre = new InputStreamReader(ise);
        BufferedReader bre = new BufferedReader(isre);
        
        OutputStream os = proc.getOutputStream();
        OutputStreamWriter osw = new OutputStreamWriter(os);
        //PrintWriter pw = new PrintWriter(osw);
        //testFtpOutputCmd c = new testFtpOutputCmd(pw);
        testFtpInputCmd f = new testFtpInputCmd(br);
        testFtpInputCmd e = new testFtpInputCmd(bre);*/
    }
}
