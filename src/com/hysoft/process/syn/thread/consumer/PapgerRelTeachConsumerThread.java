package com.hysoft.process.syn.thread.consumer;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.syn.SynParent;
import com.hysoft.process.syn.business.SynTresPaperRelTeach;

public class PapgerRelTeachConsumerThread extends DataConsumerParent {

	public PapgerRelTeachConsumerThread() {
	    	super();
	    	this.dataType = "PaperRelTeach";
	}
	
	@Override
	public SynParent getSynparent() {
		SynParent sp = null;
		
		try {
			sp = new SynTresPaperRelTeach(this.connsPool.getSourceMysql(),this.connsPool.getSourceSqlServer2000());
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
