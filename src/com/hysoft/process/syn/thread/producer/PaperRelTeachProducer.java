package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.business.SynTresPaperRelTeach;
import com.hysoft.process.syn.thread.consumer.PapgerRelTeachConsumerThread;

public class PaperRelTeachProducer extends DataProducerParent{
    public PaperRelTeachProducer() {
    	super();
    	try {
			ss = new SynTresPaperRelTeach();
			ss.setConnsPool(connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	@Override
	public void startThread() {
		//开始创建执行同步的线程
		if(cp == null) {
			cp = new PapgerRelTeachConsumerThread[this.getConsumerCount()];
			cp[0] = new PapgerRelTeachConsumerThread();
			cp[0].setPp(this);
			cp[0].run();
		}
	}
}
