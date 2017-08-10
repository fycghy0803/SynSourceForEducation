package com.hysoft.util.zip;

public class UnzipFilesThread implements Runnable {
    Thread th = new Thread(this);
    private String path = "";
    
    public UnzipFilesThread(String path){
        this.path = path;
    }
    
	public void run() {
		while(true) {
		   ZipUtil zipUtil = new ZipUtil();
		   zipUtil.unzip(path);
		   
		   try {
			  Thread.sleep(1000 * 60 * 60);
		   } catch (InterruptedException e) {
				e.printStackTrace();
		   }
		}
	}
	
	public void start() {
		th.start();
	}
}
