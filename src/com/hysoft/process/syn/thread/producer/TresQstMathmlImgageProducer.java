package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.business.SynTresQstMathmlIMgData;
import com.hysoft.process.syn.thread.consumer.TresQstMathmlIMgConsumerThread;

public class TresQstMathmlImgageProducer extends DataProducerParent{
    public TresQstMathmlImgageProducer() {
    	super();
    	try {
			ss = new SynTresQstMathmlIMgData();
			ss.setConnsPool(connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	@Override
	public void startThread() {
		//��ʼ����ִ��ͬ�����߳�
		if(cp == null) {
			cp = new TresQstMathmlIMgConsumerThread[this.getConsumerCount()];
			cp[0] = new TresQstMathmlIMgConsumerThread();
			cp[0].setPp(this);
			cp[0].run();
		}
	}
}
