package test.syn;

import com.hysoft.util.forms.FtpForm;
import com.hysoft.util.ftp.FtpClientUtil;

public class TestFtp {
   public static void main(String[] args) {
	   FtpClientUtil ft = new FtpClientUtil();
	   
	   try {
		   FtpForm ff = new FtpForm();
		   ff.setFtpAddress("127.0.0.1");
		   ff.setFtpPort(21);
		   ff.setFtpLoginName("sa");
		   ff.setFtpPwd("sa123");
		   ft.setFtpForm(ff);
		   ft.connect();
		   ft.getFtp().changeWorkingDirectory("/");
		   boolean file = (ft.getFtp()).changeWorkingDirectory("/formula/100/624/");
		   System.out.println(file);
	   } catch (Exception e) {
		  e.printStackTrace();
	   }
	   
	   try {
		ft.upLoadDirectory("formula", "e:\\formula", "e:\\formula");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   
   
}
