package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.business.SynImgsForMysql;
import com.hysoft.process.syn.thread.consumer.ImgConsumerForMysqlThread;

public class ImgProducerForMysql extends ImgProducerParent {
	public ImgProducerForMysql() {
		super();
		try {
			ss = new SynImgsForMysql(this.connsPool);
		} catch (Exception e) {
		}
	}

	@Override
	public void startThread() {
		//��ʼ����ִ��ͬ�����߳�
		if(cp == null) {
			cp = new ImgConsumerForMysqlThread[this.getConsumerCount()];
			cp[0] = new ImgConsumerForMysqlThread();
			cp[0].setPp(this);
			cp[0].run();
			
		}
	}
}
