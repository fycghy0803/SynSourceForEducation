package com.hysoft.process.syn.business;

import java.sql.Connection;

import com.hysoft.process.database.source.SelectDao;
import com.hysoft.process.database.source.sqlserver2000.dao.Doc1DoclibDao;
import com.hysoft.process.database.target.dao.SourceDao;
import com.hysoft.process.database.target.dao.sub.TresQuestionDao;
import com.hysoft.process.syn.SynParent;

public class SynDom1DocLibData extends SynParent {

	public SynDom1DocLibData(Connection conn) throws Exception {
		super();
		this.conn = conn;
	}

	@Override
	public SelectDao getSourceDao() throws Exception {
		Doc1DoclibDao dom1Dao = new Doc1DoclibDao();
		dom1Dao.setConnection(this.getConnSqlServer2000());
		return dom1Dao;
	}

	@Override
	public SourceDao getTargetDao() throws Exception {
		TresQuestionDao tDao = new TresQuestionDao();
		return tDao;
	}
}
