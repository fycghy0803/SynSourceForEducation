package com.hysoft.process.syn.thread.consumer;

import java.util.Date;
import com.hysoft.process.syn.SynParent;

public abstract class DataConsumerParent extends ConcumerParent {
	public void run() {
		SynParent ss = getSynparent();
		ss.init();
		
		try {
			int tempPageCount = ss.getPageCount();
			for(int i = 0; i < tempPageCount;i++) {
				ss.init();
				ss.setCurrentPage(i);
				ss.synRun(getSynType());
			}
		} catch (Exception e) {
			e.printStackTrace();
		    loger.error(e);
		}finally{
			loger.info( this.dataType + ": end," + new Date());
		}
	}
	
	public abstract SynParent getSynparent();
	public abstract int getSynType();
}
