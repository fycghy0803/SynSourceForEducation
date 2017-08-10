package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.business.SynDomRelQstTeachData;
import com.hysoft.process.syn.thread.consumer.DomRelQstKeyDataConsumerThread;

public class DomRelQstKeyDataProducer extends DataProducerParent{
    public DomRelQstKeyDataProducer() {
    	super();
    	try {
			ss = new SynDomRelQstTeachData(this.connsPool.getSourceSqlServer2000());
			ss.setConnsPool(connsPool);
		} catch (Exception e) {
			loger.error(e);
		}
    }
   
	@Override
	public void startThread() {
		//开始创建执行同步的线程
		if(cp == null) {
			cp = new DomRelQstKeyDataConsumerThread[this.getConsumerCount()];
			cp[0] = new DomRelQstKeyDataConsumerThread();
			cp[0].setPp(this);
			cp[0].run();
		}
	}
}
