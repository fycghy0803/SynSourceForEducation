package com.hysoft.process.syn.thread.consumer;

import com.hysoft.process.database.DatabaseSql;
import com.hysoft.process.syn.SynParent;
import com.hysoft.process.syn.business.SynDom1DocLibData;

public class QuestionConsumerThread extends DataConsumerParent {

	public QuestionConsumerThread() {
    	super();
    	this.dataType = "Question";
    }
	
	@Override
	public int getSynType() {
		return DatabaseSql.TYPE_OPT_2000;
	}

	public SynParent getSynparent() {
		SynParent sp = null;
		
		try {
			sp = new SynDom1DocLibData(this.connsPool.getSourceSqlServer2000());
			sp.setConnsPool(this.connsPool);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sp;
	}
}
