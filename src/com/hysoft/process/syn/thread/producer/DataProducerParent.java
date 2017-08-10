package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.SynParent;

public abstract class DataProducerParent extends ProducerParent{
    protected SynParent ss;
    
	public void run() {
		ss.init();
		ss.setConnsPool(this.connsPool);
		
		while(true) {
			int count = ss.getSDao().getCount();
			pageCount = ss.getPageCount();
			loger.info("DataProducerParent,total count:" + count + ",total Page count:" + pageCount);
			
			startThread(); //��ʼִ��ͬ������
			
			try {
				Thread.sleep(THREAD_SLEEP_TIME);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	public abstract void startThread();
}
