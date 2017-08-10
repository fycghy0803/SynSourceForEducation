package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.business.SynTresQstImageData;
import com.hysoft.process.syn.thread.consumer.TresQstImageConsumerThread;

public class TresQstImgageProducer extends DataProducerParent{
    public TresQstImgageProducer() {
    	super();
    	try {
			ss = new SynTresQstImageData();
			ss.setConnsPool(connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	@Override
	public void startThread() {
		//开始创建执行同步的线程
		if(cp == null) {
			cp = new TresQstImageConsumerThread[this.getConsumerCount()];
			cp[0] = new TresQstImageConsumerThread();
			cp[0].setPp(this);
			cp[0].run();
		}
	}
}
