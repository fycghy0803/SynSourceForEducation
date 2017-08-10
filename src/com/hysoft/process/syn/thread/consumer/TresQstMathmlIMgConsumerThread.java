package com.hysoft.process.syn.thread.consumer;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.syn.SynParent;
import com.hysoft.process.syn.business.SynTresQstMathmlIMgData;

public class TresQstMathmlIMgConsumerThread extends DataConsumerParent {

	public TresQstMathmlIMgConsumerThread() {
	    	super();
	    	this.dataType = "TresQstMathmlIMg";
	}
	
	@Override
	public SynParent getSynparent() {
		SynParent sp = null;
		
		try {
			sp = new SynTresQstMathmlIMgData(this.connsPool.getSourceMysql());
			sp.setConnsPool(this.connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sp;
	}

	@Override
	public int getSynType() {
		return DatabaseSql.TYPE_OPT_MYSQL;
	}
}
