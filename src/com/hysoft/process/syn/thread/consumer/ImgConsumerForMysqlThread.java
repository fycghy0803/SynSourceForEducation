package com.hysoft.process.syn.thread.consumer;

import com.hysoft.process.syn.SynImgs;
import com.hysoft.process.syn.business.SynImgsForMysql;

public class ImgConsumerForMysqlThread extends ImgConsumerParent {

	public ImgConsumerForMysqlThread() {
	   this.dataType = "ImgConsumerForMysql";	
	}
	
	@Override
	public SynImgs getSynImgs() {
		SynImgs si = null;
		try {
			si =  new SynImgsForMysql(this.connsPool);
		} catch (Exception e) {
		}
		
		return si;
	}
}
