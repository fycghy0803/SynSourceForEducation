package com.hysoft.process.syn.thread.consumer;

import java.util.Date;
import com.hysoft.process.syn.SynImgs;

public abstract class ImgConsumerParent extends ConcumerParent {

	public void run() {
		int sleepTime = 1000 * 5;
		int currPage = 0;
		
		SynImgs ss = null;
			
		try {
			ss = getSynImgs();
			int  tempPageCount = ss.getPageCount();
			
			for(int i = 0;i<tempPageCount;i++) {
				ss.init();
				currPage = i;
				loger.info("ImgConsumerFor2000Thread: currentPage=" + i + "," + new Date());
				ss.setCurrPage(i);
				ss.uploadFile();
			}
		} catch (Exception e) {
		    loger.error(e + "; ImgConsumerFor2000Thread,currentPage = " + currPage);
		}finally{
			loger.info("ImgConsumerFor2000Thread: end," + new Date());
		}
		
		try {
			Thread.sleep(sleepTime);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	public abstract SynImgs getSynImgs();
}
