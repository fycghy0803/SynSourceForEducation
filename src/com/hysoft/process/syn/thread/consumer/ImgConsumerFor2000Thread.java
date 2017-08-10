package com.hysoft.process.syn.thread.consumer;


import com.hysoft.process.syn.SynImgs;
import com.hysoft.process.syn.business.SynImgsForSql2000;

public class ImgConsumerFor2000Thread extends ImgConsumerParent {
    public ImgConsumerFor2000Thread() {
    	this.dataType = "ImgConsumerFor2000";
    }
	
	@Override
	public SynImgs getSynImgs() {
		SynImgs si = null;
		try {
			si =  new SynImgsForSql2000(this.connsPool);
		} catch (Exception e) {
		}
		
		return si;
	}
	
}
