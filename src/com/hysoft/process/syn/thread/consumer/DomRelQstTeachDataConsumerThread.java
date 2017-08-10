package com.hysoft.process.syn.thread.consumer;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.syn.SynParent;
import com.hysoft.process.syn.business.SynDomRelQstTeachData;

public class DomRelQstTeachDataConsumerThread extends DataConsumerParent {
    public DomRelQstTeachDataConsumerThread() {
    	super();
    	this.dataType = "QstTeach";
    }
    
	@Override
	public int getSynType() {
		return DatabaseSql.TYPE_OPT_MYSQL;
	}

	public SynParent getSynparent() {
		SynParent sp = null;
		
		try {
			sp = new SynDomRelQstTeachData(this.connsPool.getSourceSqlServer2000());
			sp.setConnsPool(this.connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sp;
	}
}
