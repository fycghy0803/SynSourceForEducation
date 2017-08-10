package test.ftp;

import java.io.BufferedReader;
import java.io.IOException;

public final class testFtpInputCmd implements Runnable {
	Thread th = new Thread(this);
	BufferedReader br;
    public testFtpInputCmd(BufferedReader br ) {
    	this.br = br;
    	th.start();
    }
    
	public void run() {
		String str = "";
		
		try {
			while((str = br.readLine()) != null ) {
				System.out.println(str);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
