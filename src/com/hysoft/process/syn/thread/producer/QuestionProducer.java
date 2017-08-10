package com.hysoft.process.syn.thread.producer;
import com.hysoft.process.syn.business.SynDom1DocLibData;
import com.hysoft.process.syn.thread.consumer.QuestionConsumerThread;

public class QuestionProducer extends DataProducerParent{
    public QuestionProducer() {
    	super();
    	try {
			ss = new SynDom1DocLibData(this.connsPool.getSourceSqlServer2000());
			ss.setConnsPool(connsPool);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
   
	@Override
	public void startThread() {
		if(cp == null) {
			cp = new QuestionConsumerThread[this.getConsumerCount()];
			cp[0] = new QuestionConsumerThread();
			cp[0].setPp(this);
			cp[0].run();
		}
	}
}
