package com.hysoft.process.syn.thread.producer;

import com.hysoft.process.syn.business.SynImgsForSql2000;
import com.hysoft.process.syn.thread.consumer.ImgConsumerFor2000Thread;

public class ImgProducerFor2000 extends ImgProducerParent {
	
	public ImgProducerFor2000() {
		super();
		try {
			ss = new SynImgsForSql2000(this.connsPool);
		} catch (Exception e) {
			loger.error(e);
		}
	}
	
	public void startThread() {
		//开始创建执行同步的线程
		if(cp == null) {
			cp = new ImgConsumerFor2000Thread[this.getConsumerCount()];
			cp[0] = new ImgConsumerFor2000Thread();
			cp[0].setPp(this);
			cp[0].run();
		}
	}
}
