package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.SynImgs;

public abstract class ImgProducerParent extends ProducerParent {
    protected SynImgs ss = null;
	public void run() {
		while(true) {
			ss.setConnsPool(this.connsPool);
			int count = ss.getSpDao().getCount();
			pageCount = ss.getPageCount();
			loger.info("SynImgs,total count:" + count + ",total Page count:" + pageCount);
						
			startThread();
			
			try {
				Thread.sleep(THREAD_SLEEP_TIME);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	public abstract void startThread();
}
