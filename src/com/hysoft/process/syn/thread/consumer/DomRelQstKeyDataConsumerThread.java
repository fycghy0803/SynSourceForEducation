package com.hysoft.process.syn.thread.consumer;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.syn.SynParent;
import com.hysoft.process.syn.business.SynDomRelQstKeyData;

public class DomRelQstKeyDataConsumerThread extends DataConsumerParent {
    public DomRelQstKeyDataConsumerThread() {
    	super();
    	this.dataType = "QstKey";
    }
	    
	@Override
	public int getSynType() {
		return DatabaseSql.TYPE_OPT_MYSQL;
	}

	public SynParent getSynparent() {
		SynParent sp = null;
		
		try {
			sp = new SynDomRelQstKeyData(this.connsPool.getSourceSqlServer2000());
			sp.setConnsPool(this.connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sp;
	}
}
