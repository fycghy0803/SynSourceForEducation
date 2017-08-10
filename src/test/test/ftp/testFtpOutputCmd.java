package test.ftp;

import java.io.PrintWriter;

public final class testFtpOutputCmd implements Runnable {
	Thread th = new Thread(this);
	PrintWriter br;
    public testFtpOutputCmd(PrintWriter br ) {
    	this.br = br;
    	th.start();
    }
    
	public void run() {
			br.println("sa");
			br.println("sa123");
			br.println("prompt");
			br.println("mput *.*");
	
	}
}
