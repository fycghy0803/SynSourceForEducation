package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.business.SynDomRelQstTeachData;
import com.hysoft.process.syn.thread.consumer.DomRelQstTeachDataConsumerThread;

public class DomRelQstTeachDataProducer extends DataProducerParent{
    public DomRelQstTeachDataProducer() {
    	super();
    	try {
			ss = new SynDomRelQstTeachData(this.connsPool.getSourceSqlServer2000());
			ss.setConnsPool(connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
   
	@Override
	public void startThread() {
		//��ʼ����ִ��ͬ�����߳�
		if(cp == null) {
			cp = new DomRelQstTeachDataConsumerThread[this.getConsumerCount()];
			cp[0] = new DomRelQstTeachDataConsumerThread();
			cp[0].setPp(this);
			cp[0].run();
		}
	}
}
