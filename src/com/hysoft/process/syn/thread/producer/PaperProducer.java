package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.business.SynTresPaperData;
import com.hysoft.process.syn.thread.consumer.PapgerConsumerThread;

public class PaperProducer extends DataProducerParent{
    public PaperProducer() {
    	super();
    	try {
			ss = new SynTresPaperData();
			ss.setConnsPool(connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	@Override
	public void startThread() {
		//开始创建执行同步的线程
		if(cp == null) {
			cp = new PapgerConsumerThread[this.getConsumerCount()];
			cp[0] = new PapgerConsumerThread();
			cp[0].setPp(this);
			cp[0].run();
		}
	}
}
